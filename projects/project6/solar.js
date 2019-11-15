var rotX = 0, rotY = 0;
planets = [];

function setup() {
  createCanvas(1000, 600, WEBGL);
  
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
  
  rotateX(rotX);
  rotateY(rotY);
  
  fill(255, 57, 18);
  sphere(100);
  
  for(var p of planets) {
    p.show();
    p.update();
  }
}

function mouseDragged(){
  rotY += (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
}

class Mercury {
  constructor(speed) {
    this.speed = speed;
    this.distance = 120;
    this.theta = random(PI * 2);
  }
  
  show() {
    fill(139, 125, 130);
    translate(this.x, 0, this.z);
    sphere(10);
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
    fill(252, 212, 64);
    translate(this.x, 0, this.z);
    sphere(15);
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
    fill(39, 162, 214);
    translate(this.x, 0, this.z);
    sphere(15);
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
    fill(188, 42, 58);
    translate(this.x, 0, this.z);
    sphere(12);
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
    fill(255, 158, 54);
    translate(this.x, 0, this.z);
    sphere(25);
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
    fill(176, 129, 35);
    translate(this.x, 0, this.z);
    sphere(20);
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
    fill(62, 228, 237);
    translate(this.x, 0, this.z);
    sphere(18);
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
    fill(0, 110, 184);
    translate(this.x, 0, this.z);
    sphere(18);
    translate(-this.x, 0, -this.z);
  }
  
  update() {
    this.theta += this.speed;
    this.x = this.distance * cos(this.theta);
    this.z = this.distance * sin(this.theta);
  }
}
