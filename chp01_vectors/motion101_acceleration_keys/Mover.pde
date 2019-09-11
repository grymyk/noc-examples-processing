// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

class Mover {
    PVector position;
    PVector velocity;
    PVector acceleration;
    float topspeed;
    float xPos = 0;
    float yPos = height;
    
    Mover() {
        position = new PVector(xPos, yPos);
        velocity = new PVector(0, 0);
        acceleration = new PVector(0.001, -0.0001);
        topspeed = 10;
    }
    
    void update() {
    //fillVal = 126;
    
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
    
    void keyPressed() {
        if (key == CODED) {
            if (keyCode == UP) {
                fillVal = 255;
                acceleration = new PVector(0.01, -0.001);
            } else if (keyCode == DOWN) {
                fillVal = 0;
                //acceleration = new PVector(0.1, 0.01);
                acceleration = new PVector(0.001, -0.0001);
            } 
        } else {
            fillVal = 126;
            //acceleration = new PVector(-0.01, 0.001);
        }
        
        //fillVal = 126;
    }
  
  void accelerate() {
      //acceleration = new PVector(0.01, -0.001);
      
      keyPressed();
    }

    void display() {
        stroke(0);
        strokeWeight(2);
        fill(127);
        ellipse(position.x, position.y, 16, 16);
      }
}
