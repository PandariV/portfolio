PImage tseries;
PImage pewds;
Bolt[] bolts;
Person bernardNjanga;
Pewds [] pies;
boolean clapped;

void setup() {
  clapped = false;
  
  bolts = new Bolt[4];
  for(int i = 0; i < bolts.length; i++) {
    bolts[i] = new Bolt();
  }
  
  tseries = loadImage("tseries.png");
  pewds = loadImage("pewds.png");
  bernardNjanga = new Person();
  
  pies = new Pewds[5];
  for(int i = 0; i < pies.length; i++) {
    pies[i] = new Pewds();
  }
  
  size(800, 600);
  strokeWeight(5);
}

void draw() {
  if (clapped) {
    background(255, 0, 0);
  }
  else {
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
    
    for (Pewds p : pies) {
      p.show();
      p.update();
      
      if ((bernardNjanga.x + 20 >= p.x || bernardNjanga.x - 20 <= p.x) && (bernardNjanga.y == p.y - 10)) {
        clapped = true;
      }
    }
  }
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
    image(tseries, x-20, y-50, 40, 60);
  }
}

class Pewds {
  int x = 0, y = 0, size = 0;
  double xSpeed = 0, ySpeed = 0;
  
  Pewds() {
    x = (int) random(0, width);
    y = (int) random(-1000, -10);
    xSpeed = random(-1, 1);
    ySpeed = random(2, 6);
    size = (int) random(1, 10);
  }
  
  void show() {
    image(pewds, x, y, 50, 50);
  }
  
  void update() {
    x += xSpeed;
    y += ySpeed;
    
    if (y > height) {
      y = (int) random(-300, -10);
      x = (int) random(0, width);
    }
    if (x == 0) {
      y = (int) random(-300, -10);
      x = (int) random(0, width);
    }
  }
}
