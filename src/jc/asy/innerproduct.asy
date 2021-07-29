// innerproduct.asy
// From Linear Algebra by Jim Hefferon

import settings;
outformat="pdf";
settings.render=0;  // make output not be PRC
// settings.maxtile=(20,20);

// Set LaTeX defaults
cd("../../asy/");
import settexpreamble;
cd("");
settexpreamble();
// Asy defaults
cd("../../asy/");
import jh;
cd("");

string OUTPUT_FN = "innerproduct%03d";

import graph;

// some parameters
real axis_arrow_size = 0.35mm;
real axis_tick_size = 0.75mm;

// ================= defn of a+bi, conj ===============

picture pic;
int picnum = 0;
size(pic,5cm);
// real scalefactor = 1000;
// scale(pic,Linear(scalefactor),Linear(5000));

real a=4;
real b=2;

dotfactor=1.5; // http://asymptote.sourceforge.net/FAQ/section3.html

pair z=(a,b);
dot(pic, z, FCNPEN_SOLID, Fill(FCNPEN_SOLID));
label(pic,"$z=a+bi$",z,E);
pair zconj=(a,-1*b);
dot(pic, zconj, FCNPEN_SOLID, Fill(FCNPEN_SOLID));
label(pic,"$\compconj{z}=a-bi$",zconj,E);
path zpath=(0,0)--z;
path zconjpath=(0,0)--zconj;

// draw the arc
path c=arc((0,0), 1.5, 0, aTan(b/a), CCW);
draw(pic,c);
label(pic,"$\theta=\arg(z)$",point(c,0.5),E);

draw(pic, subpath(zpath,0,0.96));
// draw(pic, zconjpath,FCNPEN_SOLID);

// axes
xaxis(pic,
      xmin=-0.5,xmax=a+1.5,
      gray(0.5),
      arrow=None);
xtick(pic,"$a$",(a,0),size=-2pt);

yaxis(pic,
      ymin=-1*b-0.5,ymax=b+0.5,
      gray(0.5),
      arrow=None);
ytick(pic,"$b$",(0,b),size=-2pt);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");

