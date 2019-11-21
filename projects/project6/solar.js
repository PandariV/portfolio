var rotX = 0, rotY = 0;
var toggle = true;
var font;
planets = [];
textures = [];

function preload() {
  font = loadFont("font.ttf");

  textures.push(loadImage("sun.jpg"));
  textures.push(loadImage("mercury.jpg"));
  textures.push(loadImage("venus.jpg"));
  textures.push(loadImage("earth.jpg"));
  textures.push(loadImage("mars.jpg"));
  textures.push(loadImage("jupiter.jpg"));
  textures.push(loadImage("saturn.jpg"));
  textures.push(loadImage("uranus.jpg"));
  textures.push(loadImage("neptune.jpg"));
}

function setup() {
  createCanvas(windowWidth, windowHeight, WEBGL);
  
  planets.push(new Mercury(.05));
  planets.push(new Venus(.045));
  planets.push(new Earth(.04));
  planets.push(new Mars(.035));
  planets.push(new Jupiter(.03));
  planets.push(new Saturn(.025));
  planets.push(new Uranus(.02));
  planets.push(new Neptune(.015));
}

function draw() {
  background(0);
  lights();
  smooth();
  noStroke();
  textFont(font);
  
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(-PI/50);
  
  texture(textures[0]);
  sphere(100);
  hud(0, 0, 0, 100, "Sun");
  
  for(var p of planets) {
    p.show();
    p.update();
  }
}

function mouseDragged(){
  rotY += (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
}

function keyPressed() {
  toggle = toggle ? false : true;
}

function hud(x, y, z, radius, words) {
  if(toggle) {
    fill(255);
    rotateY(-rotY);
    textSize(20);
    text(words, x - words.length * 5.5, y - radius - 20, z);
    rotateY(rotY);
  }
}

class Mercury {
  constructor(speed) {
    this.speed = speed;
    this.distance = 120;
    this.theta = random(PI * 2);
  }
  
  show() {
    translate(this.x, 0, this.z);
    texture(textures[1]);
    sphere(10);
    hud(0, 0, 0, 10, "Mercury");
    translate(-this.x, 0, -this.z);
  }
  
  update() {
    this.theta += this.speed;
    this.x = this.distance * cos(this.theta);
    this.z = this.distance * sin(this.theta);
  }
}

class Venus {
    constructor(speed) {
    this.speed = speed;
    this.distance = 150;
    this.theta = random(PI * 2);
  }
  
  show() {
    translate(this.x, 0, this.z);
    texture(textures[2]);
    sphere(15);
    hud(0, 0, 0, 15, "Venus");
    translate(-this.x, 0, -this.z);
  }
  
  update() {
    this.theta += this.speed;
    this.x = this.distance * cos(this.theta);
    this.z = this.distance * sin(this.theta);
  }
}

class Earth {
    constructor(speed) {
    this.speed = speed;
    this.distance = 185;
    this.theta = random(PI * 2);
  }
  
  show() {
    translate(this.x, 0, this.z);
    texture(textures[3]);
    sphere(15);
    hud(0, 0, 0, 15, "Earth");
    translate(-this.x, 0, -this.z);
  }
  
  update() {
    this.theta += this.speed;
    this.x = this.distance * cos(this.theta);
    this.z = this.distance * sin(this.theta);
  }
}

class Mars {
    constructor(speed) {
    this.speed = speed;
    this.distance = 213;
    this.theta = random(PI * 2);
  }
  
  show() {
    translate(this.x, 0, this.z);
    texture(textures[4]);
    sphere(12);
    hud(0, 0, 0, 12, "Mars");
    translate(-this.x, 0, -this.z);
  }
  
  update() {
    this.theta += this.speed;
    this.x = this.distance * cos(this.theta);
    this.z = this.distance * sin(this.theta);
  }
}

class Jupiter {
  constructor(speed) {
    this.speed = speed;
    this.distance = 270;
    this.theta = random(PI * 2);
  }
  
  show() {
    translate(this.x, 0, this.z);
    texture(textures[5]);
    sphere(25);
    hud(0, 0, 0, 25, "Jupiter");
    translate(-this.x, 0, -this.z);
  }
  
  update() {
    this.theta += this.speed;
    this.x = this.distance * cos(this.theta);
    this.z = this.distance * sin(this.theta);
  }
}

class Saturn {
  constructor(speed) {
    this.speed = speed;
    this.distance = 328;
    this.theta = random(PI * 2);
  }
  
  show() {
    translate(this.x, 0, this.z);
    texture(textures[6]);
    sphere(20);
    hud(0, 0, 0, 20, "Saturn");
    translate(-this.x, 0, -this.z);
  }
  
  update() {
    this.theta += this.speed;
    this.x = this.distance * cos(this.theta);
    this.z = this.distance * sin(this.theta);
  }
}

class Uranus {
  constructor(speed) {
    this.speed = speed;
    this.distance = 370;
    this.theta = random(PI * 2);
  }
  
  show() {
    translate(this.x, 0, this.z);
    texture(textures[7]);
    sphere(18);
    hud(0, 0, 0, 18, "Uranus");
    translate(-this.x, 0, -this.z);
  }
  
  update() {
    this.theta += this.speed;
    this.x = this.distance * cos(this.theta);
    this.z = this.distance * sin(this.theta);
  }
}

class Neptune {
  constructor(speed) {
    this.speed = speed;
    this.distance = 420;
    this.theta = random(PI * 2);
  }
  
  show() {
    translate(this.x, 0, this.z);
    texture(textures[8]);
    sphere(18);
    hud(0, 0, 0, 18, "Neptune");
    translate(-this.x, 0, -this.z);
  }
  
  update() {
    this.theta += this.speed;
    this.x = this.distance * cos(this.theta);
    this.z = this.distance * sin(this.theta);
  }
}
