Die[] dies;
int dWidth = 50;

void setup() {
  size(800, 600);
  background(0);
  
  dies = new Die[3];
  
  for(int i = 1; i < dies.length+1; i++) {
    dies[i-1] = new Die(i*(dWidth + 10), 10, dWidth);
  }
}

void draw() {
  for(int i = 1; i < dies.length+1; i++) {
    dies[i-1] = new Die(i*(dWidth + 10), 10, dWidth);
  }
  
  noStroke();
  for(Die d : dies) {
    d.show();
    println(d);
  }
  noLoop();
}

void mousePressed() {
  redraw();
}

class Die {
  int x, y, dWidth;
  int value;
  
  Die(int x, int y, int dWidth) {
    this.x = x;
    this.y = y;
    this.dWidth = dWidth;
    
    value = (int) random(1, 6);
  }
  
  void show() {
    if(value == 1) {
      fill(255);
      rect(x, y, dWidth, dWidth);
      fill(0);
      ellipse(x + dWidth/2, y + dWidth/2, 10, 10);
    } else if(value == 2) {
      fill(255);
      rect(x, y, dWidth, dWidth);
      fill(0);
      ellipse(x + dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth/5, 10, 10);
    } else if(value == 3) {
      fill(255);
      rect(x, y, dWidth, dWidth);
      fill(0);
      ellipse(x + dWidth/2, y + dWidth/2, 10, 10);
      ellipse(x + dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth/5, 10, 10);
    } else if(value == 4) {
      fill(255);
      rect(x, y, dWidth, dWidth);
      fill(0);
      ellipse(x + dWidth/5, y + dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth/5, 10, 10);
    } else if(value == 5) {
      fill(255);
      rect(x, y, dWidth, dWidth);
      fill(0);
      ellipse(x + dWidth/2, y + dWidth/2, 10, 10);
      ellipse(x + dWidth/5, y + dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth/5, 10, 10);
    } else if(value == 6) {
      fill(255);
      rect(x, y, dWidth, dWidth);
      fill(0);
      ellipse(x + dWidth/5, y + dWidth/2, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth/2, 10, 10);
      ellipse(x + dWidth/5, y + dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth/5, 10, 10);
    }
  }
  
  String toString() {
    return "x:" + x + " y: " + y + " value: " + value;
  }
}
