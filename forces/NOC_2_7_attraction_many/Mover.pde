// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    position = new PVector(x, y);
    velocity = new PVector(1, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    //stroke(0);
    //strokeWeight(2);
    //fill(0, 100);
    //ellipse(position.x, position.y, mass*2, mass*2);
    
    //stroke(125);
    //point(position.x, position.y);
    
    stroke(125);
    strokeWeight(1);
    beginShape(POINTS);
        vertex(position.x, position.y);
        //vertex(position.x, position.y);
        //vertex(position.x, position.y);
        //vertex(position.x, position.y);
    endShape();
  }
}
