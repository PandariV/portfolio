PImage background, player, bully, food;
Player bob;
ArrayList<Bully> bullies;
ArrayList<Feces> poopy;
ArrayList<Food> foods;
int mass;
int gTotal, gSaved;
int bTotal, bSaved;
int sped;
boolean alive, playing = false, credits = false, rules = false;

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
  bullies = new ArrayList<Bully>();
  int randomW = (int)random(2);
  int randomH = (int)random(2);
  if(randomW == 0) {
    if(randomH == 0)
      bullies.add(new Bully(random(-width, 0), random(-height, 0), .008 + (.003 * sped)));
    else
      bullies.add(new Bully(random(-width, 0), random(height, 2 * height), .008 + (.003 * sped)));
  } else {
    if(randomH == 0)
      bullies.add(new Bully(random(width, 2 * width), random(-height, 0), .008 + (.003 * sped)));
    else
      bullies.add(new Bully(random(-width, 2 * width), random(height, 2 * height), .008 + (.003 * sped)));
  }
  sped++;
  
  food = loadImage("food.png");
  foods = new ArrayList<Food>();
  for(int i = 0; i < 5; i++) {
    foods.add(new Food(random(width), random(height)));
  }
  
  poopy = new ArrayList<Feces>();
}

void draw() {
  background(background);
  noStroke();
  
  if(mass <= 0) {
    alive = false;
  }
  
  if(alive && playing) {
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
        mass += 1;
      }
    }
    
    bob.show();
    bob.update();
    
    if(bTotal < 3500) {
      bTotal = millis() - bSaved;
    } else {
      bSaved += bTotal;
      bTotal = 0;
      int randomW = (int)random(2);
      int randomH = (int)random(2);
      if(randomW == 0) {
        if(randomH == 0)
          bullies.add(new Bully(random(-width, 0), random(-height, 0), .008 + (.003 * sped)));
        else
          bullies.add(new Bully(random(-width, 0), random(height, 2 * height), .008 + (.003 * sped)));
      } else {
        if(randomH == 0)
          bullies.add(new Bully(random(width, 2 * width), random(-height, 0), .008 + (.003 * sped)));
        else
          bullies.add(new Bully(random(-width, 2 * width), random(height, 2 * height), .008 + (.003 * sped)));
      }
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
  } else if(playing){
    fill(255);
    textSize(60);
    text("YOU DIED", width/2 - 145, 150);
    textSize(30);
    text("Final Mass: " + mass, width/2 - 105, 205);
    
    textSize(40);
    if(mouseX > width/2 - 102.5 && mouseX < width/2 + 102.5 && mouseY < height/2 + 30 && mouseY > height/2 - 25) {
      fill(255, 0, 0);
    }
    text("Play Again", width/2 - 102.5, height/2 + 10);
    fill(255);
    if(mouseX > width/2 - 57.5 && mouseX < width/2 + 57.5 && mouseY < height/2 + 130 && mouseY > height/2 + 75) {
      fill(255, 0, 0);
    }
    text("Menu", width/2 - 57.5, height/2 + 110);
  } else {
    fill(205, 133 ,63);
    textSize(65);
    text("DEFICATION", width/2 - 190, 145);
    textSize(20);
    fill(255);
    text("Run from cells and deficate (SPACE) to kill", width/2 - 200, 195);
    
    if(credits || rules) {
      textSize(30);
      fill(255);
      if(credits) {
        text("Developer: Virinch Pandari", width/2 - 185, height/2 - 30);
        text("Player Asset: PNGRepo.com | Bacteria Icon", width/2 - 275, height/2 + 30);
        text("Food Asset: FavePNG.com | Shinne45", width/2 - 250, height/2 + 100);
      } else {
        text("\n You are playing as a bacteria. \n Avoid the viruses and eat red \n blood cells to gain mass. Deficate \n (SPACE) to kill the viruses but be \n careful not to lose too much mass!", width/2 - 230, height/2 - 100);
      }
      
      textSize(40);
      if(mouseX > width/2 - 45 && mouseX < width/2 + 45 && mouseY < height/2 + 200 && mouseY > height/2 + 140) {
        fill(255, 0, 0);
      }
      text("Back", width/2 - 45, height/2 + 175);
    }
    else {
      textSize(40);
      if(mouseX > width/2 - 47.5 && mouseX < width/2 + 47.5 && mouseY < height/2 + 10 && mouseY > height/2 - 50) {
        fill(255, 0, 0);
      }
      text("Start", width/2 - 47.5, height/2 - 15);
      fill(255);
      if(mouseX > width/2 - 67.5 && mouseX < width/2 + 67.5 && mouseY < height/2 + 105 && mouseY > height/2 + 45) {
        fill(255, 0, 0);
      }
      text("Credits", width/2 - 67.5, height/2 + 80);
      fill(255);
      if(mouseX > width/2 - 52.5 && mouseX < width/2 + 52.5 && mouseY < height/2 + 200 && mouseY > height/2 + 140) {
        fill(255, 0, 0);
      }
      text("Rules", width/2 - 52.5, height/2 + 175);
    }
  }
}

void mousePressed() {
  if(playing && !alive && mouseX > width/2 - 102.5 && mouseX < width/2 + 102.5 && mouseY < height/2 + 30 && mouseY > height/2 - 25) {
    setup();
  } else if(playing && !alive && mouseX > width/2 - 57.5 && mouseX < width/2 + 57.5 && mouseY < height/2 + 130 && mouseY > height/2 + 75) {
    playing = false;
  } else if(mouseX > width/2 - 47.5 && mouseX < width/2 + 47.5 && mouseY < height/2 + 10 && mouseY > height/2 - 50) {
    setup();
    playing = true;
  } else if(mouseX > width/2 - 67.5 && mouseX < width/2 + 67.5 && mouseY < height/2 + 105 && mouseY > height/2 + 45) {
    credits = true;
  } else if((credits || rules) && mouseX > width/2 - 45 && mouseX < width/2 + 45 && mouseY < height/2 + 200 && mouseY > height/2 + 140) {
    credits = false;
    rules = false;
  } else if(mouseX > width/2 - 52.5 && mouseX < width/2 + 52.5 && mouseY < height/2 + 200 && mouseY > height/2 + 140) {
    rules = true;
  }
}

void keyPressed() {
  if(alive) {
    poopy.add(new Feces(bob.x, bob.y));
    mass--;
  }
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
  
  Feces(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void show() {
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
