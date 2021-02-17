// settexpreamble.asy  Set up a common texpreamble
// Use in your final mygraphic.asy as:
//   cd("../../../asy/");
//   import settexpreamble;
//   cd("");
//   settexpreamble();

string settexpreamble() {
  // Get the current directory
  string current_dir = cd("");
  int project_part_of_path_dex = rfind(current_dir, "/linear-algebra/");
  string path_prefix = substr(current_dir, 0, project_part_of_path_dex);
  // write(stdout, "Path prefix is "+path_prefix+"<-- ");
  // this causes an error (openout_any = p) because TeX wants to be in same dir as included file; must call tex with openany=a: texpreamble("\include{"+path_prefix+"/computing/src/colorscheme}\usepackage{"+path_prefix+"/computing/src/computingfonts}\usepackage{"+path_prefix+"/computing/src/contentmacros}");
  texpreamble("\usepackage{"+path_prefix+"/linear-algebra/src/sty/conc}\usepackage{"+path_prefix+"/linear-algebra/src/sty/linalgjh}");
  // write(stdout, " ... returning");
  return(path_prefix);
}
