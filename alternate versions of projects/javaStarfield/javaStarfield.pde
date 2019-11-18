float rotX = 0, rotY = 0;
boolean toggle = true;
Planets[] planets = new Planets[8];
PImage[] textures = new PImage[9];
PShape[] shapes = new PShape[9];

void setup() {
  fullScreen(P3D);
  background(0);
  
  planets[0] = new Mercury(.05);
  planets[1] = new Venus(.045);
  planets[2] = new Earth(.04);
  planets[3] = new Mars(.035);
  planets[4] = new Jupiter(.03);
  planets[5] = new Saturn(.025);
  planets[6] = new Uranus(.02);
  planets[7] = new Neptune(.015);
  
  textures[0] = loadImage("sun.jpg");
  textures[1] = loadImage("mercury.jpg");
  textures[2] = loadImage("venus.jpg");
  textures[3] = loadImage("earth.jpg");
  textures[4] = loadImage("mars.jpg");
  textures[5] = loadImage("jupiter.jpg");
  textures[6] = loadImage("saturn.jpg");
  textures[7] = loadImage("uranus.jpg");
  textures[8] = loadImage("neptune.jpg");
  
  noStroke();
  noFill();
  shapes[0] = createShape(SPHERE, 100);
  shapes[0].setTexture(textures[0]);
  shapes[1] = createShape(SPHERE, 10);
  shapes[1].setTexture(textures[1]);
  shapes[2] = createShape(SPHERE, 15);
  shapes[2].setTexture(textures[2]);
  shapes[3] = createShape(SPHERE, 15);
  shapes[3].setTexture(textures[3]);
  shapes[4] = createShape(SPHERE, 12);
  shapes[4].setTexture(textures[4]);
  shapes[5] = createShape(SPHERE, 25);
  shapes[5].setTexture(textures[5]);
  shapes[6] = createShape(SPHERE, 20);
  shapes[6].setTexture(textures[6]);
  shapes[7] = createShape(SPHERE, 18);
  shapes[7].setTexture(textures[7]);
  shapes[8] = createShape(SPHERE, 18);
  shapes[8].setTexture(textures[8]);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  lights();
  smooth();
  noStroke();
  
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(-PI/50);
  
  shape(shapes[0]);
  text(0, 0, 0, 100, "Sun");
  
  for(Planets p : planets) {
    p.show();
    p.update();
  }
}

void mouseDragged(){
  rotY += (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
}

void keyPressed() {
  toggle = toggle ? false : true;
}

void text(float x, float y, float z, float radius, String text) {
  if(toggle) {
    fill(255);
    rotateY(-rotY);
    textSize(20);
    text(text, x - text.length() * 5.5, y - radius - 20, z);
    rotateY(rotY);
  }
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
    translate(x, 0, z);
    shape(shapes[1]);
    text(0, 0, 0, 10, "Mercury");
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
    translate(x, 0, z);
    shape(shapes[2]);
    text(0, 0, 0, 15, "Venus");
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
    translate(x, 0, z);
    shape(shapes[3]);
    text(0, 0, 0, 15, "Earth");
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
    translate(x, 0, z);
    shape(shapes[4]);
    text(0, 0, 0, 12, "Mars");
    translate(-x, 0, -z);
  }
  
  void update() {
    theta += speed;
    x = distance * cos(theta);
    z = distance * sin(theta);
  }
}

class Jupiter implements Planets {
  float x, z, speed, distance, theta;
  
  Jupiter(float speed) {
    this.speed = speed;
    distance = 270;
    theta = random(PI * 2);
  }
  
  void show() {
    translate(x, 0, z);
    shape(shapes[5]);
    text(0, 0, 0, 25, "Jupiter");
    translate(-x, 0, -z);
  }
  
  void update() {
    theta += speed;
    x = distance * cos(theta);
    z = distance * sin(theta);
  }
}

class Saturn implements Planets {
  float x, z, speed, distance, theta;
  
  Saturn(float speed) {
    this.speed = speed;
    distance = 328;
    theta = random(PI * 2);
  }
  
  void show() {
    translate(x, 0, z);
    shape(shapes[6]);
    text(0, 0, 0, 20, "Saturn");
    translate(-x, 0, -z);
  }
  
  void update() {
    theta += speed;
    x = distance * cos(theta);
    z = distance * sin(theta);
  }
}

class Uranus implements Planets {
  float x, z, speed, distance, theta;
  
  Uranus(float speed) {
    this.speed = speed;
    distance = 370;
    theta = random(PI * 2);
  }
  
  void show() {
    translate(x, 0, z);
    shape(shapes[7]);
    text(0, 0, 0, 18, "Uranus");
    translate(-x, 0, -z);
  }
  
  void update() {
    theta += speed;
    x = distance * cos(theta);
    z = distance * sin(theta);
  }
}

class Neptune implements Planets {
  float x, z, speed, distance, theta;
  
  Neptune(float speed) {
    this.speed = speed;
    distance = 420;
    theta = random(PI * 2);
  }
  
  void show() {
    translate(x, 0, z);
    shape(shapes[8]);
    text(0, 0, 0, 18, "Neptune");
    translate(-x, 0, -z);
  }
  
  void update() {
    theta += speed;
    x = distance * cos(theta);
    z = distance * sin(theta);
  }
}
