int sx, sy, ex, ey;

void setup() {
  sx = (int)random(width);
  ex = sx;
  sy = 0;
  ey = 0;
  size(800, 600);
  background(0);
  strokeWeight(5);
}

void draw() {
  stroke(52, 232, 235);
}

void mousePressed() {
  for(int i = 0; i < 4; i++) {
    sx = (int)random(width);
    ex = sx;
    sy = 0;
    ey = 0;
    while(ey < height) {
      ey = sy + (int)random(9);
      ex = sx + (int)random(-9, 9);
      line(sx, sy, ex, ey);
      sx = ex;
      sy = ey;
    }
  }
}

void keyPressed() {
  clear();
}
