// four_ii_2dtransedsizeb.asy
import jh;
real height; height=2.5cm; size(0,height);
usepackage("amsmath");
import settings;
// settings.render=-7;  // fewer jaggies but very slow
// settings.maxtile=(10,10);
settings.outformat="pdf";
settings.prc=false;

pen line_pen=linecap(0)
             +linewidth(1.5pt);
pen dotted_line_pen=linecap(1)
  +linewidth(1pt)
  +gray(0.7)
  +linetype(new real[] {0,4});

// Axes
path xaxis=(-0.5,0)--(5.5,0);
path yaxis=(0,-.5)--(0,10.5);
real ticklength=0.15;

// Vectors
pair a1=(1,3); // image of (1,0) under (1 2 \\ 3 4)
pair a2=(3,7);  // image of (1,1)
path v1=(0,0)--a1;
path v2=(0,0)--a2;
path parallelogram=(0,0)--a1--(a1+a2)--a2--cycle;

// Draw
draw(xaxis,AXISPEN);
for(int i=0; i<6; ++i){
  draw((i,0)--(i,-1*ticklength),AXISPEN);
}
draw(yaxis,AXISPEN);
for(int j=0; j<11; ++j){
  draw((0,j)--(-1*ticklength,j),AXISPEN);
}
filldraw(parallelogram,FILLCOLOR,VECTORPEN+gray(0.8));
draw(v1,VECTORPEN,Arrow(DefaultHead,.7*VECTORHEADSIZE));
draw(v2,VECTORPEN,Arrow(DefaultHead,.7*VECTORHEADSIZE));
// Label
label("\tiny $s(\vec{v}_1)$",a1,W);
label("\tiny $s(\vec{v}_2)$",a2,E);
