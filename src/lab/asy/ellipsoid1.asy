// ellipsoid1.asy
// usepackage("../../conc");
import settings;
// settings.render=-30;  // -30 takes a very long time
// settings.maxtile=(10,10);
settings.outformat="pdf";
settings.render=0;
settings.prc=false;

import graph3;
size(4.75inch,0);
currentprojection=orthographic(-1,-4,0);
currentlight=light(-1,-4,10);

pen RGB(int R, int G, int B) {
  return(rgb(R/255.0, G/255.0, B/255.0));
}

transform3 rot=rotate(-15,(-1,1,0));
transform3 slide=shift((0,-35,0));
real a=3;
real b=2;
real c=1;
triple f(pair z) {
  triple v=(a*cos(z.x)*sin(z.y), b*sin(z.x)*sin(z.y), c*cos(z.y));
  return(v);
}


// pen tplane_color=RGB(211,8,27);  // 
pen tplane_color=RGB(253,177,199);  // 
pen sphere_color=rgb(0.8549,0.8941,0.9882);  // DAE4FC
// pen ellipsoid_color=rgb(0.9725,0.0,0.941);  // f80018
pen ellipsoid_color= rgb(0.098, 0.243, 0.604);  // f80018

// Tangent plane
real yextent=1.5;
real zextent=1.5;
path3 tplane=(a,-1*yextent,-1*zextent)
               -- (a,1*yextent,-1*zextent)
               -- (a,1*yextent,1*zextent)
               -- (a,-1*yextent,1*zextent) -- cycle;
// draw(slide*rot*surface(tplane),material(tplane_color,ambientpen=.7*tplane_color,emissivepen=.5*tplane_color,opacity=0.05));
draw(slide*rot*surface(tplane),material(tplane_color,.5*tplane_color));
label("\scriptsize $Q$",(shift((-0.5,0.0,0.0))*slide*rot*(a,0.5,1.1)));
int meshnumber=20;


// Draw the ellipsoid
surface s=surface(f,(0,0),(2pi,pi),meshnumber,meshnumber,Spline);
// pen ellipsoid_color=rgb(1.0,0.85,0.4);
// pen ellipsoid_color=rgb(0.9725,0.0,0.941);  // f80018
draw(slide*rot*s,material(ellipsoid_color,0.40*white,0.5*white));
pen vec_pen=linecap(0)
             +linewidth(.5pt);
real VECTORHEADSIZE=3;
path3 w=(0,0,0)--rot*(a,0,0);
label(Label("\scriptsize $\vec{w}$",Relative(0.45)),slide*w);
draw(slide*w,vec_pen+red,Arrow3(DefaultHead2,VECTORHEADSIZE,FillDraw));

// draw(rot*tplane);
// axes3((-1.25*a,-1.25*b,-1.25*c),(1.35*a,1.25*b,1.25*c),xlabel="{\tiny $x$}");

// Draw the unit sphere, with the tangent plane
transform3 P_transform=rotate(15,(1,1,0));  // applied to v, and tangent plane  
draw(shift((1,0,0))*P_transform*shift(-a,0,0)*surface(tplane),material(tplane_color,0.65*white,.2*tplane_color));
label("\scriptsize $P$",(shift((1.35,0.0,0.5))*P_transform*(0,0.7,1.2)));
// sphere
// draw(scale(1,1,1)*unitsphere,material(sphere_color,0.05*lightblue,0.3*sphere_color));
draw(scale(1,1,1)*unitsphere,material(sphere_color,0.35*white,0.4*sphere_color));
// 
path3 v=(0,0,0)--P_transform*(1,0,0);
draw(v,vec_pen+blue,Arrow3(DefaultHead2,VECTORHEADSIZE,FillDraw));
label(Label("\scriptsize $\vec{v}$",Relative(0.4)),v);

// draw the maps under
label("$\stackrel{t}{\longrightarrow}$",(0,-15,.3));
