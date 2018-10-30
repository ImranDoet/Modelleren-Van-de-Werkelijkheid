//Eindopdracht - Imran

ArrayList<SnowParticle> snowParticles; //Makes an list of all the snowParticles!
ArrayList<PVector> trees; //List of tree positions
PVector cam; //Camera position
float zoom = 1; //Zoom factor

void setup() {
  //Default setup stuff
  size(500, 500);
  frameRate(60);
  
  //Makes the cursor look like an cross
  cursor(CROSS);

  //Gives the camera an value
  cam = new PVector();

  //Gives the lists values
  snowParticles = new ArrayList<SnowParticle>();
  trees = new ArrayList<PVector>();
}

void draw() {
  if (keyPressed) { //Changes the x and the y of the camera
    if (key == CODED) { 
      switch (keyCode) { //For each key it changes the camera position respectively.
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
      if (key == '-') { //For + and - it changes the zoom factor
        zoom -= .01;
      } else if (key == '=' || key == '+') {
        zoom += .01;
      }
    }
  }

  translate(cam.x, cam.y); //Translates the camera
  scale(zoom); //Scales everything
  background(0);

  noStroke();
  fill(color(153, 51, 0));
  rect(2147483647, height, -2147483648, height * 2); //Creates an colored square that acts as the ground
  fill(255);

  if (frameCount % 2 == 0) snowParticles.add(new SnowParticle()); //Add an new snow particle
  for (SnowParticle particle : snowParticles) { //Call the run method on the snowparticles!
    particle.run();
  }

  if (snowParticles.size() > 400) { //If the amount of particles is larger than 400 it removes some, garbage cleaner..
    this.snowParticles = new ArrayList(this.snowParticles.subList(200, 400));
  }

  if (mousePressed) {
    if (mouseButton == RIGHT) {
      trees.add(new PVector((mouseX / zoom + -cam.x), (mouseY / zoom + -cam.y))); //Adds an position to the list so it knows where to draw trees
    }
  }
  for (PVector location : trees) new RecursiveTree(location, 100); //Draws trees
}
