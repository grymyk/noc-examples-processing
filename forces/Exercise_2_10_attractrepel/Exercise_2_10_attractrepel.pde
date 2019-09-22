// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] movers = new Mover[2];

Attractor attractor;

float g = 1;

void setup() {
  size(640,360);
  attractor = new Attractor();

    for (int i = 0; i < movers.length; i++) {
        movers[i] = new Mover(random(4,12),random(width),random(height));
    }
}

void draw() {
  background(255);

  attractor.display();
  attractor.drag();
  attractor.rollover(mouseX, mouseY);

  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].repel(movers[i]);

        movers[i].applyForce(force);
      }
    }

    PVector force = attractor.attract(movers[i]);

    movers[i].applyForce(force);
    movers[i].update();
    movers[i].display();
  }
}

void mousePressed() {
  attractor.clicked(mouseX, mouseY);
}

void mouseReleased() {
  attractor.stopDragging();
}
