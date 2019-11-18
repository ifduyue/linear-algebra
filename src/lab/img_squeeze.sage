# Compress the image
from PIL import Image

def img_squeeze(fn_in, fn_out, percent):
    """Squeeze an image using Singular Value Decomposition.
        fn_in, fn_out  string  name of file
        percent  real in 0..1  Fraction of singular values to use
    """
    img = Image.open(fn_in)
    img = img.convert("RGB")
    rows, cols = img.size
    print "image has",rows,"rows and",cols,"columns"
    dim_bound = min(rows, cols)  # for non-square images
    cutoff = int(round(percent*min(rows,cols),0))
    # Gather data into three arrays, then give to Sage's matrix()
    rd, gr, bl = [], [], []
    for row in range(rows):
        for a in [rd, gr, bl]:
           a.append([])
        for col in range(cols):
            r, g, b = img.getpixel((int(row), int(col)))
            rd[row].append(r)
            gr[row].append(g)
            bl[row].append(b)
    RD, GR, BL = matrix(RDF, rd), matrix(RDF, gr), matrix(RDF, bl)
    # Get the SVDs
    # print "about to get the svd"
    U_RD,Sigma_RD,V_RD = RD.SVD()
    U_GR,Sigma_GR,V_GR = GR.SVD()
    U_BL,Sigma_BL,V_BL = BL.SVD()
    # Have a look
    for i in range(8):
        print "sigma_RD",i,"=",round(Sigma_RD[i][i], 2)
    print "  :"
    print "sigma_RD",cutoff,"=",round(Sigma_RD[cutoff][cutoff], 2)
    print "  :"
    print "Sigma_RD.nrows()",Sigma_RD.nrows()
    for i in range(dim_bound-8, dim_bound):
        print " at bottom, sigma_RD",i,"=",round(Sigma_RD[i][i], 2)
    # Compute sigma_1 u_1 v_1^trans+ ..
    a=[]
    for i in range(rows):     
        a.append([])
        for j in range(cols):
            a[i].append(0)
    A_RD, A_GR, A_BL = matrix(RDF, a), matrix(RDF, a), matrix(RDF, a)
    for i in range(cutoff):
        sigma_i = Sigma_RD[i][i]
	# print "Sigma_RD.nrows()=",Sigma_RD.nrows(),"Sigma_RD.ncols()=",Sigma_RD.ncols() 
	# print "about to find sigma_i U_RD.column(i).transpose()"
	# print "   U_RD.column(i)=", U_RD.column(i) 
	# print "   U_RD.column(i).column().transpose()=", U_RD.column(i).column().transpose() 
        u_i = matrix(RDF, U_RD.column(i).column())
	# print "u_i.nrows()=",u_i.nrows()," .ncols()=",u_i.ncols() 
	# print "   just found sigma_i U_RD.column(i).transpose()"
        v_i = matrix(RDF, V_RD.column(i).column().transpose())
	# print "v_i.nrows()=",v_i.nrows()," .ncols()=",v_i.ncols() 
        A_RD = copy(A_RD)+sigma_i*u_i*v_i
	# print "Finished RD; about to do GR"
        sigma_i = Sigma_GR[i][i]
        u_i = matrix(RDF, U_GR.column(i).column())
        v_i = matrix(RDF, V_GR.column(i).column().transpose())
	# print "about to increment A_GR"
	# print "size of sigma_i*u_i*v_i: ",(sigma_i*u_i*v_i).nrows()," by ",(sigma_i*u_i*v_i).ncols()
        A_GR = copy(A_GR)+sigma_i*u_i*v_i
	# print "about to do BL"
        sigma_i = Sigma_BL[i][i]
        u_i = matrix(RDF, U_BL.column(i).column())
        v_i = matrix(RDF, V_BL.column(i).column().transpose())
        A_BL = copy(A_BL)+sigma_i*u_i*v_i
    # Make a new image
    img_squoze = Image.new("RGB", img.size)
    for row in range(rows):
        print "transferring row=", row, "out of", rows
        for col in range(cols):
            p = (int(A_RD[row][col]), 
                 int(A_GR[row][col]), 
                 int(A_BL[row][col]))
            img_squoze.putpixel((row,col), p)
    img_squoze.save(fn_out)
