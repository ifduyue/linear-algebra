// shadow.asy
//  Shadow of axes for book cover

import three;
import bsp;
import settings;
settings.outformat="pdf";
settings.render=0;  // just draw it, not three-d shape

size(72*3);  // 72 pts per inch

currentprojection=perspective(4,6.5,5);

pen p=linewidth(0.4)+squarecap+miterjoin+black+opacity(0.2);
defaultpen(p);

real XLIMIT_POS=1;
real XLIMIT_NEG=-1*XLIMIT_POS;
real YLIMIT_POS=2;
real YLIMIT_NEG=-1*YLIMIT_POS;
real ZLIMIT_POS=4;
real ZLIMIT_NEG=-1*ZLIMIT_POS;

pen INSIDE_SHADE = gray(0.7);
pen OUTSIDE_SHADE = gray(0.99);

// boundary of quandrants to be shaded
path3 floor_q1 = (0,0,ZLIMIT_NEG)--(XLIMIT_POS,0,ZLIMIT_NEG)
  --(XLIMIT_POS,YLIMIT_POS,ZLIMIT_NEG)--(0,YLIMIT_POS,ZLIMIT_NEG)--cycle;
path3 floor_q2 = (0,0,ZLIMIT_NEG)--(XLIMIT_NEG,0,ZLIMIT_NEG)
  --(XLIMIT_NEG,YLIMIT_POS,ZLIMIT_NEG)--(0,YLIMIT_POS,ZLIMIT_NEG)--cycle;
path3 floor_q3 = (0,0,ZLIMIT_NEG)--(XLIMIT_NEG,0,ZLIMIT_NEG)
  --(XLIMIT_NEG,YLIMIT_NEG,ZLIMIT_NEG)--(0,YLIMIT_NEG,ZLIMIT_NEG)--cycle;
path3 floor_q4 = (0,0,ZLIMIT_NEG)--(XLIMIT_POS,0,ZLIMIT_NEG)
  --(XLIMIT_POS,YLIMIT_NEG,ZLIMIT_NEG)--(0,YLIMIT_NEG,ZLIMIT_NEG)--cycle;
// quadrants
surface q1 =surface(floor_q1,new pen[] {INSIDE_SHADE,OUTSIDE_SHADE,OUTSIDE_SHADE,OUTSIDE_SHADE});
surface q2 =surface(floor_q2,new pen[] {INSIDE_SHADE,OUTSIDE_SHADE,OUTSIDE_SHADE,OUTSIDE_SHADE});
surface q3 =surface(floor_q3,new pen[] {INSIDE_SHADE,OUTSIDE_SHADE,OUTSIDE_SHADE,OUTSIDE_SHADE});
surface q4 =surface(floor_q4,new pen[] {INSIDE_SHADE,OUTSIDE_SHADE,OUTSIDE_SHADE,OUTSIDE_SHADE});
size(72*2);
draw(q1,nolight);
draw(q2,nolight);
draw(q3,nolight);
draw(q4,nolight);
