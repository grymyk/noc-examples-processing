// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

Mover[] movers = new Mover[1];

//Attractor a;
Attractor[] attractors = new Attractor[2];

void setup() {
  size(640, 360);

  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1, 2), random(width), random(height));
  }

  //a = new Attractor();
  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor( random(1, 20), random(width), random(height) );
  }

    background(255);
}

void draw() {
  //a.display();
  //a.drag();
  //a.hover(mouseX, mouseY);

    for (int i = 0; i < attractors.length; i++) {
        attractors[i].display();
        attractors[i].drag();
        attractors[i].hover(mouseX, mouseY);

        for (int j = 0; j < movers.length; j++) {
            PVector force = attractors[i].attract(movers[j]);

            movers[j].applyForce(force);
            movers[j].update();
            movers[j].display();
        }
    }
}

void mousePressed() {
     for (int i = 0; i < attractors.length; i++) {
        attractors[i].clicked(mouseX, mouseY);
     }
}

void mouseReleased() {
    for (int i = 0; i < attractors.length; i++) {
        attractors[i].stopDragging();
     }
}
