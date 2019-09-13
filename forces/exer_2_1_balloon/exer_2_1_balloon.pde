// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

float tx = 0;
float ty = 10000;

int number = 1;
Mover[] movers = new Mover[number];

void setup() {
    int xPos = width / 2;
    int yPos = height - 40;
    //float mass = random(1, 4);
    float mass = 2;
    
    size(640, 360);

    for (int i = 0; i < movers.length; i++) {
        movers[i] = new Mover(mass, xPos, yPos);
    }
}

 PVector sumForce(PVector[] forces) {
    PVector sum = forces[0];
    
    for (int i = 0; i < forces.length-1; i++) {
        sum = PVector.add(sum, forces[i+1]);
    }
    
    return sum;
}

void draw() {
    float minWind = -0.004;
    float maxWind = 0.004;
    
    //float xWind = 0.0002;
    //float yWind = 0.001;
    float xWind = map( noise(tx), 0, 1, minWind, maxWind);
    float yWind = map( noise(ty), 0, 1, minWind, maxWind);
    
    float yGravity = 0.01;

    float yNup = -0.022;

    int forceNumber = 3;
    PVector[] forces = new PVector[forceNumber];

    background(255);

    for (int i = 0; i < movers.length; i++) {
        PVector wind = new PVector(xWind, yWind);
        PVector gravity = new PVector(0, yGravity * movers[i].mass);
        PVector nup = new PVector(0, yNup);
        
        forces[0] = wind;
        forces[1] = gravity;
        forces[2] = nup;
      
        //PVector force = PVector.add(nup, gravity);
        PVector force = sumForce(forces); 
        
        println(force.y);
        
        movers[i].applyForce(force);
    
        movers[i].update();
        movers[i].display();
        movers[i].checkEdges();
    }
    
    tx += 0.01;
    ty += 0.01;
}
