def normal_curve(upper_limit, digits=3):
    """Approximate area under the standard Normal curve from 0 to upper_limit.
         upper_limit  real  Find area from 0 to upperlimit.
    """
    stdev = 1.0
    mu = 0.0
    area = numerical_integral((1/sqrt(2*pi) * e^(-0.5*(x)^2)),
                              0, upper_limit)    
    return(numerical_approx(area[0], digits=digits))
