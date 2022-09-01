# Show Gauss's method and Gauss-Jordan reduction steps. 
# 2012-Apr-20  Jim Hefferon  Public Domain. 
# 2019-Nov-09 JH  Minor reformatting
# 2020-Feb-05 JH  Add LaTeX output
# 2021-Oct-08 JH  Special case so in "1\rho_3+\rho_4" it omits the "1"

# Typical usage:
# sage: P = matrix(QQ, [[3, 0, 2], [2,2,0], [1,4,-2]])
# sage: w = vector(QQ, [1 ,0 ,-1])
# sage: P_prime=P.augment(w, subdivide=True)
# sage: gauss_method(P_prime, latex=True)

def latex_matrix(M):
    """Express the matrix as LaTeX code
      M  Matrix
    """
    r = []
    if (M._subdivisions):
	r.append("\\begin{amat}{%d}\n" % (M.ncols()-1))
    else:
	r.append("\\begin{mat}\n")		 
    for row in range(M.nrows()):
        r.append("  ")
    	for col in range(M.ncols()):
	    if col > 0:
	       r.append("&")
	    r.append(str(M[row,col]))
	    r.append("  ")
	r.append("\\\\ \n")
    if (M._subdivisions):
	r.append("\\end{amat}") 
    else:
	r.append("\\end{mat}")
    return "".join(r)

def convert_triple_for_grstep(t):
    """Input a triple, output a string of LaTeX code for expressing that
    as a Gauss's method step
      t  (factor, used_row, changed_row)
    If factor is None then the reduction step is a swap.  If used_row is None
    then the reduction step is a rescaling.
    """
    (factor, used_row, changed_row) = t
    if factor is None:  # swap rows
        return "\\rho_{%d}\leftrightarrow \\rho_{%d}" % (used_row,changed_row)
    elif used_row is None:  # rescaling
        if factor in ZZ:
	    if factor == 1:  # should not ever happen
                return "\\rho_{%d}" % (changed_row,)
            elif factor == -1:
                return "-\\rho_{%d}" % (changed_row, )
            else:
                return "%d\\rho_{%d}" % (factor, changed_row)
	else:
            return "(%s)\\rho_{%d}" % (str(factor), changed_row)
    else:
        if factor in ZZ:
	    if factor == 1:
                return "\\rho_{%d}+\\rho_{%d}" % (used_row, changed_row)
            elif factor == -1:
                return "-\\rho_{%d}+\\rho_{%d}" % (used_row, changed_row)
            else:
                return "%d\\rho_{%d}+\\rho_{%d}" % (factor, used_row, changed_row)
	else:
            return "(%s)\\rho_{%d}+\\rho_{%d}" % (str(factor), used_row, changed_row)

def grstep(a):
    """Given a sequence of Gauss method steps, make a \grstep arrow
      a  array of triples (factor, used_row, changed_row)
    If factor is None then the reduction step is a swap.  If used_row is None
    then the reduction step is a rescaling.
    """
    # print "  --> about to do grstep a="+str(a)
    r = ["\grstep"]  
    s = []  # inside square brackets
    if len(a)>1:
       for t in a[1:]:
       	   s.append(convert_triple_for_grstep(t))
       r.append("[" + (" \\\\ ".join(s)) + "]")
    r.append("{" + convert_triple_for_grstep(a[0]) + "}")
    return "".join(r)


# Naive Gaussian reduction
def gauss_method(M, rescale_leading_entry=False, latex=False):
    """Describe the reduction to echelon form of the given matrix of 
    rationals.
      M  matrix of rationals   e.g., M = matrix(QQ, [[..], [..], ..])
      rescale_leading_entry=False  boolean  make leading entries to 1's
      latex=False  The steps that are printed will be LaTeX code
    Returns: None.  Side effects: M is reduced, steps are printed.  
    Note that this is echelon form, not reduced echelon form, and that 
    this routine does not end the same way as does M.echelon_form().
    """
    num_rows=M.nrows()
    num_cols=M.ncols()
    if latex:
        print(latex_matrix(M))
    else:
        print M    

    col = 0   # all cols before this are already done
    for row in range(0,num_rows): 
        # Do we need to swap in a nonzero entry from below?
        while (col < num_cols
               and M[row][col] == 0): 
            for i in M.nonzero_positions_in_column(col):
	        if i > row:
		    if latex:
		        print(grstep([(None,row+1,i+1)]))
		    else:
			print " swap row", row+1, "with row", i+1
		    M.swap_rows(row,i)
                    if latex:
		        print(latex_matrix(M))
		    else:
		        print(M)
                    break     
            else:
                col += 1

        if col >= num_cols:
            break

        # print "Right before rescaling leading entry"
        # Now we are guaranteed M[row][col] != 0
        if (rescale_leading_entry
           and M[row][col] != 1):
	    if latex:
	        print(grstep([(1/M[row][col], None, row+1)]))
	    else:
                print " take", 1/M[row][col], "times row", row+1
            M.rescale_row(row,1/M[row][col])
	    if latex:
	        print(latex_matrix(M))
	    else:
	        print M 
        change_flag, a = False, []   # a = if latexing, save changes as triples
        # print "Right before orw mixture"
        for changed_row in range(row+1,num_rows):
            # print "  changed_row="+str(changed_row)
	    # a = []  # if latexing, save changes as triples
            if M[changed_row][col] != 0:
                change_flag=True
                factor=-1*M[changed_row][col]/M[row][col]
		if latex:
		    a.append((factor, row+1, changed_row+1))
		else:
                    print " take", factor, "times row", row+1, "plus row", changed_row+1
                M.add_multiple_of_row(changed_row,row,factor)
	# print "about to print step and matrix"
        if change_flag:
	    if latex:
	        print(grstep(a))
		print(latex_matrix(M))
	    else:
                print M
	# print "about to increment column"
        col +=1

# Naive Gauss-Jordan reduction
# Use as: 
#   sage: load('../gauss_method.sage')
#   sage: M = matrix(QQ, [[2,1,0], [1,0,-1], [1,-1,-3]])
#   sage: gauss_jordan(M, latex=True)
def gauss_jordan(M, latex=False):
    """Describe the reduction to reduced echelon form of the 
    given matrix of rationals.
      M  matrix of rationals   e.g., M = matrix(QQ, [[..], [..], ..])
      latex=False  Print out latex code instead of just Sage reps
    Returns: None.  Side effects: M is reduced, steps are printed.
    """
    gauss_method(M,rescale_leading_entry=False,latex=latex)
    # Get list of leading entries [le in row 0, le in row1, ..]
    pivot_list=M.pivots()
    # Rescale leading entries
    change_flag=False
    a = []  # if latexing, save changes as triples
    for row in range(0,len(pivot_list)):
        col=pivot_list[row]
        if M[row][col] != 1:
            change_flag=True
	    if latex:
	        a.append( (1/M[row][col], None, row+1) )
	    else:
                print " take",1/M[row][col],"times row",row+1
            M.rescale_row(row,1/M[row][col])
    if change_flag:
        if latex:
            print( grstep(a) )
	    print(latex_matrix(M))
        else:
            print M    
    # Pivot
    for row in range(len(pivot_list)-1,-1,-1):
        col=pivot_list[row]
        change_flag=False
	a = []  # if latexing, save changes as triples
        for changed_row in range(0,row):
            if M[changed_row,col] != 0:
                change_flag=True
                factor=-1*M[changed_row][col]/M[row][col]
		if latex:
		    a.append( (factor,row+1,changed_row+1) )
		else:
                    print " take",factor,"times row",   \
                          row+1,"plus row",changed_row+1 
                M.add_multiple_of_row(changed_row,row,factor)
        if change_flag:
	    if latex:
	        print(grstep(a))
		print(latex_matrix(M))
	    else:
                print M


    