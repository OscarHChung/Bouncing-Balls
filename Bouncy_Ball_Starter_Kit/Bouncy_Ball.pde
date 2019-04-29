//array named 'balls' that contains 2 objects of type 'Ball', named 'ball' and 'ball2'\
import java.util.Random;
public Ball[] balls = new Ball[4];
final int LEFT_EDGE = 0;
final int TOP_EDGE = 0;
final int RIGHT_EDGE = 1024;
final int BOTTOM_EDGE = 768;

void setup() {
  size(1024, 768);
  smooth(2);
  ellipseMode(RADIUS);
  
  balls[0] = new Ball(0, 0, 60, createVector(), 0, color(#ff0000));
  balls[1] = new Ball(100, 300, 60, createVector(), 1, color(#0000ff));
  balls[2] = new Ball(-200, 30, 60, createVector(), 2, color(#000000));
  balls[3] = new Ball(200, -5, 60, createVector(), 3, color(#00ff00));
}

void draw() {
  noStroke();
  background(#ffffff);
  translate(width/2, height/2);
  
  ballMove();
  ballDraw();
}

public void ballMove() {
  for(Ball b: balls){
    b.move();
  }
}

    
public void ballDraw() {
  for(Ball b: balls){
    b.draw();
  }
}

public PVector createVector() {
  Random rand = new Random();
  return new PVector(rand.nextInt(30)-19, rand.nextInt(30)-19);
}
