// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {
    PVector position;
    PVector velocity;
    PVector acceleration;
    float topspeed;

    Mover() {
        position = new PVector(0, height);
        velocity = new PVector(0, 0);
        acceleration = new PVector(0.001, -0.001);
        topspeed = 10;
    }

    void accelerate() {
        float tx = 0;
        float ty = 10000;
        int range = 10;

        float xPos = map( noise(tx), 0, 1, 0, range);
        float yPos = map( noise(ty), 0, 1, 0, range);
    
        tx += 0.01;
        ty += 0.01;

        acceleration = new PVector(xPos, yPos);
    }

    void update() {
        accelerate();
        velocity.add(acceleration);
        velocity.limit(topspeed);
        position.add(velocity);
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

    void display() {
        stroke(0);
        strokeWeight(2);
        fill(127);
        ellipse(position.x, position.y, 48, 48);
    }
}
