Bolt[] bolts;
Person bernardNjanga;

void setup() {  
  bolts = new Bolt[4];
  for(int i = 0; i < bolts.length; i++) {
    bolts[i] = new Bolt();
  }
  
  bernardNjanga = new Person();
  
  size(800, 600);
  strokeWeight(5);
}

void draw() {
  background(0);
  stroke(52, 232, 235);
  
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

void mousePressed() {
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
    if(mouseX > x) {
      x += speeed;
    }
    else {
      x -= speeed;
    }
  }
  
  void show() {
    fill(255);
    ellipse(x, y-70, 40, 40);
    fill(255, 0, 0);
    rect(x-20, y-50, 40, 40);
    fill(255);
    rect(x-40, y-35, 20, 7);
    rect(x+20, y-35, 20, 7);
    rect(x+5, y-10, 7, 25);
    rect(x-12, y-10, 7, 25);
  }
}
