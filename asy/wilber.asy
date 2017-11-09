import settings;
outformat="pdf";
settings.render=0;  // make output not be PRC
// settings.maxtile=(20,20);


pair coilpoint(real lambda, real r, real t)
{
  return (2.0*lambda*t+r*cos(t),r*sin(t));
}
  
guide coil(guide g=nullpath, real lambda, real r, real a, real b, int n)
{
  real width=(b-a)/n;
  for(int i=0; i <= n; ++i) {
    real t=a+width*i;
    g=g..coilpoint(lambda,r,t);
  }
  return g;
}



picture p;
int picnum = 0;
unitsize(p,0.05cm,0.01cm);

// parameters
real r=3;
real t1=-pi; 
real t2=12*pi;
real x = -5;
real lambda=5/3;  //(t2-t1+x)/(t2-t1);
pair b=coilpoint(lambda,r,t1);
pair c=coilpoint(lambda,r,t2);
pair a=b-10;
pair d=c+10;

// top
pair spring_top = rotate(90)*d;
path anchor = (-10,spring_top.y)--(10,spring_top.y);
draw(p,anchor,linewidth(0.4));
path shadeline = (0,0)--(2,8);
int num_shadelines = 10;
for(int i=0; i < num_shadelines; ++i) {
  draw(p,shift(point(anchor,i/num_shadelines))*shadeline,linewidth(0.2));
}
path clipanchor = (0,0)..(1,5)..(3,8)..(10,7.2)..(17,8)..(19,3)..(21,-1)--(0,-1)..cycle;
// draw(p,shift(point(anchor,0))*clipanchor,green);
clip(p,shift(point(anchor,0))*clipanchor);

// cylinder
pen cylinder_pen = linewidth(0.8pt);
path cylinder_top = shift(rotate(90)*a)*scale(8,6)*unitcircle;
path cylinder_bot = shift(0,-40)*cylinder_top;
path cylinder_bot_front = subpath(cylinder_bot,2.0,4.0);
path cylinder_rt = point(cylinder_top,0.0)--point(cylinder_bot,0.0);
path cylinder_left = point(cylinder_top,2.0)--point(cylinder_bot,2.0);
draw(p,cylinder_rt,cylinder_pen);
draw(p,cylinder_left,cylinder_pen);
filldraw(p,cylinder_top,drawpen=cylinder_pen,fillpen=gray(0.9));
draw(p,cylinder_bot_front,cylinder_pen);

// outriggers
pair outrigger_left_start = point(cylinder_left,0.5);
pair outrigger_right_start = point(cylinder_rt,0.5);
real outrigger_len = 5; 
path outrigger_left = outrigger_left_start--shift(-1*outrigger_len,0)*outrigger_left_start;
path outrigger_right = outrigger_right_start--shift(outrigger_len,0)*outrigger_right_start;
// draw(p,outrigger_left,green);
// draw(p,outrigger_right,green);

// spring
pen spring_pen = linewidth(0.4pt);
path spr = a--b..coil(lambda,r,t1,t2,100)..c--d;
draw(p,rotate(90)*spr,spring_pen);

shipout(format("wilber%03d",picnum),p,format="pdf");



// ====== Show motions; rotation arrow both ways ==================
picture p;
int picnum = 1;
unitsize(p,0.05cm,0.01cm);

pen graypen = gray(0.7);

for(int i=0; i < num_shadelines; ++i) {
  draw(p,shift(point(anchor,i/num_shadelines))*shadeline,linewidth(0.2)+graypen);
}
clip(p,shift(point(anchor,0))*clipanchor);

// yaw axis; draw this before cylinder so it gets overwritten
pair cylinder_middle_bot = point(cylinder_bot_front,1);
path yaw_axis = cylinder_middle_bot--(cylinder_middle_bot.x,cylinder_middle_bot.y-35);
pen yaw_axis_pen = linetype(new real[] {0,3});
draw(p,yaw_axis,yaw_axis_pen);

// cylinder
draw(p,cylinder_rt,cylinder_pen+graypen);
draw(p,cylinder_left,cylinder_pen+graypen);
filldraw(p,cylinder_top,drawpen=cylinder_pen+graypen,fillpen=gray(0.9));
draw(p,cylinder_bot_front,cylinder_pen+graypen);

// spring
draw(p,rotate(90)*spr,spring_pen+graypen);

// yaw action
path yaw = shift(0,-60)*shift(rotate(90)*a)*scale(1.5)*scale(4,3)*subpath(unitcircle,1.5,4.5);
draw(p,yaw,arrow=None);
draw(p,point(yaw,0.65)--point(yaw,0),arrow=EndArrow);
draw(p,point(yaw,4-0.65)--point(yaw,4),arrow=EndArrow);
label(p,"{\scriptsize $\theta(t)$}",point(yaw,2.75),align=SE);

// vert action
path vert = shift(-5,0)*cylinder_left;
draw(p,vert,arrow=Arrows(size=1.5));
label(p,"{\scriptsize $x(t)$}",point(vert,0.1),align=W);

shipout(format("wilber%03d",picnum),p,format="pdf");




// ====== Show motions; rotation arrow to make spring longer or shorter =====
picture p;
int picnum = 2;
unitsize(p,0.05cm,0.01cm);

pen graypen = gray(0.7);

for(int i=0; i < num_shadelines; ++i) {
  draw(p,shift(point(anchor,i/num_shadelines))*shadeline,linewidth(0.2)+graypen);
}
clip(p,shift(point(anchor,0))*clipanchor);

// yaw axis; draw this before cylinder so it gets overwritten
pair cylinder_middle_bot = point(cylinder_bot_front,1);
path yaw_axis = cylinder_middle_bot--(cylinder_middle_bot.x,cylinder_middle_bot.y-50);
pen yaw_axis_pen = linetype(new real[] {0,3});
draw(p,yaw_axis,yaw_axis_pen);

// cylinder
draw(p,cylinder_rt,cylinder_pen+graypen);
draw(p,cylinder_left,cylinder_pen+graypen);
filldraw(p,cylinder_top,drawpen=cylinder_pen+graypen,fillpen=gray(0.9));
draw(p,cylinder_bot_front,cylinder_pen+graypen);

// spring
draw(p,rotate(90)*spr,spring_pen+graypen);

// yaw action
path yaw = shift(0,-60)*shift(rotate(90)*a)*scale(1.5)*scale(4,3)*subpath(unitcircle,1.5,4.5);
path yaw_lengthen = subpath(yaw,0,3);
draw(p,yaw_lengthen,arrow=None);
draw(p,point(yaw_lengthen,0.65)--point(yaw_lengthen,0),arrow=EndArrow);
label(p,"{\scriptsize spring lengthens}",point(yaw_lengthen,0.75),align=W);
path yaw_shorten = shift(0,-20)*subpath(yaw,1,4);
draw(p,yaw_shorten,arrow=None);
label(p,"{\scriptsize spring shortens}",point(yaw_shorten,3.25)+(1,0),align=E);

// vert action
// path vert = shift(-5,0)*cylinder_left;
// draw(p,vert,arrow=Arrows(size=1.5));
// label(p,"\scriptsize $x(t)$",point(vert,0.1),align=W);

shipout(format("wilber%03d",picnum),p,format="pdf");



// ====== Cosine graph ==================

picture p;
int picnum = 3;

unitsize(p,0.65cm);
import graph;

// xlimits( -1, 3pi);
xaxis(p,Label("\makebox[0em][l]{\footnotesize time~$t$}",black),xmin=-0.2,xmax=2pi+0.4,gray(0.5),arrow=None);
// xaxis(p, xmin=-0.2,xmax=2pi+0.4,gray(0.5),arrow=None);
// ylimits(-1.2, 1.2);
yaxis(p,Label("\makebox[0em][r]{\footnotesize position~$x$}",black),ymin=-1.2,ymax=1.2,gray(0.5),arrow=None);
// yaxis(p,Label("position~$x$"),ymin=-1.2,ymax=1.2,gray(0.5),arrow=None);
// yaxis(p, ymin=-12,ymax=12,gray(0.5),arrow=None);
draw(p,graph(p,new real(real x){return cos((3.5)*x);},0pi,2pi));

dot(p,(-2.5,0),white);
dot(p,(8.25,0),white);
shipout(format("wilber%03d",picnum),p,format="pdf");
