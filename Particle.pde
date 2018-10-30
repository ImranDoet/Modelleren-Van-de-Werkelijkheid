abstract class Particle {
 
  PVector location;
  PVector acceleration;
  PVector velocity;
  float mass;
  float g;
  
  public Particle(PVector v, float mas, float gravity) {
     this.acceleration = new PVector(0,0.05);
     this.velocity = new PVector(.5,random(-0.1,0));
     this.location = v.get();
     this.mass = mas;
     this.g = gravity;
  }
  
  /*
  Calculates gravity.
  */
  public void nettokracht(float gravity) {
    applyForce(new PVector(0,gravity).div(mass));
    velocity.add(acceleration);
    location.add(velocity);
  }
  
  void applyForce(PVector force) {
   force.div(mass);
   acceleration.add(force);
  }
  
  public abstract void display();
  
  
  /*
  Calculates if the particle is out of bounds (y axis)
  If it is out of bounds then it removes velocity
  */
  
  public boolean checkBounds() {
     if (this.location.y >= height) {
       velocity.mult(0);
       acceleration.mult(0);
       location.y = height - 5;
       return true;
     }
     return false;
  }
  
  public void run() {
    if (!checkBounds()) {
      nettokracht(g);
      display();
    }
  }
  
}
