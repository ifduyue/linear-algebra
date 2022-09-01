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

string OUTPUT_FN = "det%03d";

// stuff for xy graphs
import graph;
// some parameters
real axis_arrow_size = 0.7mm;
real axis_tick_size = 1mm;
pen TICLABELPEN = AXISPEN+fontsize(6pt);

// stuff for 3D drawings
import graph3;

pen BOXPEN = gray(0.92)+opacity(0.5);

// ======= Boxes in R^2 ================
// ......... First box ...........
picture pic;
int picnum = 0;
unitsize(pic,0.75cm);

// limits
real xmin=-2;  // 
real xmax=6;
real ymin=-1;
real ymax=6;

pair b1_endpoint = (3,2);
pair b2_endpoint = (-1,4);

path box = (0,0) -- b1_endpoint -- (b1_endpoint+b2_endpoint) -- b2_endpoint --cycle;
fill(pic,box,BOXPEN);

// The box vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\small$\colvec{3 \\ 2}$",b1_endpoint,E);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\small$\colvec{-1 \\ 4}$",b2_endpoint,W);

// orientation arc
path full_circ = scale(1.2)*unitcircle;
real[][] b1_times = intersections(full_circ,b1);
real[][] b2_times = intersections(full_circ,b2);
draw(pic, subpath(full_circ,b1_times[0][0],b2_times[0][0]),blue,Arrow(DefaultHead,VECTORHEADSIZE));

// axes
xaxis(pic,YZero,
      xmin-0.75, xmax+0.75,
      RightTicks(Label("$%2.0f$",TICLABELPEN), Step=500, step=1,
		 beginlabel=false, endlabel=false,
		 Size=axis_tick_size, size=0.5*axis_tick_size,
		 extend=false, begin=false, NoZero),
      p=AXISPEN,
      Arrows(TeXHead,axis_arrow_size));
yaxis(pic,XZero,
      ymin-0.75, ymax+0.75,
      LeftTicks(Label("$%2.0f$",TICLABELPEN), Step=500, step=1,
		beginlabel=false, endlabel=false,
		Size=axis_tick_size, size=0.5*axis_tick_size,
		extend=false, begin=false, NoZero),
      p=AXISPEN,
      Arrows(TeXHead,axis_arrow_size));
shipout(format(OUTPUT_FN,picnum),pic,format="pdf");


// ......... First box again, opposite orientation ...........
picture pic;
int picnum = 1;
unitsize(pic,0.75cm);

// limits
real xmin=-2;  // 
real xmax=6;
real ymin=-1;
real ymax=6;

pair b1_endpoint = (3,2);
pair b2_endpoint = (-1,4);

path box = (0,0) -- b1_endpoint -- (b1_endpoint+b2_endpoint) -- b2_endpoint --cycle;
fill(pic,box,BOXPEN);

// The box vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\small$\colvec{3 \\ 2}$",b1_endpoint,E);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\small$\colvec{-1 \\ 4}$",b2_endpoint,W);

// orientation arc
path full_circ = scale(1.2)*unitcircle;
real[][] b1_times = intersections(full_circ,b1);
real[][] b2_times = intersections(full_circ,b2);
draw(pic, subpath(full_circ,b2_times[0][0],b1_times[0][0]),blue,Arrow(DefaultHead,VECTORHEADSIZE));

// axes
xaxis(pic,YZero,
      xmin-0.75, xmax+0.75,
      RightTicks(Label("$%2.0f$",TICLABELPEN), Step=500, step=1,
		 beginlabel=false, endlabel=false,
		 Size=axis_tick_size, size=0.5*axis_tick_size,
		 extend=false, begin=false, NoZero),
      p=AXISPEN,
      Arrows(TeXHead,axis_arrow_size));
yaxis(pic,XZero,
      ymin-0.75, ymax+0.75,
      LeftTicks(Label("$%2.0f$",TICLABELPEN), Step=500, step=1,
		beginlabel=false, endlabel=false,
		Size=axis_tick_size, size=0.5*axis_tick_size,
		extend=false, begin=false, NoZero),
      p=AXISPEN,
      Arrows(TeXHead,axis_arrow_size));
shipout(format(OUTPUT_FN,picnum),pic,format="pdf");



// ......... New box ...........
picture pic;
int picnum = 2;
unitsize(pic,0.75cm);

// limits
real xmin=-2;  // 
real xmax=6;
real ymin=-4;
real ymax=2;

pair b1_endpoint = (2,-1);
pair b2_endpoint = (1,-3);

path box = (0,0) -- b1_endpoint -- (b1_endpoint+b2_endpoint) -- b2_endpoint --cycle;
fill(pic,box,BOXPEN);

// The box vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\small$\colvec{2 \\ -1}$",b1_endpoint,E);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\small$\colvec{1 \\ -3}$",b2_endpoint,S);

// orientation arc
path full_circ = scale(1.2)*unitcircle;
real[][] b1_times = intersections(full_circ,b1);
real[][] b2_times = intersections(full_circ,b2);
draw(pic, subpath(full_circ,b1_times[0][0],b2_times[0][0]),blue,Arrow(DefaultHead,VECTORHEADSIZE));

// axes
xaxis(pic,YZero,
      xmin-0.75, xmax+0.75,
      RightTicks(Label("$%2.0f$",TICLABELPEN), Step=500, step=1,
		 beginlabel=false, endlabel=false,
		 Size=axis_tick_size, size=0.5*axis_tick_size,
		 extend=false, begin=false, NoZero),
      p=AXISPEN,
      Arrows(TeXHead,axis_arrow_size));
yaxis(pic,XZero,
      ymin-0.75, ymax+0.75,
      LeftTicks(Label("$%2.0f$",TICLABELPEN), Step=500, step=1,
		beginlabel=false, endlabel=false,
		Size=axis_tick_size, size=0.5*axis_tick_size,
		extend=false, begin=false, NoZero),
      p=AXISPEN,
      Arrows(TeXHead,axis_arrow_size));
shipout(format(OUTPUT_FN,picnum),pic,format="pdf");



// ========== Box from R^3 ===
picture pic;
int picnum = 4;
size3(pic,150, 150, 150);

// size(0,200);
// size3(200,IgnoreAspect);
real xmin=-4; real xmax=4;
real ymin=-1; real ymax=4;
real zmin=-1; real zmax=6;

currentprojection=orthographic(20,6,5);
currentlight=nolight;

triple b1_end = (2,0,2);
triple b2_end = (0,3,1);
triple b3_end = (-1,0,1);

path3 b1_b1b2 = b1_end--(b1_end+b2_end); 
path3 b1_b1b3 = b1_end--(b1_end+b3_end); 
path3 b2_b2b3 = b2_end--(b2_end+b3_end); 
path3 b2_b1b2 = b2_end--(b1_end+b2_end); 
path3 b3_b1b3 = b3_end--(b1_end+b3_end); 
path3 b3_b2b3 = b3_end--(b2_end+b3_end); 
path3 b1b2_b1b2b3 = (b1_end+b2_end)--(b1_end+b2_end+b3_end); 
path3 b1b3_b1b2b3 = (b1_end+b3_end)--(b1_end+b2_end+b3_end); 
path3 b2b3_b1b2b3 = (b2_end+b3_end)--(b1_end+b2_end+b3_end); 
path3 b1 = (0,0,0)--b1_end; 
path3 b2 = (0,0,0)--b2_end; 
path3 b3 = (0,0,0)--b3_end; 


xaxis3(pic, "{\tiny $x$}",xmin,xmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
yaxis3(pic, "{\tiny $y$}",ymin,ymax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));
zaxis3(pic, "{\tiny $z$}",zmin,zmax,AXISPEN,
       OutTicks(format="%",Step=5,step=1,Size=2,size=1));

draw(pic, b1_b1b2, black);
draw(pic, b1_b1b3, black);
draw(pic, b2_b2b3, black);
draw(pic, b2_b1b2, black);
draw(pic, b3_b1b3, black);
draw(pic, b3_b2b3, black);
draw(pic, b1b2_b1b2b3, black);
draw(pic, b1b3_b1b2b3, black);
draw(pic, b2b3_b1b2b3, black);
draw(pic, b1, red, Arrow3(size=3.5));
draw(pic, b2, red, Arrow3(size=3.5));
draw(pic, b3, red, Arrow3(size=3.5));
// label(pic, "\tiny$\colvec{2 \\ 0 \\ 2}$", (2,0,2), 2*Y);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");






