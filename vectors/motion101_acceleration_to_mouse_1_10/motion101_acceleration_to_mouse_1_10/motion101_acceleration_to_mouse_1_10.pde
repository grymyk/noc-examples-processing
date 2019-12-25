// https://natureofcode.com/book/chapter-1-vectors/
// Example 1.10: Accelerating towards the mouse

// A Mover object
Mover mover;

void setup() {
  size(640, 360);
  
  mover = new Mover(); 
}

void draw() {
  background(255);
  
  // Update the position
  mover.update();
  // Display the Mover
  mover.display();
  
  mover.variance();
}
