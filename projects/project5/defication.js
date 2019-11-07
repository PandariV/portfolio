var wallpaper, player, bully, food;
var bob;
var bullies, poopy, foods;
var mass;
var gTotal, gSaved;
var bTotal, bSaved;
var sped;
var alive, playing = false, credits = false, rules = false;

function preload() {
  wallpaper = loadImage("background.jpg");
  player = loadImage("player.png");
  food = loadImage("food.png");
  bully = loadImage("enemy.png");
  font = loadFont("Roboto-Light.ttf");
  heading = loadFont("Roboto.ttf");
}

function setup() {
  createCanvas(1000, 600);
  background(0);
  alive = true;
  mass = 10;
  sped = 0;
  gTotal = 0;
  gSaved = 0;
  bTotal = 0;
  bSaved = 0;

  bullies = [];
  poopy = [];
  foods = [];
  
  bob = new Player(width/2, height/2);
  
  var randomW = parseInt(random(2));
  var randomH = parseInt(random(2));
  if(randomW == 0) {
    if(randomH == 0)
      bullies.push(new Bully(random(-width, 0), random(-height, 0), .008 + (.003 * sped)));
    else
      bullies.push(new Bully(random(-width, 0), random(height, 2 * height), .008 + (.003 * sped)));
  } else {
    if(randomH == 0)
      bullies.push(new Bully(random(width, 2 * width), random(-height, 0), .008 + (.003 * sped)));
    else
      bullies.push(new Bully(random(-width, 2 * width), random(height, 2 * height), .008 + (.003 * sped)));
  }
  sped++;
  
  for(var i = 0; i < 5; i++) {
    foods.push(new Food(random(width), random(height)));
  }
}

function draw() {
  background(wallpaper);
  textFont(font);
  noStroke();
  
  if(mass <= 0) {
    alive = false;
  }
  
  if(alive && playing) {
    for(var turd of poopy) {
      turd.show();
    }
    
    if(gTotal < 3000) {
      gTotal = millis() - gSaved;
    } else {
      gSaved += gTotal;
      gTotal = 0;
      foods.push(new Food(random(width), random(height)));
    }
    
    for(var fud of foods) {
      fud.show();
    }
    
    for(var i = 0; i < foods.length; i++) {
      if(((foods[i].x + 5) - (bob.x + (mass + 10)) <= 0) && ((bob.x - (mass + 10) - (foods[i].x + 35)) <= 0) && ((bob.y - (mass + 10) - (foods[i].y + 40)) <= 0) && ((foods[i].y) - (bob.y + (mass + 10)) <= 0)) {
        foods.splice(i, 1);
        i--;
        mass += 1;
      }
    }

    for(var i = 0; i < poopy.length; i++) {
      if(poopy[i].total < 3000) {
        poopy[i].total = millis() - poopy[i].totalSaved;
      } else {
        poopy.splice(i, 1);
        i--;
      }
    }
    
    bob.show();
    bob.update();
    
    if(bTotal < 3500) {
      bTotal = millis() - bSaved;
    } else {
      bSaved += bTotal;
      bTotal = 0;
      var randomW = parseInt(random(2));
      var randomH = parseInt(random(2));
      if(randomW == 0) {
        if(randomH == 0)
          bullies.push(new Bully(random(-width, 0), random(-height, 0), .008 + (.003 * sped)));
        else
          bullies.push(new Bully(random(-width, 0), random(height, 2 * height), .008 + (.003 * sped)));
      } else {
        if(randomH == 0)
          bullies.push(new Bully(random(width, 2 * width), random(-height, 0), .008 + (.003 * sped)));
        else
          bullies.push(new Bully(random(-width, 2 * width), random(height, 2 * height), .008 + (.003 * sped)));
      }
      sped++;
    }
    
    for(var dave of bullies) {
      dave.show();
      dave.update();
    }
    
    for(var i = 0; i < bullies.length; i++) {
      if(((bullies[i].x) - (bob.x + ((mass + 10)/2)) <= 0) && ((bob.x - (mass + 10) - (bullies[i].x + 50)) <= 0) && ((bob.y - (mass + 10) - (bullies[i].y + 60)) <= 0) && ((bullies[i].y) - (bob.y + (mass + 10)) <= 0)) {
        alive = false;
      }
      
      for(var j = 0; j < poopy.length; j++) {
        if(((bullies[i].x + 10) - (poopy[j].x + 10) <= 0) && (((poopy[j].x - 10) - (bullies[i].x + 50)) <= 0) && (((poopy[j].y - 10) - (bullies[i].y + 50)) <= 0) && ((bullies[i].y + 10) - (poopy[j].y + 10) <= 0)) {
          bullies.splice(i, 1);
          poopy.splice(j, 1);
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
    if(mouseX > width/2 - 62.5 && mouseX < width/2 + 62.5 && mouseY < height/2 + 130 && mouseY > height/2 + 75) {
      fill(255, 0, 0);
    }
    text("Menu", width/2 - 62.5, height/2 + 110);
  } else {
    fill(205, 133 ,63);
    textSize(65);
    textFont(heading);
    text("DEFICATION", width/2 - 190, 145);
    textSize(20);
    textFont(font);
    fill(255);
    text("Run from cells and deficate (SPACE) to kill", width/2 - 190, 195);
    
    if(credits || rules) {
      textSize(30);
      fill(255);
      if(credits) {
        text("Developer: Virinch Pandari", width/2 - 185, height/2 - 30);
        text("Player Asset: PNGRepo.com | Bacteria Icon", width/2 - 275, height/2 + 30);
        text("Food Asset: FavePNG.com | Shinne45", width/2 - 250, height/2 + 100);
      } else {
        text("\n You are playing as a bacteria. \n Avoid the viruses and eat red \n blood cells to gain mass. Deficate \n (SPACE) to kill the viruses but be \n careful not to lose too much mass!", width/2 - 215, height/2 - 80);
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

function mousePressed() {
  if(playing && !alive && mouseX > width/2 - 102.5 && mouseX < width/2 + 102.5 && mouseY < height/2 + 30 && mouseY > height/2 - 25) {
    setup();
    alive = true;
  } else if(playing && !alive && mouseX > width/2 - 62.5 && mouseX < width/2 + 62.5 && mouseY < height/2 + 130 && mouseY > height/2 + 75) {
    playing = false;
  } else if(mouseX > width/2 - 47.5 && mouseX < width/2 + 47.5 && mouseY < height/2 + 10 && mouseY > height/2 - 50) {
    setup();
    playing = true;
  } else if(!rules && mouseX > width/2 - 67.5 && mouseX < width/2 + 67.5 && mouseY < height/2 + 105 && mouseY > height/2 + 45) {
    credits = true;
  } else if((credits || rules) && mouseX > width/2 - 45 && mouseX < width/2 + 45 && mouseY < height/2 + 200 && mouseY > height/2 + 140) {
    credits = false;
    rules = false;
  } else if(mouseX > width/2 - 52.5 && mouseX < width/2 + 52.5 && mouseY < height/2 + 200 && mouseY > height/2 + 140) {
    rules = true;
  }
}

function keyPressed() {
  if(alive) {
    poopy.push(new Feces(bob.x, bob.y));
    mass--;
  }
}

class Player {
  constructor(x, y) {
    this.x = x;
    this.y = y;
    this.ease = 0.2;
  }
  
  update() {
    var dx = mouseX - this.x;
    this.x += dx * this.ease;
    
    var dy = mouseY - this.y;
    this.y += dy * this.ease;
  }
  
  show() {
    image(player, this.x-((mass + 50)/2), this.y-((mass + 50)/2), mass + 50, mass + 50);
  }
}

class Bully {
  constructor(x, y, speed) {
    this.x = x;
    this.y = y;
    this.ease =  speed;
  }
  
  update() {
    var dx = bob.x-35 - this.x;
    this.x += dx * this.ease;
    
    var dy = bob.y-35 - this.y;
    this.y += dy * this.ease;
  }
  
  show() {
    image(bully, this.x, this.y, 60, 60);
  }
}

class Feces {
  constructor(x, y) {
    this.x = x;
    this.y = y;

    this.total = 0;
    this.totalSaved = millis();
  }
  
  show() {
    fill(210, 105, 30);
    ellipse(this.x, this.y, 20, 20);
  }
}

class Food {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }
  
  show() {
    image(food, this.x, this.y, 40, 40);
  }
}