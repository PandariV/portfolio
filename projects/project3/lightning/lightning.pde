PImage tseries;
PImage pewds;
Bolt[] bolts;
Person bernardNjanga;
int time, wait, totalTime;
boolean clapped;

void setup() {
  bolts = new Bolt[4];
  for(int i = 0; i < bolts.length; i++) {
    bolts[i] = new Bolt();
  }
  
  tseries = loadImage("tseries.png");
  pewds = loadImage("pewds.png");
  bernardNjanga = new Person();
  
  size(800, 600);
  strokeWeight(5);
  
  clapped = false;
  time = 0;
  wait = 200;
  totalTime = 0;
}

void draw() {
  background(0);
  stroke(52, 232, 235);
  
  time = millis();
  for(Bolt b : bolts) {
    b.show();
    b.update();
  }
  
  noStroke();
  fill(0, 100, 0);
  rect(0, height - 50, width, 50);
  
  bernardNjanga.show();
  bernardNjanga.update();
}

void keyPressed() {
  setup();
}

class Bolt {
  int sx, sy, ex, ey;
  
  Bolt() {
    update();
  }
  
  void update() {
    sx = (int)random(width);
    ex = sx;
    sy = 0;
    ey = 0;
  }
  
  void show() {
    while(ey < height) {
      ey = sy + (int)random(9);
      ex = sx + (int)random(-9, 9);
      line(sx, sy, ex, ey);
      sx = ex;
      sy = ey;
    }
  }
}

class Person {
  int x, y, speeed;
  
  Person() {
    x = width/2;
    y = 600 - 50;
    speeed = 5;
  }
  
  void update() {
    if(mouseX > x + 2) {
      x += speeed;
    }
    else if (mouseX < x - 2) {
      x -= speeed;
    }
  }
  
  void show() {
    if(clapped) {
    }
    image(pewds, width-300, 10, 300, 350);
    image(tseries, x-20, y-50, 40, 60);
  }
}
