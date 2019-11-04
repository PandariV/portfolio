PImage player, background, bully;
Player bob;
Bar progress;
Bully dave;
ArrayList<Bully> bullies = new ArrayList<Bully>();

void setup() {
  size(800, 600);
  cursor(CROSS);
  
  background = loadImage("background.jpg");
  
  player = loadImage("player.png");
  bob = new Player(width/2, height/2);
  
  bully = loadImage("enemy.png");
  dave = new Bully(random(width), random(height));
  
  progress = new Bar();
}

void draw() {
  background(background);
  bob.show();
  bob.update();
  
  dave.show();
  dave.update();
}

class Player {
  float x, y, ease = .02;
  
  Player(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    if(mouseX > 6 && mouseX < width - 7) {
      float dx = mouseX - x;
      x += dx * ease;
    }
    
    if (mouseY > 3 && mouseY < height - 15) {
      float dy = mouseY - y;
      y += dy * ease;
    }
  }
  
  void show() {
    image(player, x-35, y-35, 70, 70);
  }
}

class Bully {
  float x, y, ease = .008;;
  
  Bully(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    float dx = bob.x-35 - x;
    x += dx * ease;
    
    float dy = bob.y-35 - y;
    y += dy * ease;
  }
  
  void show() {
    image(bully, x, y, 70, 70);
  }
}

class Bar {
  Bar() {
  }
  
  void update() {
  }
  
  void show() {
  }
}
