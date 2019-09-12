// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover mover;
color fillVal = color(126);

void setup() {
  size(640,360);
  mover = new Mover(); 
}

void draw() {
  background(fillVal);
  
  mover.accelerate();
  mover.update();
  mover.checkEdges();
  mover.display(); 
}  
  
