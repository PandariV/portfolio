var tseries;
var pewds;
var bolts = [];
var bernardNjanga;
var clapped;

function setup() {
  clapped = false;
  
  for(var i = 0; i < 4; i++) {
    bolts[i] = new Bolt();
  }

  //for(var i = 0; i < 5; i++) {
    //pies[i] = new Pewds();
  //}
  
  tseries = loadImage("tseries.png");
  bernardNjanga = new Person();
  
  createCanvas(800, 600);
  strokeWeight(5);
}

function draw() {
  if (clapped) {
    fill(255, 255, 0);
    textSize(25);
    text("SUB 2 PEWDIEPIE", width/2 - 100, height/2 - 5);
    textSize(20);
    text("press any key to restart", width/2 - 95, height/2 + 25);
  }
  else {
    background(0);
    stroke(52, 232, 235);
  
    for(var i = 0; i < 4; i++) {
      bolts[i].show();
      bolts[i].update();
    }
    
    noStroke();
    fill(0, 100, 0);
    rect(0, height - 50, width, 50);
    
    bernardNjanga.show();
    bernardNjanga.update();
  }
}

function keyPressed() {
  setup();
}

var sx, sy, ex, ey;

class Bolt {
  Bolt() {
    update();
  }
  
  update() {
    sx = random(width);
    ex = sx;
    sy = 0;
    ey = 0;
  }
  
  show() {
    while(ey < height) {
      ey = sy + random(9);
      ex = sx + random(-9, 9);
      line(sx, sy, ex, ey);
      sx = ex;
      sy = ey;
    }
  }
}

let x, y, speeed;

class Person {
  
  Person() {
    x = width/2;
    y = 600 - 50;
    speeed = 5;
  }
  
  update() {
    if(mouseX > x + 2) {
      x += speeed;
    }
    else if (mouseX < x - 2) {
      x -= speeed;
    }
  }
  
  show() {
    image(tseries, 20, 50, 40, 60);
  }
}