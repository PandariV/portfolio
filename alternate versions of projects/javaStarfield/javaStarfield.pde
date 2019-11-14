float rotX = 0, rotY = 0;
Planets[] planets = new Planets[4];

void setup() {
  fullScreen(P3D);
  
  planets[0] = new Mercury(.05);
  planets[1] = new Venus(.045);
  planets[2] = new Earth(.04);
  planets[3] = new Mars(.035);
}

void draw() {
  background(0);
  smooth();
  lights();
  noStroke();
  
  translate(width/2, height/2);
  
  rotateX(rotX);
  rotateY(rotY);
  
  fill(255, 57, 18);
  sphere(100);
  
  for(Planets p : planets) {
    p.show();
    p.update();
  }
}

void mouseDragged(){
  rotY += (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
}

interface Planets {
  void show();
  void update();
}

class Mercury implements Planets {
  float x, z, speed, distance, theta;
  
  Mercury(float speed) {
    this.speed = speed;
    distance = 120;
    theta = random(PI * 2);
  }
  
  void show() {
    fill(139, 125, 130);
    translate(x, 0, z);
    sphere(10);
    translate(-x, 0, -z);
  }
  
  void update() {
    theta += speed;
    x = distance * cos(theta);
    z = distance * sin(theta);
  }
}

class Venus implements Planets {
  float x, z, speed, distance, theta;
  
  Venus(float speed) {
    this.speed = speed;
    distance = 150;
    theta = random(PI * 2);
  }
  
  void show() {
    fill(252, 212, 64);
    translate(x, 0, z);
    sphere(15);
    translate(-x, 0, -z);
  }
  
  void update() {
    theta += speed;
    x = distance * cos(theta);
    z = distance * sin(theta);
  }
}

class Earth implements Planets {
  float x, z, speed, distance, theta;
  
  Earth(float speed) {
    this.speed = speed;
    distance = 185;
    theta = random(PI * 2);
  }
  
  void show() {
    fill(0, 110, 184);
    translate(x, 0, z);
    sphere(15);
    translate(-x, 0, -z);
  }
  
  void update() {
    theta += speed;
    x = distance * cos(theta);
    z = distance * sin(theta);
  }
}

class Mars implements Planets {
  float x, z, speed, distance, theta;
  
  Mars(float speed) {
    this.speed = speed;
    distance = 213;
    theta = random(PI * 2);
  }
  
  void show() {
    fill(188, 42, 58);
    translate(x, 0, z);
    sphere(12);
    translate(-x, 0, -z);
  }
  
  void update() {
    theta += speed;
    x = distance * cos(theta);
    z = distance * sin(theta);
  }
}
