// two_i_line_slope_two.asy
import jh;
real height; height=3cm; size(0,height);
import settings;
// settings.render=0;   // for png: -10;  // fewer jaggies but very slow
// settings.maxtile=(10,10);
settings.outformat="pdf";

pen line_pen=linecap(0)
             +linewidth(1pt);
pen dotted_line_pen=linecap(1)
  +linewidth(1pt)
  +gray(0.7)
  +linetype(new real[] {0,4});

// Axes
path xaxis=(-0.75,0)--(2.5,0);
path yaxis=(0,-1.85)--(0,5.1);
real ticklength=0.1;

// Draw axes
draw(xaxis,AXISPEN);
for (int xtick=1; xtick<3; ++xtick) {
  draw((xtick,0)--(xtick,-1*ticklength),AXISPEN);
}
draw(yaxis,AXISPEN);
for (int ytick=1; ytick<6; ++ytick) {
  draw((0,ytick)--(-1*ticklength,ytick),AXISPEN);
}
// Draw line (can't just draw one line and erase as pdf reader doesn't cope)
path line1 = (-0.5,-1)--(-0.05,-0.1);
path line2 = (1.05,2.1)--(2.5,5);
draw(line1,line_pen);
draw(line2,line_pen);
// Vector
path v=(0,0)--(1,2);
draw(v,VECTORPEN+blue,Arrow(DefaultHead,VECTORHEADSIZE));
// Label
label("{\tiny $\colvec{1 \\ 2}$}",point(v,1),SE);

