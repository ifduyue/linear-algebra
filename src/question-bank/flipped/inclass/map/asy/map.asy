// vs.asy
//  Graphs of fcns

import settings;
settings.outformat="pdf";
settings.render=0;

unitsize(1pt);

import texcolors;
// cd junk is needed for relative import 
cd("../../../../../asy");
import settexpreamble;
cd("");
settexpreamble();
cd("../../../../../asy");
import jh;
cd("");

string OUTPUT_FN = "map%03d";

// stuff for xy graphs
import graph;
// some parameters
real axis_arrow_size = 0.35mm;
real axis_tick_size = 0.75mm;
pen TICLABELPEN = AXISPEN+fontsize(6pt);

// stuff for 3D drawings
import graph3;

// stuff for function drawings
// Draw a set bean
path setbean(real h=1, real v=1) {
  path p;
  p = (0,0)..(0,v)..(h,v)..tension(1.2)..(h,-v)..(0,-v)..cycle;
  return p;
}
pen BEANCOLOR = white;  // color only; pen given below
pen ARROWCOLOR = red;

real h, v;  // horizontal and vertical units for beans
h = 0.70; v = h; 
real DOMAINTOCODOMAIN = 3*h;


// =========== Onto, not one-to-one map ========================= 
picture pic;
int picnum = 0;
unitsize(pic,1cm);
// Establish the stuff to draw
path domain, codomain;
domain = setbean(h,v);
codomain = shift(DOMAINTOCODOMAIN,0)*setbean(h,v);
// points
pair[] domainpoint, codomainpoint;
for (int i; i<4; ++i) {
  domainpoint[i] = (0.5*h,((-2/3)+0.1)*v+(i/3)*(4/3)*v);
}
for (int i; i<3; ++i) {
  codomainpoint[i] = shift(DOMAINTOCODOMAIN,0)*(0.5*h,((-1/2)+0.1)*v+(i/2)*(1)*v);
}
path[] maparrow;
maparrow[3] = domainpoint[3]{dir(15)}..codomainpoint[2];
maparrow[2] = domainpoint[2]{dir(15)}..codomainpoint[2];
maparrow[1] = domainpoint[1]{dir(15)}..codomainpoint[1];
maparrow[0] = domainpoint[0]{dir(10)}..codomainpoint[0];
// Now draw; want white area around map arrow thru the border
// First the outlines
draw(pic,domain,LIGHTPEN);
draw(pic,codomain,LIGHTPEN);
// now the arrows, wider and in white first
for (int i; i<4; ++i) {
  draw(pic,subpath(maparrow[i],0.08,0.92),bar=BeginBar(2),arrow=EndArrow(TeXHead),DARKPEN+white);
}
fill(pic,domain,BEANCOLOR);
fill(pic,codomain,BEANCOLOR);
for (int i; i<4; ++i) {
  dot(pic,domainpoint[i],DARKPEN+black);
}
for (int i; i<3; ++i) {
  dot(pic,codomainpoint[i],DARKPEN+black);
}
// now arrows narrower
for (int i; i<4; ++i) {
  draw(pic,subpath(maparrow[i],0.08,0.92),bar=BeginBar(2),arrow=EndArrow(TeXHead),LIGHTPEN+ARROWCOLOR);
}
shipout(format(OUTPUT_FN,picnum),pic,format="pdf");




// =========== not onto, not one-to-one map ========================= 
picture pic;
int picnum = 2;
unitsize(pic,1cm);
// Establish the stuff to draw
path domain, codomain;
domain = setbean(h,v);
codomain = shift(DOMAINTOCODOMAIN,0)*setbean(h,v);
// points
pair[] domainpoint, codomainpoint;
for (int i; i<4; ++i) {
  domainpoint[i] = (0.5*h,((-2/3)+0.1)*v+(i/3)*(4/3)*v);
}
for (int i; i<3; ++i) {
  codomainpoint[i] = shift(DOMAINTOCODOMAIN,0)*(0.5*h,((-1/2)+0.1)*v+(i/2)*(1)*v);
}
path[] maparrow;
maparrow[3] = domainpoint[3]{dir(15)}..codomainpoint[2];
maparrow[2] = domainpoint[2]{dir(15)}..codomainpoint[2];
maparrow[1] = domainpoint[1]{dir(15)}..codomainpoint[0];
maparrow[0] = domainpoint[0]{dir(10)}..codomainpoint[0];
// Now draw; want white area around map arrow thru the border
// First the outlines
draw(pic,domain,LIGHTPEN);
draw(pic,codomain,LIGHTPEN);
// now the arrows, wider and in white first
for (int i; i<4; ++i) {
  draw(pic,subpath(maparrow[i],0.08,0.92),bar=BeginBar(2),arrow=EndArrow(TeXHead),DARKPEN+white);
}
fill(pic,domain,BEANCOLOR);
fill(pic,codomain,BEANCOLOR);
for (int i; i<4; ++i) {
  dot(pic,domainpoint[i],DARKPEN+black);
}
for (int i; i<3; ++i) {
  dot(pic,codomainpoint[i],DARKPEN+black);
}
// now arrows narrower
for (int i; i<4; ++i) {
  draw(pic,subpath(maparrow[i],0.08,0.92),bar=BeginBar(2),arrow=EndArrow(TeXHead),LIGHTPEN+ARROWCOLOR);
}
shipout(format(OUTPUT_FN,picnum),pic,format="pdf");





// ......................................
// One to one, and onto map
picture pic;
int picnum = 3;
unitsize(pic,1cm);

// Establish all the stuff to draw
path domain, codomain;
domain = setbean(h,v);
codomain = shift(DOMAINTOCODOMAIN,0)*setbean(h,v);
pair[] domainpoint, codomainpoint;
for (int i; i<3; ++i) {
  domainpoint[i] = (0.5*h,((-1/2)+0.1)*v+(i/2)*(1)*v);
  dot(pic,domainpoint[i],DARKPEN+black);
}
for (int i; i<3; ++i) {
  codomainpoint[i] = shift(DOMAINTOCODOMAIN,0)*(0.5*h,((-1/2)+0.1)*v+(i/2)*(1)*v);
}
path[] maparrow;
maparrow[2] = domainpoint[2]{dir(15)}..codomainpoint[2];
maparrow[1] = domainpoint[1]{dir(15)}..codomainpoint[1];
maparrow[0] = domainpoint[0]{dir(15)}..codomainpoint[0];
// now draw; want white area around map arrow thru the border
// First the outlines
draw(pic,domain,LIGHTPEN);
draw(pic,codomain,LIGHTPEN);
// Next the arrow, wider, in white
for (int i; i<3; ++i) {
  draw(pic,subpath(maparrow[i],0.08,0.92),bar=BeginBar(2),arrow=EndArrow(TeXHead),DARKPEN+white);
}
// Now fill, draw dots, and draw arrows narrow
fill(pic,domain,BEANCOLOR);
fill(pic,codomain,BEANCOLOR);
for (int i; i<3; ++i) {
  dot(pic,domainpoint[i],DARKPEN+black);
}
for (int i; i<3; ++i) {
  dot(pic,codomainpoint[i],DARKPEN+black);
}
for (int i; i<3; ++i) {
  draw(pic,subpath(maparrow[i],0.08,0.92),bar=BeginBar(2),arrow=EndArrow(TeXHead),LIGHTPEN+ARROWCOLOR);
}
shipout(format(OUTPUT_FN,picnum),pic,format="pdf");






// ======================== Projection map inverse image of zero ===
picture pic;
int picnum = 4;
size3(pic,150, 150, 150);

// size(0,200);
// size3(200,IgnoreAspect);
real xmin=-10.5; real xmax=15.5;
real ymin=-5.5; real ymax=15.5;
real zmin=-5.5; real zmax=10.5;

currentprojection=orthographic(20,6,5);
currentlight=nolight;

xaxis3(pic, "{\tiny $x$}",xmin,xmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
yaxis3(pic, "{\tiny $y$}",ymin,ymax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
zaxis3(pic, "{\tiny $z$}",zmin,zmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));

draw(pic, (0,0,zmax-1)--(0,0,zmin+1), MAINPEN+ForestGreen, Arrows3(size=3.5));
label(pic, "\tiny$\set{\colvec{0 \\ 0 \\ z}\suchthat z\in\R}$", (1,1,8), 2*Y);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");

// .............. Projection map inverse image of (2,1) ......
picture pic;
int picnum = 5;
size3(pic,150, 150, 150);

// size(0,200);
// size3(200,IgnoreAspect);
real xmin=-10.5; real xmax=15.5;
real ymin=-5.5; real ymax=15.5;
real zmin=-5.5; real zmax=10.5;

currentprojection=orthographic(20,6,5);
currentlight=nolight;

xaxis3(pic, "{\tiny $x$}",xmin,xmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
yaxis3(pic, "{\tiny $y$}",ymin,ymax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
zaxis3(pic, "{\tiny $z$}",zmin,zmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));

draw(pic, (2,0,0)--(2,1,0), AXISPEN);
draw(pic, (0,1,0)--(2,1,0), AXISPEN);
path3 inv_image = (2,1,zmax-1)--(2,1,zmin+1);
draw(pic, inv_image, MAINPEN+red, Arrows3(size=3.5));
label(pic, "\tiny$\set{\colvec{2 \\ 1 \\ z}\suchthat z\in\R}$", (2,1,8), 2*Y);
dotfactor=4;dot(pic,(2,1,4),red);
label(pic, "\tiny$\vec{v}_2$", (2,1,4), Y+0.5*Z);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");


// .............. Projection map inverse image of (3,4) ......
picture pic;
int picnum = 6;
size3(pic,150, 150, 150);

// size(0,200);
// size3(200,IgnoreAspect);
real xmin=-10.5; real xmax=15.5;
real ymin=-5.5; real ymax=15.5;
real zmin=-5.5; real zmax=10.5;

currentprojection=orthographic(20,6,5);
currentlight=nolight;

xaxis3(pic, "{\tiny $x$}",xmin,xmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
yaxis3(pic, "{\tiny $y$}",ymin,ymax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
zaxis3(pic, "{\tiny $z$}",zmin,zmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));

draw(pic, (3,0,0)--(3,4,0), AXISPEN);
draw(pic, (0,4,0)--(3,4,0), AXISPEN);
path3 inv_image = (3,4,zmax-1)--(3,4,zmin+1);
draw(pic, inv_image, MAINPEN+blue, Arrows3(size=3.5));
label(pic, "\tiny$\set{\colvec{3 \\ 4 \\ z}\suchthat z\in\R}$", (3,4,8), 2*Y);
dotfactor=4;dot(pic,(3,4,1),blue);
label(pic, "\tiny$\vec{v}_1$", (3,4,1), Y+0.5*Z);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");


// .............. Projection map inverse image of (5,5) ......
picture pic;
int picnum = 7;
size3(pic,150, 150, 150);

// size(0,200);
// size3(200,IgnoreAspect);
real xmin=-10.5; real xmax=15.5;
real ymin=-5.5; real ymax=15.5;
real zmin=-5.5; real zmax=10.5;

currentprojection=orthographic(20,6,5);
currentlight=nolight;

xaxis3(pic, "{\tiny $x$}",xmin,xmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
yaxis3(pic, "{\tiny $y$}",ymin,ymax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
zaxis3(pic, "{\tiny $z$}",zmin,zmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));

draw(pic, (5,0,0)--(5,5,0), AXISPEN);
draw(pic, (0,5,0)--(5,5,0), AXISPEN);
path3 inv_image = (5,5,zmax-1)--(5,5,zmin+1);
draw(pic, inv_image, MAINPEN+red+blue, Arrows3(size=3.5));
label(pic, "\tiny$\set{\colvec{5 \\ 5 \\ z}\suchthat z\in\R}$", (5,5,9), 2*Y);
dotfactor=4;dot(pic,(5,5,5),red+blue);
label(pic, "\tiny$\vec{v}_3$", (5,5,5), Y);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");




// .............. Projection map inverse image of (5,5) ......
picture pic;
int picnum = 8;
size3(pic,150, 150, 150);

// size(0,200);
// size3(200,IgnoreAspect);
real xmin=-10.5; real xmax=15.5;
real ymin=-5.5; real ymax=15.5;
real zmin=-5.5; real zmax=10.5;

currentprojection=orthographic(20,6,5);
currentlight=nolight;

xaxis3(pic, "{\tiny $x$}",xmin,xmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
yaxis3(pic, "{\tiny $y$}",ymin,ymax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
zaxis3(pic, "{\tiny $z$}",zmin,zmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));

draw(pic, (12,0,0)--(12,6,0), AXISPEN);
draw(pic, (0,6,0)--(12,6,0), AXISPEN);
path3 inv_image = (12,6,zmax-1)--(12,6,zmin+1);
draw(pic, inv_image, MAINPEN+ForestGreen, Arrows3(size=3.5));
label(pic, "\tiny$\set{\colvec{12 \\ 6 \\ z}\suchthat z\in\R}$", (12,6,8), 2*Y);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");





// ================= Map h inverse image of (0,0) ===================
picture pic;
int picnum = 9;
size3(pic,150, 150, 150);

// size(0,200);
// size3(200,IgnoreAspect);
real xmin=-10.5; real xmax=15.5;
real ymin=-5.5; real ymax=15.5;
real zmin=-5.5; real zmax=10.5;

currentprojection=orthographic(20,6,5);
currentlight=nolight;

xaxis3(pic, "{\tiny $x$}",xmin,xmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
yaxis3(pic, "{\tiny $y$}",ymin,ymax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
zaxis3(pic, "{\tiny $z$}",zmin,zmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));

// draw(pic, (12,0,0)--(12,6,0), AXISPEN);
// draw(pic, (0,6,0)--(12,6,0), AXISPEN);
real k=1;
path3 inv_image = (-5,5,5)*k--(5,-5,-5)*k;
draw(pic, inv_image, MAINPEN+ForestGreen, Arrows3(size=3.5));
label(pic, "\tiny$\set{\colvec{-1 \\ 1 \\ 1}\cdot z\suchthat z\in\R}$", (-5,5,5), 2*Y);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");



// ............. Map h inverse image of (3,4) ................
picture pic;
int picnum = 10;
size3(pic,150, 150, 150);

// size(0,200);
// size3(200,IgnoreAspect);
real xmin=-10.5; real xmax=15.5;
real ymin=-5.5; real ymax=15.5;
real zmin=-5.5; real zmax=10.5;

currentprojection=orthographic(20,6,5);
currentlight=nolight;

xaxis3(pic, "{\tiny $x$}",xmin,xmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
yaxis3(pic, "{\tiny $y$}",ymin,ymax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
zaxis3(pic, "{\tiny $z$}",zmin,zmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));

// draw(pic, (12,0,0)--(12,6,0), AXISPEN);
// draw(pic, (0,6,0)--(12,6,0), AXISPEN);
real k=1;
path3 inv_image = (-5,5,5)*k--(5,-5,-5)*k;
draw(pic, shift(4,-1,0)*inv_image, MAINPEN+blue, Arrows3(size=3.5));
label(pic, "\tiny$\set{\colvec{4 \\ -1 \\ 0}+\colvec{-1 \\ 1 \\ 1}\cdot z\suchthat z \in\R}$", shift(4,-1,0)*(-5,5,5), 2*Y);
dotfactor=4;dot(pic,(4,-1,0),blue);
label(pic, "\tiny$\colvec{4 \\ -1 \\ 0}$", (4,-1,0), -1.5*Y+1.75*Z);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");


// ............. Map h inverse image of (2,1) ................
picture pic;
int picnum = 11;
size3(pic,150, 150, 150);

// size(0,200);
// size3(200,IgnoreAspect);
real xmin=-10.5; real xmax=15.5;
real ymin=-5.5; real ymax=15.5;
real zmin=-5.5; real zmax=10.5;

currentprojection=orthographic(20,6,5);
currentlight=nolight;

xaxis3(pic, "{\tiny $x$}",xmin,xmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
yaxis3(pic, "{\tiny $y$}",ymin,ymax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
zaxis3(pic, "{\tiny $z$}",zmin,zmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));

// draw(pic, (12,0,0)--(12,6,0), AXISPEN);
// draw(pic, (0,6,0)--(12,6,0), AXISPEN);
real k=1;
path3 inv_image = (-5,5,5)*k--(5,-5,-5)*k;
draw(pic, shift(1,1,0)*inv_image, MAINPEN+red, Arrows3(size=3.5));
label(pic, "\tiny$\set{\colvec{1 \\ 1 \\ 0}+\colvec{-1 \\ 1 \\ 1}\cdot z\suchthat z \in\R}$", shift(1,1,0)*(-5,5,5), 2*Y);
dotfactor=4;dot(pic,(1,1,0),red);
label(pic, "\tiny$\colvec{1 \\ 1 \\ 0}$", (1,1,0), -1.5*Y+1.75*Z);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");



// ............. Map h inverse image of (a,b) ................
picture pic;
int picnum = 12;
size3(pic,150, 150, 150);

real xmin=-10.5; real xmax=15.5;
real ymin=-5.5; real ymax=15.5;
real zmin=-5.5; real zmax=10.5;

currentprojection=orthographic(20,6,5);
currentlight=nolight;

xaxis3(pic, "{\tiny $x$}",xmin,xmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
yaxis3(pic, "{\tiny $y$}",ymin,ymax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
zaxis3(pic, "{\tiny $z$}",zmin,zmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));

real k=1;
path3 inv_image = (-5,5,5)*k--(5,-5,-5)*k;
draw(pic, shift(6,6,0)*inv_image, MAINPEN+ForestGreen, Arrows3(size=3.5));
label(pic, "\tiny$\set{\colvec{b \\ a-b \\ 0}+\colvec{-1 \\ 1 \\ 1}\cdot z\suchthat z \in\R}$", shift(6,6,0)*(-5,5,5), 2*Y);
dotfactor=4;dot(pic,(6,6,0),ForestGreen);
label(pic, "\tiny$\colvec{b \\ a-b \\ 0}$", (6,6,0), 1.5*Y-1.75*Z);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");




