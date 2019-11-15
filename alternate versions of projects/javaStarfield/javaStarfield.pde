float rotX = 0, rotY = 0;
boolean toggle = true;
PFont font;
Planets[] planets = new Planets[8];

void setup() {
  fullScreen(P3D);
  background(0);
  
  font = createFont("Roboto", 20);
  
  planets[0] = new Mercury(.05);
  planets[1] = new Venus(.045);
  planets[2] = new Earth(.04);
  planets[3] = new Mars(.035);
  planets[4] = new Jupiter(.03);
  planets[5] = new Saturn(.025);
  planets[6] = new Uranus(.02);
  planets[7] = new Neptune(.015);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  lights();
  smooth();
  noStroke();
  textFont(font);
  
  rotateX(rotX);
  rotateY(rotY);
  
  fill(255, 57, 18);
  sphere(100);
  text(0, 0, 0, 100, "Sun");
  
  pointLight(255, 255, 255, 0, 0, 0);
  
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
    text(text, x - text.length() * 5.5, y - radius - 20, z);
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
    fill(139, 125, 130);
    translate(x, 0, z);
    sphere(10);
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
    fill(252, 212, 64);
    translate(x, 0, z);
    sphere(15);
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
    fill(39, 162, 214);
    translate(x, 0, z);
    sphere(15);
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
    fill(188, 42, 58);
    translate(x, 0, z);
    sphere(12);
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
    fill(255, 158, 54);
    translate(x, 0, z);
    sphere(25);
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
    fill(176, 129, 35);
    translate(x, 0, z);
    sphere(20);
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
    fill(62, 228, 237);
    translate(x, 0, z);
    sphere(18);
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
    fill(0, 110, 184);
    translate(x, 0, z);
    sphere(18);
    text(0, 0, 0, 18, "Neptune");
    translate(-x, 0, -z);
  }
  
  void update() {
    theta += speed;
    x = distance * cos(theta);
    z = distance * sin(theta);
  }
}
