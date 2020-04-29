// try.asy
//  Testbed for axes for book cover

import three;

import settings;
settings.outformat="pdf";
settings.render=0;  // just draw it, not three-d shape

size(72*3);  // 72 pts per inch

currentprojection=perspective(4,6.5,5);
// currentlight=light(diffuse=gray(.6), ambient=yellow, specular=paleyellow,
//                    specularfactor=0.1, viewport=false,(4,6.5,10));
currentlight=light(diffuse=gray(0.3), ambient=gray(0.4), specular=gray(0.3),
                  specularfactor=0.0, viewport=false,(4,6.5,10));
// currentlight = nolight;

// pen p=linewidth(0.4)+squarecap+miterjoin+black+opacity(0.2);
pen p=linewidth(0.8)+squarecap+miterjoin+black+opacity(0.0);
defaultpen(p);


// From https://www.color-hex.com/color-palette/90232 no identifying info
// pen darkcolor     = rgb(225,178,0); // yz plane
pen darkcolor     = rgb(212,175,55); // yz plane
pen boldcolor     = rgb(0,67,37); //  xy plane
// pen lightcolor    = rgb(0,173,173); // xz plane  cyan
pen lightcolor    = rgb(103,0,153); // xz plane  Purple #670099
pen bgcolor       = rgb(237,237,237); // hex(ededed);
pen flourishcolor  = rgb(60,9,4); // hex();

real XLIMIT_POS=1;
real XLIMIT_NEG=-1*XLIMIT_POS;
real YLIMIT_POS=2;
real YLIMIT_NEG=-1*YLIMIT_POS;
real ZLIMIT_POS=4;
real ZLIMIT_NEG=-1*ZLIMIT_POS;


path3 xz=(XLIMIT_POS,0,ZLIMIT_POS)
  --(XLIMIT_NEG,0,ZLIMIT_POS)
  --(XLIMIT_NEG,0,ZLIMIT_NEG)
  --(XLIMIT_POS,0,ZLIMIT_NEG)
  --cycle;
path3 xy=(XLIMIT_POS,YLIMIT_POS,0)
  --(XLIMIT_NEG,YLIMIT_POS,0)
  --(XLIMIT_NEG,YLIMIT_NEG,0)
  --(XLIMIT_POS,YLIMIT_NEG,0)
  --cycle;
path3 yz=(0,YLIMIT_POS,ZLIMIT_POS)
  --(0,YLIMIT_NEG,ZLIMIT_POS)
  --(0,YLIMIT_NEG,ZLIMIT_NEG)
  --(0,YLIMIT_POS,ZLIMIT_NEG)
  --cycle;

// Octants
// x,y,z>0
path3 xz_front=(XLIMIT_POS,0,ZLIMIT_POS)
  --(0,0,ZLIMIT_POS)
  --(0,0,0)
  --(XLIMIT_POS,0,0)
  --cycle;
path3 xy_front=(XLIMIT_POS,YLIMIT_POS,0)
  --(0,YLIMIT_POS,0)
  --(0,0,0)
  --(XLIMIT_POS,0,0)
  --cycle;
path3 yz_front=(0,YLIMIT_POS,ZLIMIT_POS)
  --(0,0,ZLIMIT_POS)
  --(0,0,0)
  --(0,YLIMIT_POS,0)
  --cycle;
// left x,z>0 y<0
path3 xz_left=(XLIMIT_POS,0,ZLIMIT_POS)
  --(XLIMIT_NEG,0,ZLIMIT_POS)
  --(XLIMIT_NEG,0,0)
  --(XLIMIT_POS,0,0)
  --cycle;
path3 xy_left=(XLIMIT_POS,0,0)
  --(XLIMIT_NEG,0,0)
  --(XLIMIT_NEG,YLIMIT_NEG,0)
  --(XLIMIT_POS,YLIMIT_NEG,0)
  --cycle;
path3 yz_left=(0,0,ZLIMIT_POS)
  --(0,YLIMIT_NEG,ZLIMIT_POS)
  --(0,YLIMIT_NEG,0)
  --(0,0,0)
  --cycle;
// right y,z>0 x<0
path3 xz_right=(0,0,ZLIMIT_POS)
  --(XLIMIT_NEG,0,ZLIMIT_POS)
  --(XLIMIT_NEG,0,0)
  --(0,0,0)
  --cycle;
path3 xy_right=(0,YLIMIT_POS,0)
  --(XLIMIT_NEG,YLIMIT_POS,0)
  --(XLIMIT_NEG,0,0)
  --(0,0,0)
  --cycle;
path3 yz_right=(0,YLIMIT_POS,ZLIMIT_POS)
  --(0,0,ZLIMIT_POS)
  --(0,0,0)
  --(0,YLIMIT_POS,0)
  --cycle;
// bottom front
// x,y>0, z<0
path3 xz_botfront=(XLIMIT_POS,0,0)
  --(0,0,0)
  --(0,0,ZLIMIT_NEG)
  --(XLIMIT_POS,0,ZLIMIT_NEG)
  --cycle;
path3 xy_botfront=(XLIMIT_POS,YLIMIT_POS,0)
  --(0,YLIMIT_POS,0)
  --(0,0,0)
  --(XLIMIT_POS,0,0)
  --cycle;
path3 yz_botfront=(0,YLIMIT_POS,0)
  --(0,0,0)
  --(0,0,ZLIMIT_NEG)
  --(0,YLIMIT_POS,ZLIMIT_NEG)
  --cycle;



picture pic;
size(pic,72*3);

surface xyplane = surface(xy);
surface xzplane = surface(xz);
surface yzplane = surface(yz);
surface xyplane_front = surface(xy_front);
surface xzplane_front = surface(xz_front);
surface yzplane_front = surface(yz_front);
surface xyplane_left = surface(xy_left);
surface xzplane_left = surface(xz_left);
surface yzplane_left = surface(yz_left);
surface xyplane_right = surface(xy_right);
surface xzplane_right = surface(xz_right);
surface yzplane_right = surface(yz_right);
surface xyplane_botfront = surface(xy_botfront);
surface xzplane_botfront = surface(xz_botfront);
surface yzplane_botfront = surface(yz_botfront);

material m_xy=
  //       diffusepen, ambientpen, emissivepen,  specularpen
  material( boldcolor, gray(0.2),  gray(0.1),    boldcolor);
material m_xz=
  //       diffusepen, ambientpen, emissivepen,  specularpen
  material(  gray(0.2),     lightcolor,     gray(0.1),        gray(0.3));
material m_yz=
  //       diffusepen, ambientpen, emissivepen,  specularpen
  material(  0.25*darkcolor+2*black, 0.25*darkcolor+2*black,  0.7*darkcolor+2*black,  gray(0.3));


// draw(xyplane,m_xy);
// draw(xzplane,m_xz);
// draw(yzplane,m_yz);
draw(xy);
draw(xz);
draw(yz);
draw(xyplane_botfront,m_xy);
draw(xzplane_botfront,m_xz);
draw(yzplane_botfront,m_yz);
draw(xyplane_left,m_xy);
draw(xzplane_left,m_xz);
draw(yzplane_left,m_yz);
draw(xyplane_right,m_xy);
draw(xzplane_right,m_xz);
draw(yzplane_right,m_yz);
draw(xyplane_front,m_xy);
draw(xzplane_front,m_xz);
draw(yzplane_front,m_yz);
