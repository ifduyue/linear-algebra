// three_ii_proj_2d.asy
// Illustrate inverse image of projection from \Re^2 to \Re^1
import jh;
import settings;
settings.outformat="pdf";
settings.render=0;

real height; height=1.5cm; size(0,height);

import graph;

string fn = "three_ii_inv_img";  // for output file name

pen vector_pen=linecap(1)
  +linewidth(1.5pt);
pen inverse_image_pen=linecap(1)
                       +linewidth(1.25pt);
pen parallogram_pen=linecap(1)
                       +linewidth(0.4pt);
pen inverse_image_fill_pen=linecap(1)
                       +linewidth(1pt);
pen dotline=linetype(new real[] {0,2});

// The graphics associated with the map
// (x,y) \-> (x+y, 2x+2y)

real XMIN = -0.1;
real YMIN = 2*XMIN;
real XMAX = 2.75;
real YMAX = 2*XMAX+1;
path ln = (XMIN,YMIN) -- (XMAX,2*XMAX);


// --------------------------
// Codomain vector 
picture p;
size(p,0,height);
int picnum = 0;

draw(p,ln,vector_pen+gray(.9));

real[] xticks={1,2};
real[] yticks={1,2,3,4,5,6};
xaxis(p,"",XMIN,XMAX,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",YMIN,YMAX,AXISPEN,LeftTicks("%",Size=2,yticks));

path vec=(0,0)--(1,2);
draw(p,vec,vector_pen+red,arrow=Arrow(DefaultHead,VECTORHEADSIZE));

shipout(fn+format("%02d",picnum), p);


// --------------------------
// Vectors in \Re^2 associated with prior codomain vector
picture p;
size(p,0,height);
int picnum = 1;

real[] xticks={1,2};
real[] yticks={1,2,3,4,5,6};
xaxis(p,"",XMIN,XMAX,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",YMIN,YMAX,AXISPEN,LeftTicks("%",Size=2,yticks));

path inv_img = (XMIN,XMIN*(-1)+3) -- (XMAX, XMAX*(-1)+3);
path inv_img_2_vec = (0,0)--(1.75,1.75*(-1)+3);
draw(p,inv_img,inverse_image_pen+dotline+red);
draw(p,inv_img_2_vec,vector_pen+red,arrow=Arrow(DefaultHead,VECTORHEADSIZE));

shipout(fn+format("%02d",picnum), p);


// --------------------------
// Blue codomain vector
picture p;
size(p,0,height);
int picnum = 2;

draw(p,ln,vector_pen+gray(.9));

real[] xticks={1,2};
real[] yticks={1,2,3,4,5,6};
xaxis(p,"",XMIN,XMAX,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",YMIN,YMAX,AXISPEN,LeftTicks("%",Size=2,yticks));

path vec=(0,0)--(1.5,3);
draw(p,vec,vector_pen+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE));

shipout(fn+format("%02d",picnum), p);


// --------------------------
// Vectors  associated with blue codomain vector
picture p;
size(p,0,height);
int picnum = 3;

real[] xticks={1,2};
real[] yticks={1,2,3,4,5,6};
xaxis(p,"",XMIN,XMAX,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",YMIN,YMAX,AXISPEN,LeftTicks("%",Size=2,yticks));

path inv_img = (XMIN,XMIN*(-1)+4.5) -- (XMAX+1, (XMAX+1)*(-1)+4.5);
path inv_img_3_vec = (0,0)--(0.5,0.5*(-1)+4.5);
draw(p,inv_img,inverse_image_pen+dotline+blue);
draw(p,inv_img_3_vec,vector_pen+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE));

shipout(fn+format("%02d",picnum), p);



// --------------------------
// Purple codomain vector
picture p;
size(p,0,height);
int picnum = 4;

draw(p,ln,vector_pen+gray(.9));

real[] xticks={1,2};
real[] yticks={1,2,3,4,5,6};
xaxis(p,"",XMIN,XMAX,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",YMIN,YMAX,AXISPEN,LeftTicks("%",Size=2,yticks));

path vec=(0,0)--(2.5,5);
draw(p,vec,vector_pen+red+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE));

shipout(fn+format("%02d",picnum), p);


// --------------------------
// Vectors  associated with purple codomain vector
picture p;
size(p,0,height);
int picnum = 5;

real[] xticks={1,2};
real[] yticks={1,2,3,4,5,6};
xaxis(p,"",XMIN,XMAX,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",YMIN,YMAX,AXISPEN,LeftTicks("%",Size=2,yticks));

path inv_img = (XMIN,XMIN*(-1)+7.5) -- (XMAX+2, (XMAX+2)*(-1)+7.5);
path inv_img_5_vec = (0,0)--(2.0,2.0*(-1)+7.5);
draw(p,inv_img,inverse_image_pen+dotline+red+blue);
draw(p,inv_img_5_vec,vector_pen+red+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE));

shipout(fn+format("%02d",picnum), p);


// --------------------------
// Vectors  associated with purple codomain vector
picture p;
// These differ because the graphic grew
size(p,0,2*height);
pen inverse_image_pen=linecap(1)
                       +linewidth(1.25pt);
int picnum = 6;

real[] xticks={1,2};
real[] yticks={1,2,3,4,5,6};
xaxis(p,"",XMIN,XMAX,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",YMIN,YMAX,AXISPEN,LeftTicks("%",Size=2,yticks));

path inv_img_2 = (XMIN,XMIN*(-1)+3) -- (XMAX, XMAX*(-1)+3);
draw(p,inv_img_2,inverse_image_pen+dotline+red+opacity(0.3));
path inv_img_3 = (XMIN,XMIN*(-1)+4.5) -- (XMAX+1, (XMAX+1)*(-1)+4.5);
draw(p,inv_img_3,inverse_image_pen+dotline+blue+opacity(0.3));
path inv_img_5 = (XMIN,XMIN*(-1)+7.5) -- (XMAX+2, (XMAX+2)*(-1)+7.5);
draw(p,inv_img_5,inverse_image_pen+dotline+red+blue+opacity(0.3));

path parallelogram = (0,0)--point(inv_img_2_vec,1)--point(inv_img_5_vec,1)--point(inv_img_3_vec,1)--cycle;
fill(p,parallelogram,parallogram_pen+gray(.1)+opacity(0.1));
draw(p,inv_img_2_vec,vector_pen+red,arrow=Arrow(DefaultHead,VECTORHEADSIZE));
draw(p,inv_img_3_vec,vector_pen+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE));
draw(p,inv_img_5_vec,vector_pen+red+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE));

shipout(fn+format("%02d",picnum), p);

