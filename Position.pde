class Position {
  // ATTRIBUTES
  private int x;
  private int y;

  // CONSTRUCTORS
  
  // default
  public Position() {
    x = 0;
    y = 0;
  }
  
  // copy
  public Position(Position other) {
    x = other.getX();
    y = other.getY();
  }
  
  // parameterized
  public Position(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  // getters
  public int getX() { return x; }
  public int getY() { return y; }
  
  // setters
  public void setX(int x) { this.x = x; }
  public void setY(int y) { this.y = y; }
  
  // manipulation
  public void addX(int amt) { x += amt; }
  public void addY(int amt) { y += amt; }
  public void add(Position other) {
    x += other.getX();
    y += other.getY();
  }
  public void subtract(Position other) {
    x -= other.getX();
    y -= other.getY();
  }
  
  // misc
  public int distanceTo(Position other) {
    float diffX = x - other.getX();
    float diffY = y - other.getY();
    return (int)sqrt(diffX * diffX + diffY * diffY);
  }
}
