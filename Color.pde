class Color {
  // ATTRIBUTES
  private int r;
  private int g;
  private int b;
  private int a;
  
  // CONSTRUCTORS
  
  // default
  public Color() {
    r = g = b = a = 0;
  }
  
  // copy
  public Color(Color c) {
    r = c.getR();
    g = c.getG();
    b = c.getB();
    a = c.getA();
  }
  
  // parameterized
  public Color(int value) {
    r = value;
    g = value;
    b = value;
    a = 255;
  }
  
  public Color(int value, int a) {
    r = value;
    g = value;
    b = value;
    this.a = a;
  }
  
  public Color(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
    a = 255;
  }
  
  public Color(int r, int g, int b, int a) {
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = a;
  }
  
  // METHODS
  
  // getters
  public int getR() { return r; }
  public int getG() { return g; }
  public int getB() { return b; }
  public int getA() { return a; }
  
  public int getValue() {
    return (r + g + b) / 3;
  }
  
  // setters
  public void setR(int r) { this.r = r; }
  public void setG(int g) { this.g = g; }
  public void setB(int b) { this.b = b; }
  public void setA(int a) { this.a = a; }
  
  public void setValue(int value) {
    r = g = b = value;
  }
  
  // stroke/fill
  public void setBackground() { background(r, g, b); }
  public void setFill  () { fill(r, g, b, a);   }
  public void setStroke() { stroke(r, g, b, a); }
  public void setFill  (int a) { fill(r, g, b, a);   }
  public void setStroke(int a) { stroke(r, g, b, a); }
  
  // modify
  public void addR(int amt) { r += amt; }
  public void addG(int amt) { g += amt; }
  public void addB(int amt) { b += amt; }
  
  // misc
  public Color interpolate(Color other, double ratio) {
    double diffR = other.getR() - r;
    double diffG = other.getG() - g;
    double diffB = other.getB() - b;
    
    return new Color((int)(r + diffR * ratio), (int)(g + diffG * ratio), (int)(b + diffB * ratio));
  }
}
