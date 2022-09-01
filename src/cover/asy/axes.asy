// axes.asy
//  Axes for book cover

import three;
import bsp;
import settings;
settings.outformat="pdf";
settings.render=0;  // just draw it, not three-d shape

size(72*3);  // 72 pts per inch

currentprojection=perspective(4,6.5,5);
// currentlight=light(diffuse=gray(.6), ambient=yellow, specular=paleyellow,
//                    specularfactor=0.1, viewport=false,(4,6.5,10));
currentlight = nolight;
currentlight=light(diffuse=white, ambient=white, specular=white,
                   specularfactor=0.0, viewport=false,(4,6.5,10));

pen p=linewidth(0.4)+squarecap+miterjoin+black+opacity(0.2);
defaultpen(p);

// From version 2 of the book
// // From https://kuler.adobe.com/Lollapalooza-color-theme-3446379/edit/?copy=true
// pen darkcolor = rgb(0/255,  38/255,  53/255);
// pen lightcolor  = rgb(217/255,  121/255,  37/255);
// pen bgcolor     = rgb(171/255, 26/255, 37/255);
// pen flourishcolor  = rgb(116/255, 6/255,   17/255);

// From version 3 of the book, 2016
// // From https://color.adobe.com/Ice-cream-chill-color-theme-6611012/edit/?copy=true&base=2&rule=Custom&selected=4&name=Copy%20of%20Ice%20cream%20chill&mode=rgb&rgbvalues=0.611765,0.329412,0.290196,0.705882,0.745098,0.572549,0.992157,0.894118,0.733333,0.788235,0.803922,0.733333,0.886275,0.67451,0.435294&swatchOrder=0,1,2,3,4
// pen darkcolor = rgb(180/255, 190/255, 146/255);
// pen boldcolor     = rgb(156/255,  84/255,  74/255);
// pen lightcolor  = rgb(226/255,  172/255,  111/255);
// pen bgcolor  = rgb(201/255,  205/255,  187/255);
// pen flourishcolor  = rgb(253/255, 228/255,   187/255)
// pen darkcolor = rgb(180/255, 190/255, 146/255); // green
// pen boldcolor     = rgb(191/255,  103/255,  91/255);
// pen lightcolor  = rgb(226/255,  172/255,  111/255);
// pen bgcolor  = rgb(201/255,  205/255,  187/255);
// pen flourishcolor  = rgb(253/255, 228/255,   187/255);

// Version 4, 2020
// Very Easter. From https://colorhunt.co; no identifying info, although free use
// pen darkcolor     =  rgb(202,173,222); // hex(caadde);
// pen boldcolor     = rgb(200,134,229); // hex(c886e5);
// pen lightcolor    = rgb(246,236,191); //hex(f6ecbf);
// pen bgcolor       = rgb(249,249,249); // hex(f9f9f9);
// pen flourishcolor  = rgb(60,9,4); // hex();

// From https://colorhunt.co; no identifying info, although free use
// Purple and gold
// pen darkcolor     = rgb(255,164,27); //hex(ffa41b); yz plane   
// // pen boldcolor     = rgb(255,81,81); // hex(ff5151);  xy plane
// pen boldcolor     = rgb(167,45,45); // hex(a21818);  xy plane
// pen lightcolor    = rgb(152,24,214); // hex(9818d6); xz plane
// pen bgcolor       = rgb(237,237,237); // hex(ededed);
// pen flourishcolor  = rgb(60,9,4); // hex();

// From https://www.color-hex.com/color-palette/90232 no identifying info
pen darkcolor     = rgb(87,41,79); //hex(00adad); yz plane   
pen boldcolor     = rgb(0,67,37); // hex(004303);  xy plane
pen lightcolor    = rgb(174,56,56); // hex(e1b200); xz plane
pen bgcolor       = rgb(237,237,237); // hex(ededed);
pen flourishcolor  = rgb(60,9,4); // hex();

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
picture shadow_pic;
size(shadow_pic,72*2);
draw(shadow_pic,q1,nolight);
draw(shadow_pic,q2,nolight);
draw(shadow_pic,q3,nolight);
draw(shadow_pic,q4,nolight);
shipout("shadow",shadow_pic);
// layer();

// // shadow
// import graph;

// // Find the projection to make this under the axes
// path3 floorplane_path=(0,0,ZLIMIT_NEG)--(1,0,ZLIMIT_NEG)
//   --(1,1,ZLIMIT_NEG)--(0,1,ZLIMIT_NEG)--cycle;
// transform3 shade_transform=planeproject(floorplane_path,dir=normal(floorplane_path));

// pen[] pens = new pen[] {gray(.9), gray(.94), gray(.97), gray(.98),gray(.99),gray(.998),red};
// path outerpath = circle((0,0), 2);
// path innerpath = (1,0.8);

// path midpath(path p1, path p2, real t) {
//   pair f(real s) {
//     return (1-t)*relpoint(p1, s) + t*relpoint(p2, s);
//   }
//   path p = graph(f, 0, 1, operator ..) -- cycle;
//   return p;
// }

// int lastpath = pens.length - 1;
// path[] paths = new path[lastpath + 1];
// surface[] grays = new surface[lastpath + 1];
// for (int i = 0; i <= lastpath; ++i) {
//   paths[i] = midpath(innerpath, outerpath, i/lastpath);
//   grays[i] = xscale3(5)*surface(paths[i]);  // in XYPlane
// }

// draw(paths, pens);




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

picture pic;
size(pic,72*3);

surface xyplane = surface(xy);
surface xzplane = surface(xz);
surface yzplane = surface(yz);


material m_xz=
  //       diffusepen, ambientpen, emissivepen,  specularpen
  material(  grey,     lightcolor,     gray(0.3),        orange);
material m_xy=
  //       diffusepen, ambientpen, emissivepen,  specularpen
  material(  gray(0.99), boldcolor,     black,        black);
material m_yz=
  //       diffusepen, ambientpen, emissivepen,  specularpen
  material(  grey,     darkcolor,     black,        gray(0.1));


draw(pic,xyplane,m_xy);
draw(pic,xzplane,m_xz);
draw(pic,yzplane,m_yz);
draw(pic,xy);
draw(pic,xz);
draw(pic,yz);


// Use asymptote "limited" hidden surface removal
// face[] faces;

// // pen[] p={red,green,blue,black};
// // latticeshade(faces.push(floor_q1),floor_q1,new pen[][] {{INSIDE_SHADE,OUTSIDE_SHADE},{OUTSIDE_SHADE,OUTSIDE_SHADE}});

// filldraw(faces.push(xy),project(xy),fillpen=boldcolor,drawpen=p);
// filldraw(faces.push(xz),project(xz),fillpen=lightcolor,drawpen=p);
// filldraw(faces.push(yz),project(yz),fillpen=darkcolor,drawpen=p);
// add(pic,faces);

// add(currentpicture,shadow_pic);
add(currentpicture,pic);
shipout("axes",currentpicture);
