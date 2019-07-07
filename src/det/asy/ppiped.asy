import settings;
outformat="pdf";
settings.render=0;  // make output not be PRC
// settings.maxtile=(20,20);

import fontsize;
defaultpen(fontsize(9.24994pt));
import texcolors;
pen THINPEN=linecap(0)
             +linewidth(0.25pt);
pen VECTORPEN=linecap(0)
              +linewidth(0.8pt);
real VECTORHEADSIZE=5;
pen LIGHTPEN=linewidth(0.4pt);  // matches mpost line_width_light

import graph3;

size(0,200);
size3(200,IgnoreAspect);

currentprojection=orthographic((10,5,4));

// scale(Linear,Linear,Log);

// xaxis3("$x$",0,1,red,OutTicks(2,2));
xaxis3("$x$",YZZero,
       xmin=-0.2,xmax=3.2,
       OutTicks(Label("%"),
        Step=1,step=1,  
        begin=false,  
        Size=2, size=2)
       ); 
yaxis3("$y$",XZZero,
       ymin=-0.2,ymax=4.2,
       OutTicks(Label("%"),
		Step=1,step=1, 
		begin=false,  
		Size=2, size=2)
       ); 
zaxis3("$z$",XYZero,
       zmin=-0.2,zmax=4.2,
    OutTicks(Label("%"),
        Step=1,step=1,  
        begin=false,  
        Size=2, size=2)
       ); 

// three vectors
triple origin = (0,0,0);
triple p1 = (2,0,2);
triple p2 = (0,3,1);
triple p3 = (-1,0,1);
path3 v1 = origin--p1;
path3 v2 = origin--p2;
path3 v3 = origin--p3;

// Labels; the connecting line is overwritten by a box edge so they
// need to be written now
label(Label("{\tiny $\left(\begin{array}{@{}c@{}} 2 \\ 0 \\ 2 \end{array}\right)$}"),p1,SW);
label(Label("{\tiny $\left(\begin{array}{@{}c@{}} 0 \\ 3 \\ 1 \end{array}\right)$}"),p2+(0,.15,0),E);
triple p3_offset = (1,-0.8,1.6);  // label must move out and away
label(Label("{\tiny $\left(\begin{array}{@{}c@{}} -1 \\ 0 \\ 1 \end{array}\right)$}"),p3+p3_offset,W);
path3 p3_connection = p3+p3_offset+(0,0,-.30){(0,1,-.3)}  .. (p3-(0,.5,0)) .. {(0,1,0)}p3;
draw(p3_connection,LIGHTPEN+gray(0.8));


// Draw the parts in white first to make a hairline border
pen WHITEPEN=linecap(0)
             +linewidth(1pt)+white;
pen extra_lines_color = black;
draw(p3--(p1+p3),WHITEPEN);
draw(p3--(p1+p3),THINPEN+extra_lines_color);
draw(p3--(p2+p3),WHITEPEN);
draw(p3--(p2+p3),THINPEN+extra_lines_color);
draw(p2--(p2+p3),WHITEPEN);
draw(p2--(p2+p3),THINPEN+extra_lines_color);
draw(p1--(p1+p3),WHITEPEN);
draw(p1--(p1+p3),THINPEN+extra_lines_color);
draw(p1--(p1+p2),WHITEPEN);
draw(p1--(p1+p2),THINPEN+extra_lines_color);
draw(p2--(p1+p2),WHITEPEN);
draw(p2--(p1+p2),THINPEN+extra_lines_color);
draw((p2+p3)--(p1+p2+p3),WHITEPEN);
draw((p2+p3)--(p1+p2+p3),THINPEN+extra_lines_color);
draw((p1+p3)--(p1+p2+p3),WHITEPEN);
draw((p1+p3)--(p1+p2+p3),THINPEN+extra_lines_color);
draw((p1+p2)--(p1+p2+p3),WHITEPEN+extra_lines_color);
draw((p1+p2)--(p1+p2+p3),THINPEN+extra_lines_color);

// Bug: arrows predrawn with white border will have bases with
// crossing white borders.
// draw(v1,WHITEPEN,arrow=Arrow3(DefaultHead2,VECTORHEADSIZE,FillDraw));
draw(v1,VECTORPEN,arrow=Arrow3(DefaultHead2,VECTORHEADSIZE,FillDraw));
// draw(v2,WHITEPEN,arrow=Arrow3(DefaultHead2,VECTORHEADSIZE,FillDraw));
draw(v2,VECTORPEN,arrow=Arrow3(DefaultHead2,VECTORHEADSIZE,FillDraw));
// draw(v3,WHITEPEN,arrow=Arrow3(DefaultHead2,VECTORHEADSIZE,FillDraw));
draw(v3,VECTORPEN,arrow=Arrow3(DefaultHead2,VECTORHEADSIZE,FillDraw));

