class SnowParticle extends Particle {
  
  //initialization
  public SnowParticle() {
    super(new PVector(random(width), 0), 1000000000, 0.1);
  }
  
  //displays the ellipse
  public void display() {
    ellipse(this.location.x, this.location.y, 10, 10); 
  }
  
}
