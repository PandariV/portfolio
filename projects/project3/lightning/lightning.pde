int sx, sy, ex, ey;
int sec = 0, totalTime = 1000, wait = 5, savedTime;
Bolt[] bolts = new Bolt[4];


void setup() {
  sx = (int)random(width);
  ex = sx;
  sy = 0;
  ey = 0;
  
  for(int i = 0; i < 4; i++) {
    bolts[i] = new Bolt();
  }
  size(800, 600);
  background(0);
  strokeWeight(5);
}

void draw() {
  stroke(52, 232, 235);
  
  m += millis();
  
  for(Bolt b : bolts) {
    b.show();
    b.update();
  }
  
  if(m >= 200) {
    clear();
    m = 0;
  }
}

void checkTime() {
  int passedTime = millis() - savedTime;
  if (passedTime > totalTime) {
    sec++;
    if (sec > snowWait) {
      grow -= 1;
    }
    savedTime = millis();
  }
}

class Bolt {
  void update() {
    sx = mouseX;
    ex = (int)random(width);
    sy = mouseY;
    ey = sy;
  }
  
  void show() {
    while(ey > 0) {
      ey = sy - (int)random(9);
      ex = sx - (int)random(-9, 9);
      line(sx, sy, ex, ey);
      sx = ex;
      sy = ey;
    }
  }
}
