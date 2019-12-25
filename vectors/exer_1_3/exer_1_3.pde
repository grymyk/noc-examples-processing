// https://natureofcode.com/book/chapter-1-vectors/
// Task: Extend the bouncing ball with vectors example into 3D. Can you get a sphere to bounce around a box?

PVector position;
PVector velocity;

void setup() {
    size(400, 400, P3D);
    background(000);
    
    position = new PVector(100, 100, 100);
    velocity = new PVector(0.5, 0.5, 0.75);
}

void draw() {
    noStroke();
    fill(000, 10);
    
    rect(0, 0, width, height);
    
    // Add the current speed to the position.
    position.add(velocity);
    
    if ((position.x > width) || (position.x < 0)) {
        velocity.x = velocity.x * -1;
    }
    
    if ((position.y > height) || (position.y < 0)) {
        velocity.y = velocity.y * -1;
    }
    
    // Display circle at x position
    stroke(0);
    fill(175);
    
    getBox(position.x, position.y, position.z);
    //getSphere(position.x, position.y, position.z);
}

void getBox(float x, float y, float z) {
    pushMatrix();
    translate(x, y, z);
    noFill();
    stroke(255);
    
    box(16);
    
    popMatrix();
}

void getSphere(float x, float y, float z) {
    pushMatrix();
    translate(x, y, z);
    noFill();
    stroke(255);
    
    sphere(16);
 
    popMatrix();
}
