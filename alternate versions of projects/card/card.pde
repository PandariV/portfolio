float rotX = 0, rotY = 0;
PShape house, tree;
ArrayList<Snow> snowflakes = new ArrayList<Snow>();

void setup() {
  size(1000, 600, P3D);
  background(0);
  
  house = loadShape("house.obj");
  tree = loadShape("christmastree.obj");
  
  for(int i = 0; i < 250; i++) {
    snowflakes.add(new Bigsnow());
    snowflakes.add(new Smallsnow());
  }
}

void draw() {
  background(0);
  pointLight(255, 255, 255, width/2, 0, 200);
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  push();
  rotateX(PI/2);
  fill(255);
  rect(-300, -300, 600, 600);
  house.setFill(color(162, 104, 77));
  pointLight(255, 255, 255, 0, -50, 200);
  shape(house, -50, 0);
  tree.setFill(color(70, 178, 103));
  shape(tree, 100, 0);
  pop();
  noStroke();
  
  for(Snow s : snowflakes) {
    s.update();
    s.show();
  }
}

void mouseDragged(){
  rotY += (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
}
