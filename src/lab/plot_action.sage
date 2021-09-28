# plot_action.sage
# 2012-Dec-04 JH
# 2019-Nov-25 JH

DOT_SIZE = .02
CIRCLE_THICKNESS = 2
def color_circle_list(a, b, c, d, colors, full_circle=False):
    """Return list of graph instances for the action of a 2x2 matrix on 
    half of the unit circle.  That circle is broken into chunks each
    colored a different color.
      a, b, c, d  reals  entries of the matrix ul, ur, ll, lr
      colors  list of rgb tuples; len of this list is how many chunks
      full_circle=False  Show a full circle instead
    """
    r = []
    if full_circle:
        p = 2*pi
    else:
        p = pi
    t = var('t')
    n = len(colors)
    for i in range(n):
        color = colors[i]
        x(t) = a*cos(t)+b*sin(t)
        y(t) = c*cos(t)+d*sin(t)
        g = parametric_plot((x(t), y(t)), 
                            (t, p*i/n, p*(i+1)/n), 
                            color = color, thickness=CIRCLE_THICKNESS)
        r.append(g)
        r.append(circle((x(p*i/n), y(p*i/n)), DOT_SIZE, color=color))
    if not(full_circle):    # show (x,y)=(-1,0) is omitted
        r.append(circle((x(pi), y(pi)), 2*DOT_SIZE, color='black', 
                        fill = 'true'))
        r.append(circle((x(pi), y(pi)), DOT_SIZE, color='white', 
                        fill = 'true'))
    return r


def plot_circle_action(a, b, c, d, n = 12, full_circle = False):
    """Show the action of the matrix with entries a, b, c, d on half
    of the unit circle, broken into a number of colors.
     a, b, c, d  reals  Entries are upper left, ur, ll, lr.
     n = 12  positive integer  Number of colors.
     full_circle=False  boolean  Show whole circle, or top half
    """
    colors = rainbow(n)
    G = Graphics()  # holds graph parts until they are to be shown
    for g_part in color_circle_list(a,b,c,d,colors,full_circle):
        G += g_part
    return plot(G)    


SQUARE_THICKNESS = 1.75  # How thick to draw the curves
ZORDER = 5    # Draw the graph over the axes
def color_square_list(a, b, c, d, colors):
    """Return list of graph instances for the action of a 2x2 matrix 
    on a unit square.  That square is broken into sides, each colored a 
    different color.
      a, b, c, d  reals  entries of the matrix
      colors  list of rgb tuples; len of this list is at least four
    """
    r = []
    t = var('t')
    # Four sides, ccw around square from origin
    r.append(parametric_plot((a*t, c*t), (t, 0, 1), 
                             color = colors[0], zorder=ZORDER, 
                             thickness = SQUARE_THICKNESS))
    r.append(parametric_plot((a+b*t, c+d*t), (t, 0, 1), 
                             color = colors[1], zorder=ZORDER, 
                             thickness = SQUARE_THICKNESS))
    r.append(parametric_plot((a*(1-t)+b, c*(1-t)+d), (t, 0, 1), 
                              color = colors[2], zorder=ZORDER, 
                              thickness = SQUARE_THICKNESS))
    r.append(parametric_plot((b*(1-t), d*(1-t)), (t, 0, 1), 
                             color = colors[3], zorder=ZORDER, 
                             thickness = SQUARE_THICKNESS))
    # Dots make a cleaner join between edges
    r.append(circle((a, c), DOT_SIZE, 
                    color = colors[0], zorder = 2*ZORDER, 
                    thickness = SQUARE_THICKNESS*1.25, fill =  True))
    r.append(circle((a+b, c+d), DOT_SIZE, 
                    color = colors[1], zorder = 2*ZORDER+1, 
                    thickness = SQUARE_THICKNESS*1.25, fill =  True))
    r.append(circle((b, d), DOT_SIZE, 
                    color = colors[2], zorder = ZORDER+1, 
                    thickness = SQUARE_THICKNESS*1.25, fill =  True))
    r.append(circle((0, 0), DOT_SIZE, 
                    color = colors[3], zorder = ZORDER+1, 
                    thickness = SQUARE_THICKNESS*1.25, fill =  True))
    return r

def plot_square_action(a, b, c, d):
    """Show the action of the matrix with entries a, b, c, d on half
    of the unit circle, as the circle and the output curve, broken into  
    colors.
     a, b, c, d  reals  Entries are upper left, ur, ll, lr.
    """
    colors = ['red', 'orange', 'green', 'blue']  
    G = Graphics()        # hold graph parts until they are to be shown
    for g_part in color_square_list(a,b,c,d,colors):
        G += g_part
    p = plot(G)
    return p  

EPSILON = 0.25
ARROW_THICKNESS = .25
def point_list(a, b, c, d, pts, colors=None):
    """Show the action of the matrix with entries a, b, c, d on the
    points.
      a, b, c, d  reals  Upper left, ur, ll, lr or matrix.
      pts  list of pairs of reals
      colors = None  list of colors
    """  
    r = []
    for dex, pt in enumerate(pts):
        x, y = pt
        f_x = a*x + b*y 
        f_y = c*x + d*y   
        if colors:
            color = colors[dex]
        else:
            color = 'lightgray'
        if ((abs(x-f_x) < EPSILON) and (abs(y-f_y) < EPSILON)):
            r.append(circle(pt, DOT_SIZE, color=color, 
                            thickness=ARROW_THICKNESS))
        else:
            r.append(arrow(pt, (f_x,f_y), color=color, 
                     width=ARROW_THICKNESS))
    return r

def point_grid(max_x, max_y):
    """Return a grix of points (x,y).
      max_x, max_y  positive integers
    """
    r = []
    for x in range(-1*max_x,max_x+1):
        for y in range(-1*max_y,max_y+1):
            r.append((x,y))
    return r

def plot_point_action(a, b, c, d, pts,colors=None):
    """Show the action of the matrix with entries a, b, c, d on the
    points.
      a, b, c, d  reals  Upper left, ur, ll, lr or matrix.
      pt_list  list of pairs of reals
    """  
    if colors is None:
        colors = ["gray",]*len(pts)
    G =  Graphics()
    for action_arrow in point_list(a,b,c,d,pts,colors=colors):
        G += action_arrow
    p = plot(G)
    return p

BA_THICKNESS = 1.5
def before_after_list(a, b, c, d, pts, colors=None):
    """Show the action of the matrix with entries a, b, c, d on the
    points by showning the vector before and after in the same color.
      a, b, c, d  reals  Upper left, ur, ll, lr or matrix.
      pts  list of pairs of reals
      colors = None  list of colors
    """  
    r = []
    for dex, pt in enumerate(pts):
        x, y = pt
        v = vector(RDF, pt)
        M = matrix(RDF, [[a, b], [c, d]])
        f_x, f_y = M*v
        if colors:
            color = colors[dex]
        else:
            color = 'lightgray'
        if ((abs(x-f_x) < EPSILON) and (abs(y-f_y) < EPSILON)):
            r.append(circle(pt, DOT_SIZE, color=color, 
                            thickness=BA_THICKNESS))
        else:
            r.append(arrow((0,0), (x,y), color=color, 
                     width=BA_THICKNESS, arrowsize=2*BA_THICKNESS))
            r.append(arrow((0,0), (f_x,f_y), color=color, 
                     width=BA_THICKNESS, arrowsize=2*BA_THICKNESS))
    return r

def plot_before_after_action(a, b, c, d, pts, colors=None):
    """Show the action of the matrix with entries a, b, c, d on the
    points.
      a, b, c, d  reals  Upper left, ur, ll, lr or matrix.
      pt_list  list of pairs of reals; the before pts to show
    """  
    if colors is None:
        colors = ["gray",]*len(pts)
    G =  Graphics()
    for ba in before_after_list(a,b,c,d,pts,colors=colors):
        G += ba
    p = plot(G)
    return p

# Find the signed angle between the planar vector v and Mv
# See http://math.stackexchange.com/a/879474/12012
def find_angles(a,b,c,d,num_pts,lower_limit=None,upper_limit=None):
    """Apply the matrix to points around the upper half circle, and 
    return the angle between the input and output vectors.
      a, b, c, d  reals  Upper left, ur, ll, lr of matrix.
      num_pts  positive integer  number of points
      lower_limit=0, upper_limit=pi  ignore angles outside these limits
    """
    if lower_limit is None:
        lower_limit=0
    if upper_limit is None:
        upper_limit=pi
    r = []
    M = Matrix(RDF, [[a, b], [c, d]])
    for i in range(num_pts):
        t = i*pi/num_pts
        if ((t<lower_limit) or (t>upper_limit)):
            continue
        pt = (cos(t), sin(t))
        v = vector(RDF, pt)
        w = M*v
        try:
            dot = v[0]*w[0] + v[1]*w[1]  # dot product
            det = v[0]*w[1] - v[1]*w[0]  # determinant
            angle = atan2(det, dot)      # atan2(y, x) or atan2(sin, cos)
        except:
            angle = None
        r.append((t,angle))
    return r


MARKERSIZE = 2
TICKS = ([0,pi/4,pi/2,3*pi/4,pi], [0,pi/2,pi])
def color_angles_list(a, b, c, d, num_pts, colors):
    """Return list of graph instances for the action of a 2x2 matrix on 
    half of the unit circle.  That circle is broken into chunks each
    colored a different color.
      a, b, c, d  reals  entries of the matrix ul, ur, ll, lr
      colors  list of rgb tuples; len of this list is how many chunks
    (Terribly inefficient; runs through scatter_points many times)
    """
    r = []
    num_colors = len(colors)
    for i in range(num_colors):
        color = colors[i]
        points = find_angles(a,b,c,d,num_pts,
                             lower_limit=i*pi/num_colors,
                             upper_limit=(i+1)*pi/num_colors)
        g = scatter_plot(points,facecolor=color,edgecolor=color,
                         markersize=MARKERSIZE,ticks=TICKS) 
        r.append(g)
    return r

def plot_color_angles(a, b, c, d, num_points=1000):
    """Show the action of the matrix with entries a, b, c, d on half
    of the unit circle, broken into a number of colors.
     a, b, c, d  reals  Entries are upper left, ur, ll, lr.
     num_points=1000  Number of points along half circle to plot
    """
    colors = rainbow(6)
    G = Graphics()  # holds graph parts until they are to be shown
    for g_part in color_angles_list(a,b,c,d,num_points,colors):
        G += g_part
    return plot(G)    


plot.options['figsize'] = 2.5
plot.options['axes_pad'] = 0.05
plot.options['fontsize'] = 7
plot.options['dpi'] = 1200
plot.options['aspect_ratio'] = 1