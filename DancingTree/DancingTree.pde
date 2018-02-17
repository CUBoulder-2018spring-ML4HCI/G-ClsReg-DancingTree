
float theta;   
float ff = 0;
float j = 0;
import oscP5.*;
OscP5 oscP5;
import netP5.*;
NetAddress dest;
/*Particle stuff
ParticleSystem ps;

PImage[] imgs;

*/
void setup() {
  oscP5 = new OscP5(this,12000); //listen for OSC messages on port 12000 (Wekinator default)
  dest = new NetAddress("127.0.0.1",6448); //send messages back to Wekinator on port 6448, localhost (this machine) (default)
  size(1600, 900);
  /*Particle stuff
  imgs = new PImage[5];
  imgs[0] = loadImage("corona.png");
  imgs[1] = loadImage("emitter.png");
  imgs[2] = loadImage("particle.png");
  imgs[3] = loadImage("texture.png");
  imgs[4] = loadImage("reflection.png");

  ps = new ParticleSystem(imgs, new PVector(width/2, 50));
  */
}

void draw() {
  /*Tree stuff

  // Additive blending!
  blendMode(ADD);

  background(0);
  
  //PVector up = new PVector(0,-0.2);
  
  PVector up = new PVector(0, -0.5 * (ff-0.5));
  
  ps.applyForce(up);
  
  ps.run();
  for (int i = 0; i < 5; i++) {
    //ps.addParticle(mouseX,mouseY);
    ps.addParticle(width, 0);
    ps.addParticle(0, 0);

    
  }
  
  Tree stuff*/
  background(genColor(), 0, 0);
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = ( (ff * 1600)/ (float) width) * 90f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height);
  // Draw a line 120 pixels
  line(0,0,0,-300);
  // Move to the end of that line
  translate(0,-300);
  // Start the recursive branching!
  branch(300);

}

void branch(float h) {
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 2 pixels or less
  if (h > 2) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    translate(0, -h); // Move to the end of the branch
    branch(h);       // Ok, now call myself to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    branch(h);
    popMatrix();
  }
}
float genColor(){
  if(j == 1)
  {
    return 0;
  }
  {
    return 255;
  }
  
}
void oscEvent(OscMessage theOscMessage) {
 println("received message");
    if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
      if(theOscMessage.checkTypetag("ff")) {
      float i = theOscMessage.get(0).floatValue();
      float f = theOscMessage.get(1).floatValue();
      println(f);
      println("received1");
      j = i;
      ff = (float)f;
      }
    }
 
}