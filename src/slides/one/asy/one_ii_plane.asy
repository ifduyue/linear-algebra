// one_ii_plane.asy
import jh;
real height; height=3cm; size(0,height);
import settings;
settings.render=0;   // for png: -10;  // fewer jaggies but very slow
settings.maxtile=(10,10);
settings.outformat="pdf";
settings.prc=false;
  
import three;
import graph3;
triple camera=(10,2,3);    //(20,4,3);
currentprojection=orthographic(camera=camera,target=(0,0,0));
currentlight=camera; // 

pen line_pen=linecap(0)
             +linewidth(1.5pt);
pen dotted_line_pen=linecap(1)
  +linewidth(1pt)
  +gray(0.7)
  +linetype(new real[] {0,4});

triple defining_vector1 = (1,0,5);
triple defining_vector2 = (2,1,-3);
triple defining_vector3 = (-2,4,0.5);
triple plane_vector1 = defining_vector2-defining_vector1;
triple plane_vector2 = defining_vector3-defining_vector1;
//write("x, y, z= "+format("%f",plane_vector1.x)+","+format("%f",plane_vector1.y)+", "+format("%f",plane_vector1.z));

// Return the corner points used to draw the plane.
triple corner_points(real t, real s) {
  return (1,0,5)+t*plane_vector1+s*plane_vector2;
}

triple v1=corner_points(-0.25,-0.25);
triple v2=corner_points(1.25,-0.25);
triple v3=corner_points(1.25,1.25);
triple v4=corner_points(-0.25,1.25);

path3 planeedge = v1--v2--v3--v4--cycle;
surface s = surface(planeedge);

// Find largest and smallest x, etc.
real[] xcoords;
real[] ycoords;
real[] zcoords;
xcoords.push(v1.x); ycoords.push(v1.y); zcoords.push(v1.z);
xcoords.push(v2.x); ycoords.push(v2.y); zcoords.push(v2.z);
xcoords.push(v3.x); ycoords.push(v3.y); zcoords.push(v3.z);
xcoords.push(v4.x); ycoords.push(v4.y); zcoords.push(v4.z);
real x_largest=max(xcoords);
real x_smallest=min(xcoords);
real y_largest=max(ycoords);
real y_smallest=min(ycoords);
real z_largest=max(zcoords);
real z_smallest=min(zcoords);

// Axes
axes3(xlabel="{$\scriptstyle x$}",ylabel="{$\scriptstyle y$}",zlabel="{$\scriptstyle z$}", 
      min=(2*x_smallest,y_smallest,0.6*z_smallest),
      max=(2*x_largest,y_largest,z_largest),
      AXISPEN,
      arrow=None);
// xaxis3(Label("{\tiny x}"),YZZero, 
//       min=x_smallest,
//       max=x_largest,
//       AXISPEN,
//        // tics=InTicks,
//       arrow=EndArrow3(DefaultHead2,size=2));

// Draw the vector that define the plane
draw((0,0,0)--defining_vector1,arrow=EndArrow3(DefaultHead2,size=2));
draw((0,0,0)--defining_vector2,arrow=EndArrow3(DefaultHead2,size=2));
draw((0,0,0)--defining_vector3,arrow=EndArrow3(DefaultHead2,size=2));

// Draw the plane
draw(s,MAINPEN+paleyellow+opacity(0.7));  // only works on adobe renderer?

// Draw the vectors whose bodies lie in the plane
draw(defining_vector1--shift(defining_vector1)*plane_vector1,red,arrow=EndArrow3(DefaultHead2,size=2));
draw(defining_vector1--shift(defining_vector1)*plane_vector2,red,arrow=EndArrow3(DefaultHead2,size=2));
