/*
Eindopdracht - Imran
 Idee: 
 levend schilderij met sneeuw, een beetje als dat van teun maar dan iets extra's?
*/

ArrayList<SnowParticle> snowParticles; //Makes an list of all the snowParticles!
ArrayList<PVector> trees;
PVector cam;
float zoom = 1;

void setup() {
  //Default setup stuff
  size(500, 500);
  frameRate(60);

  cursor(CROSS);

  cam = new PVector();

  snowParticles = new ArrayList<SnowParticle>();
  trees = new ArrayList<PVector>();
}

void draw() {
  if (keyPressed) { //Changes the x and the y of the camera
    if (key == CODED) {
      switch (keyCode) {
      case UP:
        cam.y += 10;
        break;

      case DOWN:
        cam.y -= 10;
        break;

      case LEFT:
        cam.x += 10;
        break;

      case RIGHT:
        cam.x -= 10;
        break;
      }
    } else {
      if (key == '-') {
        zoom -= .01;
      } else if (key == '=' || key == '+') {
        zoom += .01;
      }
    }
  }

  translate(cam.x, cam.y);
  scale(zoom);
  background(0);

  noStroke();
  fill(color(153, 51, 0));
  rect(2147483647, height, -2147483648, height * 2);
  fill(255);

  if (frameCount % 2 == 0) snowParticles.add(new SnowParticle()); //Add an new snow particle
  for (SnowParticle particle : snowParticles) { //Call the run method on the snowparticles!
    particle.run();
  }

  if (snowParticles.size() > 400) {
    this.snowParticles = new ArrayList(this.snowParticles.subList(200, 400));
  }

  if (mousePressed) {
    if (mouseButton == RIGHT) {
      trees.add(new PVector((mouseX / zoom + -cam.x), (mouseY / zoom + -cam.y)));
    }
  }
  for (PVector location : trees) new RecursiveTree(location, 100);
}
