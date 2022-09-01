// vs.asy
//  Graphs of fcns

import settings;
settings.outformat="pdf";
settings.render=0;

unitsize(1pt);

// cd junk is needed for relative import 
cd("../../../../../asy");
import settexpreamble;
cd("");
settexpreamble();
cd("../../../../../asy");
import jh;
cd("");

string OUTPUT_FN = "vs%03d";

import graph;
// some parameters
real axis_arrow_size = 0.35mm;
real axis_tick_size = 0.75mm;
pen TICLABELPEN = AXISPEN+fontsize(6pt);



// ============== xy plane with basis and signs of Rep's  ================
picture pic;
int picnum = 0;
size(pic,5cm);
// real scalefactor = 1000;
// scale(pic,Linear(scalefactor),Linear(5000));


// limits
real xmin=-10;  // 
real xmax=10;
real ymin=-10;
real ymax=10;

pair b1_endpoint = (1,3);
pair b2_endpoint = (2,0);

// lines
draw(pic,-(3.5)*b1_endpoint--(3.5)*b1_endpoint,FCNPEN);
draw(pic,-5*b2_endpoint--5*b2_endpoint,FCNPEN);

// The basis vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"\color{red}\small$\vec{\beta}_1$",b1_endpoint,SE);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"\color{red}\small$\vec{\beta}_2$",b2_endpoint,SE);

// Other vectors
pair v1_endpoint = (3,6);
path v1 = (0,0)--v1_endpoint;
draw(pic, v1, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_1$",v1_endpoint,E);
label(pic,"\color{blue}\large$+,+$",v1_endpoint+(2,0),E);
pair v2_endpoint = (4,-6);
path v2 = (0,0)--v2_endpoint;
draw(pic, v2, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_2$",v2_endpoint,S);
label(pic,"\color{blue}\large$-,+$",v2_endpoint+(1,0),E);
pair v3_endpoint = (-7,-3);
path v3 = (0,0)--v3_endpoint;
draw(pic, v3, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_3$",v3_endpoint,W);
label(pic,"\color{blue}\large$-,-$",v3_endpoint+(1,0),S);
pair v4_endpoint = (-1,9);
path v4 = (0,0)--v4_endpoint;
draw(pic, v4, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_4$",v4_endpoint,W);
label(pic,"\color{blue}\large$+,-$",v4_endpoint-(1,0),W);


// fcns
// real f(real x) {return x/log(x);}
// real g(real x) {return 10*log(x)/log(2);}  // they left out log2

// curves
// path f=graph(pic,f,xmin+1,xmax,n=400);
// draw(pic,f,MAINPEN+linewidth(0.4pt)+highlightcolor);
// label(pic,"$x/\ln(x)$",Scale(pic,(900000,70000)),SE,TICLABELPEN+highlightcolor);

// draw the curves
// dotfactor=1.5; // http://asymptote.sourceforge.net/FAQ/section3.html
// for (int i=ceil(xmin);i<=floor(xmax); ++i) {
//   dot(pic, Scale(pic,(i,f(i))), FCNPEN_SOLID, Fill(FCNPEN_SOLID));
//   dot(pic, Scale(pic,(i,g(i))), FCNPEN_SOLID, Fill(FCNPEN_SOLID));
// }
// label the curves
// pair [] pts = {(100,25),
//                (1000,168),
//                (5000,669),
//                (10000,1229),
//                (50000,5133),
//                (100000,9592),
//                (200000,17984),
//                (300000,25977),
//                (400000,33860),
//                // (250000,22044),
//                (500000,41538),
//                (600000,49098),
//                (700000,56543),
//                // (750000,60238),
//                (800000,63951),
//                (900000,71274),
//                (1000000,78498)
// };

// dotfactor=1.5; // http://asymptote.sourceforge.net/FAQ/section3.html
// for(pair pt: pts) {
//    dot(pic, Scale(pic,pt), FCNPEN_SOLID, Fill(FCNPEN_SOLID));
// }
// // label(pic,"$(500\,000,41\,538)$",Scale(pic,(500000,41538)),NW,TICLABELPEN);
// label(pic,"$(1\,000\,000,78\,498)$",Scale(pic,(1000000,78498)),N,TICLABELPEN);

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

// draw the curves
// dotfactor=1.5; // http://asymptote.sourceforge.net/FAQ/section3.html
// for (int i=ceil(xmin);i<=floor(xmax); ++i) {
//   dot(pic, Scale(pic,(i,f(i))), FCNPEN_SOLID, Fill(FCNPEN_SOLID));
//   dot(pic, Scale(pic,(i,g(i))), FCNPEN_SOLID, Fill(FCNPEN_SOLID));
// }
// label the curves
// Use n because 1 000 000 was too many dots for Asymptote
// label(pic,"$\sqrt{n}$",Scale(pic,(700000,f(700000))),2N,TICLABELPEN);
// label(pic,"$10\lg(n)$",Scale(pic,(700000,g(700000))),2N,TICLABELPEN);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");


// ........ v1 .................
picture pic;
int picnum = 1;
size(pic,5cm);

// limits
real xmin=-10;  // 
real xmax=10;
real ymin=-10;
real ymax=10;

pair b1_endpoint = (1,3);
pair b2_endpoint = (2,0);

// lines
draw(pic,-(3.5)*b1_endpoint--(3.5)*b1_endpoint,FCNPEN);
draw(pic,-5*b2_endpoint--5*b2_endpoint,FCNPEN);

// The basis vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\color{red}\small$\vec{\beta}_1$",b1_endpoint,SE);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\color{red}\small$\vec{\beta}_2$",b2_endpoint,SE);

// Other vectors
pair v1_endpoint = (3,6);
path v1 = (0,0)--v1_endpoint;
draw(pic, v1, blue, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"$\vec{v}_1$",v1_endpoint,E);
label(pic,"\color{blue}\large$+,+$",v1_endpoint+(2,0),E);
// pair v2_endpoint = (4,-6);
// path v2 = (0,0)--v2_endpoint;
// draw(pic, v2, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// // label(pic,"$\vec{v}_2$",v2_endpoint,S);
// label(pic,"\color{blue}\large$-,+$",v2_endpoint+(1,0),E);
// pair v3_endpoint = (-7,-3);
// path v3 = (0,0)--v3_endpoint;
// draw(pic, v3, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// // label(pic,"$\vec{v}_3$",v3_endpoint,W);
// label(pic,"\color{blue}\large$-,-$",v3_endpoint+(1,0),S);
// pair v4_endpoint = (-1,9);
// path v4 = (0,0)--v4_endpoint;
// draw(pic, v4, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// // label(pic,"$\vec{v}_4$",v4_endpoint,W);
// label(pic,"\color{blue}\large$+,-$",v4_endpoint-(1,0),W);

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


// ........ v2 .................
picture pic;
int picnum = 2;
size(pic,5cm);

// limits
real xmin=-10;  // 
real xmax=10;
real ymin=-10;
real ymax=10;

pair b1_endpoint = (1,3);
pair b2_endpoint = (2,0);

// lines
draw(pic,-(3.5)*b1_endpoint--(3.5)*b1_endpoint,FCNPEN);
draw(pic,-5*b2_endpoint--5*b2_endpoint,FCNPEN);

// The basis vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\color{red}\small$\vec{\beta}_1$",b1_endpoint,SE);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\color{red}\small$\vec{\beta}_2$",b2_endpoint,SE);

// Other vectors
// pair v1_endpoint = (3,6);
// path v1 = (0,0)--v1_endpoint;
// draw(pic, v1, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_1$",v1_endpoint,E);
// label(pic,"\color{blue}\large$+,+$",v1_endpoint+(2,0),E);
pair v2_endpoint = (4,-6);
path v2 = (0,0)--v2_endpoint;
draw(pic, v2, blue, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"$\vec{v}_2$",v2_endpoint,S);
label(pic,"\color{blue}\large$-,+$",v2_endpoint+(1,0),E);
// pair v3_endpoint = (-7,-3);
// path v3 = (0,0)--v3_endpoint;
// draw(pic, v3, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// // label(pic,"$\vec{v}_3$",v3_endpoint,W);
// label(pic,"\color{blue}\large$-,-$",v3_endpoint+(1,0),S);
// pair v4_endpoint = (-1,9);
// path v4 = (0,0)--v4_endpoint;
// draw(pic, v4, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// // label(pic,"$\vec{v}_4$",v4_endpoint,W);
// label(pic,"\color{blue}\large$+,-$",v4_endpoint-(1,0),W);

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


// ........ v3 .................
picture pic;
int picnum = 3;
size(pic,5cm);

// limits
real xmin=-10;  // 
real xmax=10;
real ymin=-10;
real ymax=10;

pair b1_endpoint = (1,3);
pair b2_endpoint = (2,0);

// lines
draw(pic,-(3.5)*b1_endpoint--(3.5)*b1_endpoint,FCNPEN);
draw(pic,-5*b2_endpoint--5*b2_endpoint,FCNPEN);

// The basis vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\color{red}\small$\vec{\beta}_1$",b1_endpoint,SE);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\color{red}\small$\vec{\beta}_2$",b2_endpoint,SE);

// Other vectors
// pair v1_endpoint = (3,6);
// path v1 = (0,0)--v1_endpoint;
// draw(pic, v1, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_1$",v1_endpoint,E);
// label(pic,"\color{blue}\large$+,+$",v1_endpoint+(2,0),E);
// pair v2_endpoint = (4,-6);
// path v2 = (0,0)--v2_endpoint;
// draw(pic, v2, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_2$",v2_endpoint,S);
// label(pic,"\color{blue}\large$-,+$",v2_endpoint+(1,0),E);
pair v3_endpoint = (-7,-3);
path v3 = (0,0)--v3_endpoint;
draw(pic, v3, blue, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"$\vec{v}_3$",v3_endpoint,W);
label(pic,"\color{blue}\large$-,-$",v3_endpoint+(1,0),S);
// pair v4_endpoint = (-1,9);
// path v4 = (0,0)--v4_endpoint;
// draw(pic, v4, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// // label(pic,"$\vec{v}_4$",v4_endpoint,W);
// label(pic,"\color{blue}\large$+,-$",v4_endpoint-(1,0),W);

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


// ........ v4 .................
picture pic;
int picnum = 4;
size(pic,5cm);

// limits
real xmin=-10;  // 
real xmax=10;
real ymin=-10;
real ymax=10;

pair b1_endpoint = (1,3);
pair b2_endpoint = (2,0);

// lines
draw(pic,-(3.5)*b1_endpoint--(3.5)*b1_endpoint,FCNPEN);
draw(pic,-5*b2_endpoint--5*b2_endpoint,FCNPEN);

// The basis vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\color{red}\small$\vec{\beta}_1$",b1_endpoint,SE);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\color{red}\small$\vec{\beta}_2$",b2_endpoint,SE);

// Other vectors
// pair v1_endpoint = (3,6);
// path v1 = (0,0)--v1_endpoint;
// draw(pic, v1, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_1$",v1_endpoint,E);
// label(pic,"\color{blue}\large$+,+$",v1_endpoint+(2,0),E);
// pair v2_endpoint = (4,-6);
// path v2 = (0,0)--v2_endpoint;
// draw(pic, v2, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_2$",v2_endpoint,S);
// label(pic,"\color{blue}\large$-,+$",v2_endpoint+(1,0),E);
// pair v3_endpoint = (-7,-3);
// path v3 = (0,0)--v3_endpoint;
// draw(pic, v3, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// // label(pic,"$\vec{v}_3$",v3_endpoint,W);
// label(pic,"\color{blue}\large$-,-$",v3_endpoint+(1,0),S);
pair v4_endpoint = (-1,9);
path v4 = (0,0)--v4_endpoint;
draw(pic, v4, blue, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"$\vec{v}_4$",v4_endpoint,W);
label(pic,"\color{blue}\large$+,-$",v4_endpoint-(2,1),W);

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


// ........ coord system .................
picture pic;
int picnum = 5;
unitsize(pic,0.25cm);

// limits
real xmin=-10;  // 
real xmax=10;
real ymin=-10;
real ymax=10;

pair b1_endpoint = (1,3);
pair b2_endpoint = (2,0);

// lines
draw(pic,-(3.5)*b1_endpoint--(3.5)*b1_endpoint,FCNPEN);
draw(pic,-5*b2_endpoint--5*b2_endpoint,FCNPEN);


// coord lines
path b1_line = (-4.25)*b1_endpoint--(4.25)*b1_endpoint; 
path b2_line = -(4.25)*b2_endpoint--(4.25)*b2_endpoint; 
draw(pic,shift(-4*b2_endpoint)*b1_line, green);
draw(pic,shift(-3*b2_endpoint)*b1_line, green);
draw(pic,shift(-2*b2_endpoint)*b1_line, green);
draw(pic,shift(-1*b2_endpoint)*b1_line, green);
draw(pic,shift(0*b2_endpoint)*b1_line, green);
draw(pic,shift(1*b2_endpoint)*b1_line, green);
draw(pic,shift(2*b2_endpoint)*b1_line, green);
draw(pic,shift(3*b2_endpoint)*b1_line, green);
draw(pic,shift(4*b2_endpoint)*b1_line, green);
draw(pic,shift(-4*b1_endpoint)*b2_line, green);
draw(pic,shift(-3*b1_endpoint)*b2_line, green);
draw(pic,shift(-2*b1_endpoint)*b2_line, green);
draw(pic,shift(-1*b1_endpoint)*b2_line, green);
draw(pic,shift(0*b1_endpoint)*b2_line, green);
draw(pic,shift(1*b1_endpoint)*b2_line, green);
draw(pic,shift(2*b1_endpoint)*b2_line, green);
draw(pic,shift(3*b1_endpoint)*b2_line, green);
draw(pic,shift(4*b1_endpoint)*b2_line, green);

// The basis vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\color{red}\small$\vec{\beta}_1$",b1_endpoint,SE);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\color{red}\small$\vec{\beta}_2$",b2_endpoint,SE);


// Other vectors
pair v1_endpoint = (3,6);
path v1 = (0,0)--v1_endpoint;
draw(pic, v1, blue, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"$\vec{v}_1$",v1_endpoint,E);
label(pic,"$\rep{\vec{v}_1}{B}=\colvec{2 \\ 1/2}$",(-6,8),W);
// label(pic,"\color{blue}\large$+,+$",v1_endpoint+(2,0),E);
// pair v2_endpoint = (4,-6);
// path v2 = (0,0)--v2_endpoint;
// draw(pic, v2, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_2$",v2_endpoint,S);
// label(pic,"\color{blue}\large$-,+$",v2_endpoint+(1,0),E);
// pair v3_endpoint = (-7,-3);
// path v3 = (0,0)--v3_endpoint;
// draw(pic, v3, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// // label(pic,"$\vec{v}_3$",v3_endpoint,W);
// label(pic,"\color{blue}\large$-,-$",v3_endpoint+(1,0),S);
// pair v4_endpoint = (-1,9);
// path v4 = (0,0)--v4_endpoint;
// draw(pic, v4, blue, Arrow(DefaultHead,VECTORHEADSIZE));
// label(pic,"$\vec{v}_4$",v4_endpoint,W);
// label(pic,"\color{blue}\large$+,-$",v4_endpoint-(2,1),W);

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



// ====== Exchange Lemma ===========
picture pic;
int picnum = 6;
size(pic,5cm);

// limits
real xmin=-5;  // 
real xmax=5;
real ymin=-5;
real ymax=5;

pair b1_endpoint = (2,1);
pair b2_endpoint = (1,3);

// lines
// draw(pic,-(3.5)*b1_endpoint--(3.5)*b1_endpoint,FCNPEN);
// draw(pic,-5*b2_endpoint--5*b2_endpoint,FCNPEN);

// The basis vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\small$\vec{\beta}_1$",b1_endpoint,E);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\small$\vec{\beta}_2$",b2_endpoint,NE);

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


// .................. exchanged ...............
picture pic;
int picnum = 7;
size(pic,5cm);

// limits
real xmin=-5;  // 
real xmax=5;
real ymin=-5;
real ymax=5;

pair b1_endpoint = (2,1);
pair b2_endpoint = (2.1,1.3);

// lines
// draw(pic,-(3.5)*b1_endpoint--(3.5)*b1_endpoint,FCNPEN);
// draw(pic,-5*b2_endpoint--5*b2_endpoint,FCNPEN);

// The basis vectors
path b1 = (0,0)--b1_endpoint;
draw(pic, b1, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\small$\vec{\delta}_1$",b1_endpoint,E);
path b2 = (0,0)--b2_endpoint;
draw(pic, b2, red, Arrow(DefaultHead,VECTORHEADSIZE));
label(pic,"\small$\vec{\delta}_2$",b2_endpoint,NE);

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

