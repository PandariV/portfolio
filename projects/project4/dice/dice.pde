Die[][] dies;
int dWidth = 50;
int sum;
int rows;

void setup() {
  size(800, 600);
  background(0);
  rows = 11;
  
  sum = 0;
  dies = new Die[rows][6];
  
  for(int i = 1; i < dies.length+1; i++) {
    for(int j = 1; j < dies[1].length+1; j++) {
      dies[i-1][j-1] = new Die(i*(dWidth + 12), j*(dWidth + 12), dWidth);
    }
  }
}

void draw() {
  background(0);
  for(int i = 1; i < dies.length+1; i++) {
    for(int j = 1; j < dies[1].length+1; j++) {
      dies[i-1][j-1] = new Die(i*(dWidth + 12), j*(dWidth + 12), dWidth);
    }
  }
  
  noStroke();
  for(Die[] die : dies) {
    for(Die d : die) {
      d.show();
      sum += d.value;
    }
  }
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("Total: " + sum, width/2, height - 100);
  text("# Of Dies: " + (dies.length * dies[1].length), width/2, height - 50);
  noLoop();
}

void mousePressed() {
  sum = 0;
  dies = new Die[rows][6];
  redraw();
}

class Die {
  int x, y, dWidth;
  int value;
  
  Die(int x, int y, int dWidth) {
    this.x = x;
    this.y = y;
    this.dWidth = dWidth;
    
    value = (int) random(0, 6) + 1;
  }
  
  void show() {
    fill(random(100, 255), random(100, 255), random(100, 255));
    rect(x, y, dWidth, dWidth, 7);
    fill(0);
    if(value == 1) {
      ellipse(x + dWidth/2, y + dWidth/2, 10, 10);
    } else if(value == 2) {
      ellipse(x + dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth/5, 10, 10);
    } else if(value == 3) {
      ellipse(x + dWidth/2, y + dWidth/2, 10, 10);
      ellipse(x + dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth/5, 10, 10);
    } else if(value == 4) {
      ellipse(x + dWidth/5, y + dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth/5, 10, 10);
    } else if(value == 5) {
      ellipse(x + dWidth/2, y + dWidth/2, 10, 10);
      ellipse(x + dWidth/5, y + dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth/5, y + dWidth - dWidth/5, 10, 10);
      ellipse(x + dWidth - dWidth/5, y + dWidth/5, 10, 10);
    } else if(value == 6) {
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
