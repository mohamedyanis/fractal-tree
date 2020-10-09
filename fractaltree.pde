void setup(){
  
  background(0);
  stroke(255);
  size(800,800,P2D);
  //fullScreen(P2D);
  
}

void draw(){
  
  float branchLength = 200;
  float branchAngle = 4;
  
  background(0);
  
  //Instructions
  textSize(20);
  fill(#0FB4DB);
  text("Move the mouse to right to change the angle", 10, 30); 
  text("Move the mouse down to add branches", 10, 60);

  translate (width /2, height);  
  branch(branchLength, branchAngle);
  
}

void branch(float branchLength, float branchAngle){
  
  //Modifies the number of branches according to the mouse Y axis
  float branchModifier = map(mouseY, 0, height, 0.1, 0.75);
  
  //Modifies the angle of branches according to the mouse X axis
  branchAngle = map(mouseX, 0, width, 1, 5);
  
  if(branchLength > 3){
    
    //1st branch
    line(0,0,0,-branchLength);
    
    //The new X and Y Zero is at the top of the last branch
    translate (0,-branchLength);
    
    //Draw the right branch
  
    pushMatrix();
    
    //Rotate the grid by 45 degrees
    rotate(PI / branchAngle);
    
    //Call the branch function (itself) again, with a smaller branch length
    branch(branchLength * branchModifier, branchAngle);
    
    popMatrix();
    
    //Draw the left branch
  
    pushMatrix();
    
    //Rotate the grid by 45 degrees
    rotate(PI / - branchAngle);
    
    //Call the branch function (itself) again, with a smaller branch length
    branch(branchLength * branchModifier, branchAngle);
    
    popMatrix();
 
  }
}
