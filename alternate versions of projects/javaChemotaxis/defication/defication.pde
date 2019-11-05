PImage player, background, bully;
Player bob;
Bully dave;
ArrayList<Bully> bullies = new ArrayList<Bully>();
ArrayList<Feces> poopy = new ArrayList<Feces>();
int mass;
int stage;
int indexP;
boolean alive;

void setup() {
  size(800, 600);
  background(139, 69, 19);
  cursor(CROSS);
  alive = true;
  mass = 10;
  stage = 1;
  
  background = loadImage("background.jpg");
  
  player = loadImage("player.png");
  bob = new Player(width/2, height/2);
  
  bully = loadImage("enemy.png");
  for(int i = 0; i < 1; i++) {
    bullies.add(new Bully(random(width), random(height)));
  }
}

void draw() {
  background(background);
  
  alive = mass > 0 ? true : false;
  
  for(Feces turd : poopy) {
    turd.show();
  }
  
  for(indexP = 0; indexP < poopy.size(); indexP++) {
    poopy.get(indexP).update();
  }
  
  bob.show();
  bob.update();
  
  for(Bully dave : bullies) {
    dave.show();
    dave.update();
  }
  
  fill(255);
  textSize(32);
  text("Mass: " + mass, 10, 30);
}

void keyPressed() {
  poopy.add(new Feces(bob.x, bob.y));
  mass--;
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
    image(player, x-((mass + 40)/2), y-((mass + 40)/2), mass + 40, mass + 40);
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
    image(bully, x, y, 60, 60);
  }
}

class Feces {
  float x, y;
  int total, saved, totalSaved;
  
  Feces(float x, float y) {
    this.x = x;
    this.y = y;
    
    total = 0;
    saved = 0;
    totalSaved = millis();
  }
  
  void show() {
    noStroke();
    fill(210, 105, 30);
    ellipse(x, y, 10, 10);
  }
  
  void update() {
    if(total < 1500) {
      total = millis() - totalSaved;
    } else {
      saved += total;
      total = 0;
      poopy.remove(0);
      indexP--;
    }
  }
}
