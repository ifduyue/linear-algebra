// jh.asy  Asymptote common definitions

import fontsize;
defaultpen(fontsize(9.24994pt));
import texcolors;

// Copied from settexpreamble.asy just to make one less file to import
string settexpreamble() {
  // Get the current directory
  string current_dir = cd("");
  int project_part_of_path_dex = rfind(current_dir, "/linear-algebra.git/");
  string path_prefix = substr(current_dir, 0, project_part_of_path_dex);
  // write(stdout, "Path prefix is "+path_prefix+"<-- ");
  // this causes an error (openout_any = p) because TeX wants to be in same dir as included file; must call tex with openany=a: texpreamble("\include{"+path_prefix+"/computing/src/colorscheme}\usepackage{"+path_prefix+"/computing/src/computingfonts}\usepackage{"+path_prefix+"/computing/src/contentmacros}");
  texpreamble("\usepackage{"+path_prefix+"/linear-algebra.git/src/sty/conc}\usepackage{"+path_prefix+"/linear-algebra.git/src/sty/linalgjh}");
  // write(stdout, " ... returning");
  return(path_prefix);
}
settexpreamble();

// This is a 4:3 ratio, set by geometry package 
real BEAMERPAPERWIDTH = 12.8cm;
real BEAMERPAPERHEIGHT = 9.6cm;


pen FILLCOLOR=rgb("fff0ca");

pen MAINPEN=linecap(0)
             +linewidth(0.4pt);
pen VECTORPEN=linecap(0)
              +linewidth(0.8pt);
real VECTORHEADSIZE=5;
pen THINPEN=linecap(0)
             +linewidth(0.25pt);
pen DASHPEN=linecap(0)
             +linewidth(0.4pt)
             +linetype(new real[] {8,8});
pen FCNPEN=linecap(0)
             +gray(0.3)
             +linewidth(1.5pt)
             +opacity(.5,"Normal");
pen AXISPEN=linecap(0)
             +gray(0.3)
             +linewidth(0.4pt)
             +opacity(.5,"Normal");
pen DXPEN=linecap(0)
             +red
             +linewidth(1pt);
pen CURVEPEN=MAINPEN;
pen LIGHTPEN=linewidth(0.4pt);  // matches mpost line_width_light
pen DARKPEN=linewidth(0.8pt);   //    line_width_dark

// texpreamble("\usepackage{linalgjh}\usepackage{conc}");

// HSL color space, to lighten or darken
//   see http://en.wikipedia.org/wiki/HSL_and_HSV
// To lighten, something like this:
//   HSL hsl=HSL(0.116,0.675,0.255);
//   hsl.l=1-((1-hsl.l)/4.0);
//   pen p=hsl.rgb();
struct HSL {
  real hue;  // hue in degrees
  real h; // hue in [0..1]
  real s;  // saturation
  real l;  // lightness

  // Initialize
  // expects r, g, b in [0..1]
  void operator init(real r, real g, real b) {
    real mincolorsize=min(r,g,b);
    real maxcolorsize=max(r,g,b);
    real chroma=maxcolorsize-mincolorsize;
    // hue
    real hprime;
    if (chroma==0) {
      hprime=0;
    } else if (maxcolorsize==r) {
      hprime=fmod((g-b)/chroma,6);
    } else if (maxcolorsize==g) {
      hprime=2+(b-r)/chroma;
    } else {
      hprime=4+(r-g)/chroma;
    }
    this.hue=60*hprime;
    this.h=this.hue/360.0;
    // lightness
    this.l=(maxcolorsize+mincolorsize)/2;
    //saturation
    if (chroma==0) {
      this.s=0;
    } else {
      this.s=chroma/(1-fabs(2*this.l-1));
    }
  }

  // return pen with the hsl converted to rgb
  // Note: does not handle grays 
  pen rgb() {
    real chroma=(1-fabs(2*this.l-1))*this.s;
    real hprime=this.hue/60.0;
    real x=chroma*(1-fabs(fmod(hprime,2.0)-1));
    real r1, g1, b1, m, r, g, b;
    if ((0<=hprime) && (hprime<1)) {
      r1=chroma; g1=x; b1=0;
    } else if ((1<=hprime) && (hprime<2)) {
      r1=x; g1=chroma; b1=0;
    } else if ((2<=hprime) && (hprime<3)) {
      r1=0; g1=chroma; b1=x;
    } else if ((3<=hprime) && (hprime<4)) {
      r1=0; g1=x; b1=chroma;
    } else if ((4<=hprime) && (hprime<5)) {
      r1=x; g1=0; b1=chroma;
    } else {
      r1=chroma; g1=0; b1=x;
    }
    m=this.l-chroma/2.0;
    r=r1+m; g=g1+m; b=b1+m;
    return rgb(r,g,b);
  }
}


// vec_outline  draw a vector's outline, filled in white
// usage:
//   pen inverse_image_pen=linecap(1)
//                         +linewidth(1.5pt);
//   pen inverse_image_fill_pen=linecap(1)
//                              +linewidth(1pt);
//   path vec=(0,0)--(2,0);
//   picture p=vec_outline(vec,inverse_image_pen+color,inverse_image_fill_pen+white);
//  add(p);
picture vec_outline(path p, pen exterior, pen interior) {
  picture pic;
  draw(pic,p,exterior,arrow=Arrow(DefaultHead,VECTORHEADSIZE),PenMargin(-1,0));
  draw(pic,p,interior,arrow=Arrow(DefaultHead,VECTORHEADSIZE),PenMargin(-3/4,1/4));
  return pic;
}
