////////////////////////////////////////////
// default text size
pair gettextsize(Label L)
{
  picture pic;
  label(pic, L);
  pair M=max(pic), m=min(pic), D=M-m;
  return D;
}

real gettextheight(Label L) { return gettextsize(L).x; }

pair getminipagesize(string s)
{
  picture pic;
  string[] lines=split(s, "\\");
  pair M, m, D;
  real w=0, h=0;
  for (string line: lines)
  {
    label(pic, line);
    M=max(pic); m=min(pic); D=M-m;
    w=max(w, D.x);
    h+=D.y;
  }
  real dw=3pt;
  return (w-dw,h);
}

real defaulttextheight=gettextheight("e");

string minipage2(string s, align flush=(0,0))
{
  real width=getminipagesize(s).x;
  string flushstring;
  if (flush.dir==W)
    flushstring="\flushleft ";
  else if (flush.dir==E)
    flushstring="\flushright ";
  else
    flushstring="\centering ";
  return "\begin{minipage}{"+(string) (width/pt)+"pt}"+flushstring+s+"\end{minipage}"; 
}


// JH below here added to get smaller horizontal margins
pair getminipagesize_snug(string s)
{
  picture pic;
  string[] lines=split(s, "\\");
  pair M, m, D;
  real w=0, h=0;
  for (string line: lines)
  {
    label(pic, line);
    M=max(pic); m=min(pic); D=M-m;
    w=max(w, D.x);
    h+=D.y;
  }
  real dw=12pt; // what is this parameter?  fboxsep?
  return (w-dw,h);
}

string minipage_snug(string s, align flush=(0,0))
{
  real width=getminipagesize_snug(s).x;
  string flushstring;
  if (flush.dir==W)
    flushstring="\flushleft ";
  else if (flush.dir==E)
    flushstring="\flushright ";
  else
    flushstring="\centering ";
  return "\begin{minipage}{"+(string) (width/pt)+"pt}"+flushstring+s+"\end{minipage}"; 
}
