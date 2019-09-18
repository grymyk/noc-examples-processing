// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {
  // The Mover tracks position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;
  PVector mouse;
  int count;
  int size = 120;
  float[] xAxis = new float[size];
  float[] positiove = new float[size];
  int positiveCount = 0;
  int negativeCount = 0;

  Mover() {
    // Start in the center
    position = new PVector(width/2, height/ 2);
    velocity = new PVector(0,0);
    topspeed = 5;
    count = 1;
  }
  
  void variance() {
      
      //println(mouse.x);
      //println(position.x);
      
      //println(mouse.x - position.x);
      float diff = mouse.x - position.x;
      
      //xAxis[i] = diff;
      if (diff > 0) {
          //println("plus", diff);
          positiveCount += 1;
      } else {
          //println("minus", diff);
          negativeCount += 1;
      }
      
      //println(count);
      //count += 1;
      
      //println("-", negativeCount, "+", positiveCount);
  }

  void update() {
    // Compute a vector that points from position to mouse
    mouse = new PVector(mouseX, mouseY);
    PVector acceleration = PVector.sub(mouse, position);
    // Set magnitude of acceleration
    acceleration.setMag(0.2);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // position changes by velocity
    position.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(position.x, position.y, 48, 48);
  }

}
