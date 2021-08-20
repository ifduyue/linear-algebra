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
label(pic,"$z=a+bi$",z,1.75*E);
pair zconj=(a,-1*b);
dot(pic, zconj, FCNPEN_SOLID, Fill(FCNPEN_SOLID));
label(pic,"$\compconj{z}=a-bi$",zconj,1.75*E);
path zpath=(0,0)--z;
path zconjpath=(0,0)--zconj;

// draw the arc
path c=arc((0,0), 1.75, 0, aTan(b/a), CCW);
draw(pic,c,Arrow(DefaultHead,4pt));
label(pic,"$\theta=\arg(z)$",point(c,0.5),1.75*E);

// line from origin to z
pen zline_pen = linetype(new real[] {3,6});

draw(pic, subpath(zpath,0.04,0.94), zline_pen);
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



// ================= parallelogram diagram ===============
picture pic;
int picnum = 1;
size(pic,4cm);
// real scalefactor = 1000;
// scale(pic,Linear(scalefactor),Linear(5000));

real ARROW_SIZE = 4pt;   // MP's default is 4bp
real ARROW_ANGLE = 20;  // from gr/mp/ch1.mp  (why half?) 

dotfactor=1.5; // http://asymptote.sourceforge.net/FAQ/section3.html

pair v=(6,0);
pair w=(1,4);

path parallelogram_bottom = (0,0)--v;
path parallelogram_top = shift(w)*parallelogram_bottom;
path parallelogram_left = (0,0)--w;
path parallelogram_right = shift(v)*parallelogram_left;

path main_diag = (0,0)--(v+w);
path off_diag = w--v;

draw(pic, Label("$\vec{v}$",Relative(0.5)), parallelogram_bottom,
     VECTORPEN,
     Arrow(ARROW_SIZE, ARROW_ANGLE));
draw(pic, parallelogram_top,
     FCNPEN_SOLID+gray(0.5));
draw(pic, Label("$\vec{w}$",Relative(0.5)), parallelogram_left, W,
     VECTORPEN,
     Arrow(ARROW_SIZE, ARROW_ANGLE));
draw(pic, parallelogram_right,
     FCNPEN_SOLID+gray(0.5));
draw(pic, Label("$\vec{v}+\vec{w}$",Relative(0.65)), main_diag, 2.5*N,
     VECTORPEN,
     Arrow(ARROW_SIZE, ARROW_ANGLE));
draw(pic, Label("$\vec{v}-\vec{w}$",Relative(0.65)), off_diag, 1.75*E,
     VECTORPEN,
     Arrow(ARROW_SIZE, ARROW_ANGLE));

// label(pic, "$\angle A$", w, 1.5*NW);
// label(pic, "$\angle B$", (0,0), 1.5*SW);

shipout(format(OUTPUT_FN,picnum),pic,format="pdf");

