// https://natureofcode.com/book/chapter-1-vectors/
// 1.7 Vector Motion: Velocity

Mover mover;

void setup() {
  size(640, 360);
  
  mover = new Mover(); 
}

void draw() {
  background(255);
  
  mover.update();
  mover.checkEdges();
  mover.display(); 
}
