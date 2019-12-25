// https://natureofcode.com/book/chapter-1-vectors/
// Example 1.11: Array of movers accelerating towards the mouse

// Demonstration of the basics of motion with vector.
// A "Mover" object stores position, velocity, and acceleration as vectors
// The motion is controlled by affecting the acceleration (in this case towards the mouse)

Mover[] movers = new Mover[20];

void setup() {
  size(640, 360);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }
}

void draw() {
  background(255);

  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].display(); 
  }
}
