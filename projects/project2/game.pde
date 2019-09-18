ArrayList<Box> boxes;
int scale = 25;

void setup() {
  size(601, 601);
  
  boxes = new ArrayList<Box>();
  
  for (int i = 0; i < width/scale * scale; i+=scale) {
    for (int j = 0; j < height/scale * scale; j+=scale) {
      boxes.add(new Box(i, j));
    }
  }
}

void draw() { 
  background(255);
  
  for (int i = 0; i < boxes.size(); i++) {
    boxes.get(i).show();
    check(boxes.get(i));
    boxes.get(i).update();
  }
  //delay(100);
  //noLoop();
}

void check(Box b) {
  int total = 0;
  
  if(b.alive)
    total--;
  
  for (Box box : boxes)
    if ((abs(box.x - b.x) <= scale) && ((abs(box.y - b.y) <= scale)) && box.alive)
        total++;
  
  b.setNeighbors(total);
}

void mousePressed() {
  setup();
}

class Box {
  int x, y;
  int neighbors;
  boolean alive;
  
  Box(int x, int y) {
    this.x = x;
    this.y = y;
    alive = (random(1, 10) >= 8.9);
  }
  
  void show() {
    stroke(255);
    
    if (alive)
      fill(0);
    else
      fill(255);
   
    rect(x, y, scale, scale);
  }
  
  void update() {
    if (alive && (neighbors < 2 || neighbors > 3))
      alive = false;
    else if (!alive && neighbors == 3)
      alive = true;
  }
  
  void setNeighbors(int neighbors) {
    this.neighbors = neighbors;
  }
}