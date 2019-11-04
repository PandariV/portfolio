PImage player;
Player bob;

void setup() {
  size(800, 600);
  
  player = loadImage("player.png");
  bob = new Player(width/2, height/2);
}

void draw() {
  background(0);
  bob.show();
  bob.update();
}

class Player {
  float x, y;
  float ease = 1.001;
  
  Player(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    x *= ease;
    y *= ease;
  }
  
  void show() {
    translate(x, y);
    rotate(HALF_PI);
    image(player, 0, 0, 70, 70);
  }
}

class Friends {
  Friends() {
  }
  
  void update() {
  }
  
  void show() {
  }
}
