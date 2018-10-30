class SnowParticle extends Particle {
  
  public SnowParticle() {
    super(new PVector(random(width), 0), 1000000000, 0);
  }
  
  public void display() {
    ellipse(this.location.x, this.location.y, 10, 10); 
  }
  
}
