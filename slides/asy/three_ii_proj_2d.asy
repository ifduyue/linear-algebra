// three_ii_proj_2d.asy
// Illustrate inverse image of projection from \Re^2 to \Re^1
import jh;
import settings;
settings.outformat="pdf";
settings.render=0;

real width; width=2cm; size(width,0);

import graph;

string fn = "three_ii_proj_2d";  // for output file name

pen vector_pen=linecap(1)
  +linewidth(1.5pt);
pen inverse_image_pen=linecap(1)
                       +linewidth(1.5pt);
pen parallogram_pen=linecap(1)
                       +linewidth(0.4pt);
pen inverse_image_fill_pen=linecap(1)
                       +linewidth(1pt);

// real red=230/255; real green=0.0; real blue=0.0;
// pen red_color=rgb(red,green,blue);  // red
// pen shade_color=rgb(red,204/255,204/255);  // change saturation to .2

// --------------------------
// Vector of length 2 in \Re^1
picture p;
size(p,width,0);
int picnum = 0;

path vec=(0,0)--(2,0);
draw(p,vec,vector_pen+red,arrow=Arrow(DefaultHead,VECTORHEADSIZE));

real[] xticks={-1,0,1,2,3,4,5};
// real[] yticks={1,2,3,4};
xaxis(p,"",-1.75,5.75,AXISPEN,RightTicks("%",Size=2,xticks),Arrows(TeXHead,size=1));
// yaxis("",-0.2,4.1,AXISPEN,LeftTicks("%",Size=2,yticks));
labelx(p,"\tiny $0$",N,(0,0));

shipout(fn+format("%02d",picnum), p);


// --------------------------
// Vectors in \Re^2 associated with vector of length 2
picture p;
size(p,width,0);
int picnum = 1;

real[] xticks={-1,0,1,2,3,4,5};
real[] yticks={1,2,3,4};
xaxis(p,"",-1.75,5.75,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",-0.2,4.75,AXISPEN,LeftTicks("%",Size=2,yticks));

for(int i=0; i < 5; ++i) {
  pair domain_vec_tip=(2,1+2*i/3.0);
  path domain_vec=(0,0)--domain_vec_tip;
  draw(p,domain_vec,VECTORPEN+red,arrow=Arrow(DefaultHead,VECTORHEADSIZE),PenMargin(-1,1.5));
}

shipout(fn+format("%02d",picnum), p);


// --------------------------
// Vector of length 3 in \Re^1
picture p;
size(p,width,0);
int picnum = 2;

path vec=(0,0)--(3,0);
draw(p,vec,vector_pen+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE));

real[] xticks={-1,0,1,2,3,4,5};
// real[] yticks={1,2,3,4};
xaxis(p,"",-1.75,5.75,AXISPEN,RightTicks("%",Size=2,xticks),Arrows(TeXHead,size=1));
// yaxis("",-0.2,4.1,AXISPEN,LeftTicks("%",Size=2,yticks));
labelx(p,"\tiny $0$",N,(0,0));

shipout(fn+format("%02d",picnum), p);


// --------------------------
// Vectors in \Re^2 associated with vector of length 3
picture p;
size(p,width,0);
int picnum = 3;

real[] xticks={-1,0,1,2,3,4,5};
real[] yticks={1,2,3,4};
xaxis(p,"",-1.75,5.75,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",-0.2,4.75,AXISPEN,LeftTicks("%",Size=2,yticks));

for(int i=0; i < 5; ++i) {
  pair domain_vec_tip=(3,1+2*i/3.0);
  path domain_vec=(0,0)--domain_vec_tip;
  draw(p,domain_vec,VECTORPEN+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE),PenMargin(-1,1.5));
}

shipout(fn+format("%02d",picnum), p);


// --------------------------
// Vector of length 5 in \Re^1
picture p;
size(p,width,0);
int picnum = 4;

path vec=(0,0)--(5,0);
draw(p,vec,vector_pen+red+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE));

real[] xticks={-1,0,1,2,3,4,5};
// real[] yticks={1,2,3,4};
xaxis(p,"",-1.75,5.75,AXISPEN,RightTicks("%",Size=2,xticks),Arrows(TeXHead,size=1));
// yaxis("",-0.2,4.1,AXISPEN,LeftTicks("%",Size=2,yticks));
labelx(p,"\tiny $0$",N,(0,0));

shipout(fn+format("%02d",picnum), p);


// --------------------------
// Vectors in \Re^2 associated with vector of length 5
picture p;
size(p,width,0);
int picnum = 5;

real[] xticks={-1,0,1,2,3,4,5};
real[] yticks={1,2,3,4};
xaxis(p,"",-1.75,5.75,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",-0.2,4.75,AXISPEN,LeftTicks("%",Size=2,yticks));

for(int i=0; i < 5; ++i) {
  pair domain_vec_tip=(5,1+2*i/3.0);
  path domain_vec=(0,0)--domain_vec_tip;
  draw(p,domain_vec,VECTORPEN+red+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE),PenMargin(-1,1.5));
}

shipout(fn+format("%02d",picnum), p);



// --------------------------
// Sum of vectors 
picture p;
size(p,width,0);
int picnum = 6;

real[] xticks={-1,0,1,2,3,4,5};
real[] yticks={1,2,3,4};
xaxis(p,"",-1.75,5.75,AXISPEN,RightTicks("%",Size=2,xticks));
yaxis(p,"",-0.2,4.75,AXISPEN,LeftTicks("%",Size=2,yticks));

pair domain_vec_tip_2=(2,0.5);
pair domain_vec_tip_3=(3,3);
pair domain_vec_tip_5=(5,3.5);

path parallelogram = (0,0)--domain_vec_tip_2--domain_vec_tip_5--domain_vec_tip_3--cycle;
// path parallelogram_25 = domain_vec_tip_2 -- domain_vec_tip_5;
// path parallelogram_25_short = domain_vec_tip_2 -- point(parallelogram_25,0.75);
// path parallelogram_35 = domain_vec_tip_3 -- domain_vec_tip_5;
// path parallelogram_35_short = domain_vec_tip_3 -- point(parallelogram_35,0.6);
// draw(p,parallelogram_25_short,parallogram_pen+gray(0.75)); 
// draw(p,parallelogram_35_short,parallogram_pen+gray(0.75)); 
fill(p,parallelogram,parallogram_pen+gray(0.95)); 

path domain_vec_2=(0,0)--domain_vec_tip_2;
draw(p,domain_vec_2,VECTORPEN+red,arrow=Arrow(DefaultHead,VECTORHEADSIZE),PenMargin(-1,1.5));
path domain_vec_3=(0,0)--domain_vec_tip_3;
draw(p,domain_vec_3,VECTORPEN+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE),PenMargin(-1,1.5));
path domain_vec_5=(0,0)--domain_vec_tip_5;
draw(p,domain_vec_5,VECTORPEN+red+blue,arrow=Arrow(DefaultHead,VECTORHEADSIZE),PenMargin(-1,1.5));

shipout(fn+format("%02d",picnum), p);
