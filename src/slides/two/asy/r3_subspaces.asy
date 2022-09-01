// r3_subspaces.asy
import jh;
// import settexpreamble;
//   settexpreamble();
// real height; height=8.5cm; size(0,height); // beamer is 12.8cm x 9.6cm
import settings;
// settings.render=0;   // for png: -10;  // fewer jaggies but very slow
// settings.maxtile=(10,10);
settings.outformat="pdf";

import node;  // node 5.0

// parameters to lay out the nodes
real level_gap=2.65cm;
real horiz_gap=2cm;

// height of the four levels
real dimthree=3*level_gap;
real dimtwo=2*level_gap;
real dimone=1*level_gap;
real dimzero=0*level_gap;

real mag=0.75;
real marginwd=4pt;

pen edgepen=fontsize(8pt)+linewidth(0.4pt)+lightblue;

draw((0,0)--(10,10));

// define style
defaultnodestyle=nodestyle(xmargin=4pt, ymargin=2pt, drawfn=FillDrawer(white,white));
defaultdrawstyle=drawstyle(p=fontsize(8pt)+fontcommand("\ttfamily"), arrow=Arrow(6));


// contents
node rthree=nbox("$\Re^3$");
node xyplane=nbox("$xy$-plane");
node pone=nbox("$\set{\colvec{x \\ y \\ z}\suchthat x+y+z=0}$");
node ptwo=nbox("$\set{\colvec{x \\ y \\ z}\suchthat x+2z=0}$");
node pthree=nbox("\ldots");
node yaxis=nbox("$y$-axis");
node lone=nbox("$\set{\colvec{x \\ y \\ z}\suchthat \text{$x-y+z=0$ and $x+2z=0$}}$");
node ltwo=nbox("$\set{\colvec{x \\ y \\ z}\suchthat \text{$y=2x$ and $z=0$}}$");
node lthree=nbox("\ldots");
node triv=nbox("trivial subspace $\set{\colvec{0 \\ 0 \\ 0}}$");

// layout
rthree.pos=(0pt,dimthree);
xyplane.pos=(-3.4*horiz_gap,dimtwo);
pone.pos=(-1.7*horiz_gap,dimtwo);
ptwo.pos=(0.1*horiz_gap,dimtwo);
pthree.pos=(1.1*horiz_gap,dimtwo);
yaxis.pos=(-4.3*horiz_gap,dimone);
lone.pos=(-2.2*horiz_gap,dimone);
ltwo.pos=(0.2*horiz_gap,dimone);
lthree.pos=(1.4*horiz_gap,dimone);
triv.pos=(0,dimzero);


// draw the nodes
draw(rthree,xyplane,pone,ptwo,pthree,yaxis,lone,ltwo,lthree,triv);


// draw the connections
draw(rthree--xyplane,edgepen);
draw(rthree--pone,edgepen);
draw(rthree--ptwo,edgepen);
draw(xyplane--yaxis,edgepen);
draw(xyplane--ltwo,edgepen);
draw(ptwo--lone,edgepen);
draw(ptwo--yaxis,edgepen);
draw(yaxis--triv,edgepen);
draw(lone--triv,edgepen);
draw(ltwo--triv,edgepen);
