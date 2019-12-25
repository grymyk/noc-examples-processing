// https://natureofcode.com/book/chapter-1-vectors/
// Example 1.11: Array of movers accelerating towards the mouse

class Mover {
  // The Mover tracks position, velocity, and acceleration 
  PVector position;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;

  Mover() {
    // Start in the center
    position = new PVector(random(width), random(height));
    velocity = new PVector(0,0);
    topspeed = 5;
  }

  void update() {
    // Compute a vector that points from position to mouse
    PVector mouse = new PVector(mouseX, mouseY);
    acceleration = PVector.sub(mouse, position);
    // Set magnitude of acceleration
    //acceleration.setMag(0.2);
    acceleration.normalize();
    acceleration.mult(0.2);
    
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
    fill(127,200);
    ellipse(position.x,position.y,48,48);
  }

}