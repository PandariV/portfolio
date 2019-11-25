float rotX = 0, rotY = 0;
House house = new House(75, 0, -100);
Tree tree1 = new Tree(-80, 0, 150);
Tree tree2 = new Tree(-120, 0, -75);
ArrayList<Snow> snowflakes = new ArrayList<Snow>();

void setup() {
  size(1000, 600, P3D);
  background(0);
  
  for(int i = 0; i < 250; i++) {
    snowflakes.add(new Bigsnow());
    snowflakes.add(new Smallsnow());
  }
}

void draw() {
  background(0);
  translate(width/2, height/2);
  if(!mousePressed)
    rotY += .01;
  rotateX(rotX);
  rotateY(rotY);
  noStroke();
  
  push();
  rotateX(PI/2);
  fill(240);
  rect(-300, -300, 600, 600);
  pop();
  
  house.show();
  tree1.show();
  tree2.show();
  
  for(Snow s : snowflakes) {
    s.update();
    s.show();
  }
}

void mouseDragged(){
  rotY += (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
}

void pyramid(int t, int r, int g, int b) {
  push();
  rotateX(PI/2);
  beginShape(TRIANGLES);

  fill(r, g, b);
  vertex(-t, -t, -t);
  vertex( t, -t, -t);
  vertex( 0, 0, t);

  vertex( t, -t, -t);
  vertex( t, t, -t);
  vertex( 0, 0, t);

  vertex( t, t, -t);
  vertex(-t, t, -t);
  vertex( 0, 0, t);

  vertex(-t, t, -t);
  vertex(-t, -t, -t);
  vertex( 0, 0, t);

  endShape();
  pop();
}
