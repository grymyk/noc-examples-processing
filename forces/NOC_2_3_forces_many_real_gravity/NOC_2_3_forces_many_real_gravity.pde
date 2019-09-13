// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

int number = 1;
Mover[] movers = new Mover[number];

void setup() {
  size(640, 360);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover( random(1, 4), 0, 0);
  }
}

void draw() {
    float xWind = 0.01;
    float yWind = 0;
    
    float xGravity = 0.01;

    background(255);

    for (int i = 0; i < movers.length; i++) {
        PVector wind = new PVector(xWind, yWind);
        PVector gravity = new PVector(0, xGravity * movers[i].mass);
      
        PVector force = PVector.add(wind, gravity);
        
        movers[i].applyForce(force);
    
        movers[i].update();
        movers[i].display();
        movers[i].checkEdges();
    }
}
