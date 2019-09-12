// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {
    float widthEllipse = 32;
    float heightEllipse = 24;

    //float xPos = random(width);
    //float yPos = random(height);
    float xPos = widthEllipse / 2 + 1;
    float yPos = height - heightEllipse / 2 - 1;

    //float xVel = 1;
    //float yVel = -2;
    float xVel = random(-2, 2);
    float yVel = random(-2, 2);

    PVector position;
    PVector velocity;

    Mover() {
        position = new PVector(xPos, yPos);
        velocity = new PVector(xVel, yVel);
    }

    void update() {
          position.add(velocity);
      }

    void display() {
        stroke(0);
        strokeWeight(1);
        fill(127);
        ellipse(position.x, position.y, widthEllipse, heightEllipse);
      }

    void checkEdges() {
        if (position.x > width) {
          position.x = 0;
        } else if (position.x < 0) {
          position.x = width;
        }

        if (position.y > height) {
          position.y = 0;
        } else if (position.y < 0) {
          position.y = height;
        }
    }
}
