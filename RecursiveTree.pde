class RecursiveTree {
 
  /*
  Returns an instance of an new RecursiveTree object.
  Takes the startPosition of the tree and the starting length.
  */
  public RecursiveTree(PVector startPos, float startLength) {
    pushMatrix();
    stroke(255);
    translate(startPos.x, startPos.y);
    line(0, 0, 0, -startLength);
    translate(0, -startLength);
    stroke(255);
    drawTree(startLength);
    popMatrix();
  }
  
  /*
  Draws the tree. This takes the length variable, the variable also goes through 
  some calculations so that each branch is smaller than the previous branch.
  */
  public void drawTree(float len) {
    len *= 0.66;
  
    if (len > 5) {
      //the amount for lerpcolor
      pushMatrix();
      rotate(radians(45));
      line(0, 0, 0, -len);
      translate(0, -len);
      drawTree(len);
      popMatrix();
    
      pushMatrix();
      rotate(radians(-45));
      line(0, 0, 0, -len);
      translate(0, -len);
      drawTree(len);
      popMatrix();
    }
  }
  
  
}
