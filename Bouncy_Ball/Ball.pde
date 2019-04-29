class Ball {
  private float radius;
  private float x;
  private float y;
  private final int ID;
  private color fillColor;
  private PVector location;
  private PVector velocity;
  
  public Ball(float x, float y, float radius, PVector vector, int ID, color c) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.ID = ID;
    this.fillColor = c;
    this.velocity = vector;
    location = new PVector(x, y);
  }
  
  public float getX() { return x; }
  public float getY() { return y; }
  public void setX(int x) { this.x = x; }
  public void setY(int y) { this.y = y; }
  public float getRadius() { return radius; }
  public PVector getvector() { return velocity; }
  public int getID() { return ID; }
  
  public float distance(Ball other) {
    return (float) Math.sqrt(square(getX()-other.getX()) + square(getY()-other.getY()));
  }
  
  public void collideBall(){
    for(int i = 0; i < balls.length; i++){
      //System.out.println(i);
      //checks whether or not the ith element in balls array is equal to this object
      if(balls[i] != this){
        //continue looping because u cant collide with urself
        //use distance formula to get distance between two centers
        //if two centers' distance is less than sum of radii then they are 'colliding'
        float otherRadius = balls[i].getRadius();
        if(distance(balls[i]) <= radius+otherRadius){
          float tempx = velocity.x;
          float tempy = velocity.y;
          velocity.x = balls[i].getvector().x;
          velocity.y = balls[i].getvector().y;
          balls[i].getvector().x = tempx;
          balls[i].getvector().y = tempy;
          fillColor = color(random(255), random(255), random(255));
        }
      }
    }
  }
  
  public boolean intersectsVertical() {
    if((getX() - getRadius() + width/2 <= LEFT_EDGE) || (getX() + getRadius() + width/2 >= RIGHT_EDGE)) {
      //(getX() - getRadius() + width/2 <= LEFT_EDGE) || (getX() + getRadius() + width/2 >= RIGHT_EDGE)
      return true;
    }
    else {
    return false;  // stub
    }
  }
  
  public boolean intersectsHorizontal() {
    if((getY() - getRadius() + height/2 <= TOP_EDGE) || (getY() + getRadius() + height/2 >= BOTTOM_EDGE)) {
      return true;
    }
    else {
    return false;  // stub
    }
  }
  
  public boolean intersectsEdge() {
    if(intersectsHorizontal() || intersectsVertical()) {
      return true;
    }
    else {
      return false;  // stub
    }
  }

  
  public void move() {
    collideBall();
    // Check to see if ball intersects edge; if so bounce
    location.add(velocity);
    x = location.x;
    y = location.y;
    if (intersectsEdge()) {
      //System.out.println(balls.length);
      if(intersectsVertical()) {
        velocity.x = velocity.x * -1;
      }
      else {
        velocity.y = velocity.y * -1;
      }
    }
  }
    
  public void draw() {
    fill(fillColor);
    stroke(#000000);
    ellipse(location.x, location.y, radius, radius);
  }
}
