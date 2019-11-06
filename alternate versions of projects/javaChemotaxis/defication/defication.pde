PImage background, player, bully, food;
Player bob;
ArrayList<Bully> bullies = new ArrayList<Bully>();
ArrayList<Feces> poopy = new ArrayList<Feces>();
ArrayList<Food> foods = new ArrayList<Food>();
int mass;
int gTotal, gSaved;
int bTotal, bSaved;
int sped;
boolean alive;

void setup() {
  size(1000, 600);
  background(139, 69, 19);
  alive = true;
  mass = 10;
  sped = 0;
  gTotal = 0;
  gSaved = 0;
  bTotal = 0;
  bSaved = 0;
  
  background = loadImage("background.jpg");
  
  player = loadImage("player.png");
  bob = new Player(width/2, height/2);
  
  bully = loadImage("enemy.png");
  for(int i = 0; i < 1; i++) {
    bullies.add(new Bully(random(-width, 0), random(-height, 0), .008 + (.008 * sped)));
    sped++;
  }
  
  food = loadImage("food.png");
  for(int i = 0; i < 5; i++) {
    foods.add(new Food(random(width), random(height)));
  }
}

void draw() {
  background(background);
  
  if(mass <= 0) {
    alive = false;
  }
  
  if(alive) {
    for(Feces turd : poopy) {
      turd.show();
    }
    
    if(gTotal < 3000) {
      gTotal = millis() - gSaved;
    } else {
      gSaved += gTotal;
      gTotal = 0;
      foods.add(new Food(random(width), random(height)));
    }
    
    for(Food fud : foods) {
      fud.show();
    }
    
    for(int i = 0; i < foods.size(); i++) {
      if(((foods.get(i).x + 5) - (bob.x + (mass + 10)) <= 0) && ((bob.x - (mass + 10) - (foods.get(i).x + 35)) <= 0) && ((bob.y - (mass + 10) - (foods.get(i).y + 40)) <= 0) && ((foods.get(i).y) - (bob.y + (mass + 10)) <= 0)) {
        foods.remove(i);
        i--;
        mass += 2;
      }
    }
    
    bob.show();
    bob.update();
    
    if(bTotal < 3500) {
      bTotal = millis() - bSaved;
    } else {
      bSaved += bTotal;
      bTotal = 0;
      bullies.add(new Bully(random(-width, 0), random(-height, 0), .008 + (.003 * sped)));
      sped++;
    }
    
    for(Bully dave : bullies) {
      dave.show();
      dave.update();
    }
    
    for(int i = 0; i < bullies.size(); i++) {
      if(((bullies.get(i).x) - (bob.x + ((mass + 10)/2)) <= 0) && ((bob.x - (mass + 10) - (bullies.get(i).x + 50)) <= 0) && ((bob.y - (mass + 10) - (bullies.get(i).y + 60)) <= 0) && ((bullies.get(i).y) - (bob.y + (mass + 10)) <= 0)) {
        alive = false;
      }
      
      for(int j = 0; j < poopy.size(); j++) {
        if(((bullies.get(i).x + 10) - (poopy.get(j).x + 10) <= 0) && (((poopy.get(j).x - 10) - (bullies.get(i).x + 50)) <= 0) && (((poopy.get(j).y - 10) - (bullies.get(i).y + 50)) <= 0) && ((bullies.get(i).y + 10) - (poopy.get(j).y + 10) <= 0)) {
          bullies.remove(i);
          poopy.remove(j);
          j--;
          i--;
          break;
        }
      }
    }
    
    if(mass >= 5) {
      fill(255);
      textSize(32);
      text("Mass: " + mass, 10, 30);
    }
    else {
      fill(255, 220, 66);
      textSize(50);
      text("Mass: " + mass, width/2 - 100, height/2 - 10);
    }
  } else {
    fill(255, 220, 66);
    textSize(60);
    text("YOU DEAD", width/2 - 160, height/2 - 15);
  }
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
    float dx = mouseX - x;
    x += dx * ease;
    
    float dy = mouseY - y;
    y += dy * ease;
  }
  
  void show() {
    image(player, x-((mass + 50)/2), y-((mass + 50)/2), mass + 50, mass + 50);
  }
}

class Bully {
  float x, y, ease;
  
  Bully(float x, float y, float speed) {
    this.x = x;
    this.y = y;
    ease =  speed;
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
    ellipse(x, y, 20, 20);
  }
}

class Food {
  float x, y;
  
  Food(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void show() {
    image(food, x, y, 40, 40);
  }
}
