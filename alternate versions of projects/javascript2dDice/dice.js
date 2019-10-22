var dies;
var dWidth = 50;
var sum;
var rows;

function setup() {
  createCanvas(500, 600);
  background(0);
  rows = 6;

  dies = new Array(rows);
  for (var i = 0; i < rows; i++) { 
    dies[i] = new Array(6); 
} 
  
  
  sum = 0;
  
  for(var i = 1; i < dies.length+1; i++) {
    for(var j = 1; j < dies.length+1; j++) {
      dies[i-1][j-1] = new Die(i*(dWidth + 12), j*(dWidth + 12), dWidth, parseInt(random(6) + 1));
    }
  }
}

function draw() {
  background(0);
  for(var i = 1; i < dies.length+1; i++) {
    for(var j = 1; j < dies.length+1; j++) {
      dies[i-1][j-1] = new Die(i*(dWidth + 12), j*(dWidth + 12), dWidth, parseInt(random(6) + 1));
    }
  }
  
  noStroke();
  for(var i = 1; i < dies.length+1; i++) {
    for(var j = 1; j < dies.length+1; j++) {
      dies[i-1][j-1].show();
      sum += dies[i-1][j-1].value;
      console.log(dies[i-1][j-1].value);
    }
  }
  fill(255);
  textSize(32);
  textAlign(CENTER);
  text("Total: " + sum, width/2, height - 100);
  text("# Of Dies: " + (dies.length * dies.length), width/2, height - 50);
  noLoop();
}

function mousePressed() {
  sum = 0;
  redraw();
}

class Die {
  
  constructor(x, y, dWidth, value) {
    this.x = x;
    this.y = y;
    this.dWidth = dWidth;
    
    this.value = value;
  }
  
  show() {
    fill(random(100, 255), random(100, 255), random(100, 255));
    rect(this.x, this.y, this.dWidth, this.dWidth, 7);
    fill(0);
    if(this.value == 1) {
      ellipse(this.x + this.dWidth/2, this.y + this.dWidth/2, 10, 10);
    } else if(this.value == 2) {
      ellipse(this.x + this.dWidth/5, this.y  + this.dWidth - this.dWidth/5, 10, 10);
      ellipse(this.x  + this.dWidth - this.dWidth/5, this.y + this.dWidth/5, 10, 10);
    } else if(this.value == 3) {
      ellipse(this.x +this.dWidth/2, this.y +this.dWidth/2, 10, 10);
      ellipse(this.x +this.dWidth/5, this.y  + this.dWidth -this.dWidth/5, 10, 10);
      ellipse(this.x  + this.dWidth -this.dWidth/5, this.y +this.dWidth/5, 10, 10);
    } else if(this.value == 4) {
      ellipse(this.x +this.dWidth/5, this.y +this.dWidth/5, 10, 10);
      ellipse(this.x  + this.dWidth -this.dWidth/5, this.y  + this.dWidth -this.dWidth/5, 10, 10);
      ellipse(this.x +this.dWidth/5, this.y  + this.dWidth -this.dWidth/5, 10, 10);
      ellipse(this.x  + this.dWidth -this.dWidth/5, this.y +this.dWidth/5, 10, 10);
    } else if(this.value == 5) {
      ellipse(this.x +this.dWidth/2, this.y +this.dWidth/2, 10, 10);
      ellipse(this.x +this.dWidth/5, this.y +this.dWidth/5, 10, 10);
      ellipse(this.x  + this.dWidth -this.dWidth/5, this.y  + this.dWidth -this.dWidth/5, 10, 10);
      ellipse(this.x +this.dWidth/5, this.y  + this.dWidth -this.dWidth/5, 10, 10);
      ellipse(this.x  + this.dWidth -this.dWidth/5, this.y +this.dWidth/5, 10, 10);
    } else {
      ellipse(this.x + this.dWidth/5, this.y + this.dWidth/2, 10, 10);
      ellipse(this.x  + this.dWidth -this.dWidth/5, this.y +this.dWidth/2, 10, 10);
      ellipse(this.x +this.dWidth/5, this.y +this.dWidth/5, 10, 10);
      ellipse(this.x  + this.dWidth -this.dWidth/5, this.y  + this.dWidth -this.dWidth/5, 10, 10);
      ellipse(this.x +this.dWidth/5, this.y + this.dWidth - this.dWidth/5, 10, 10);
      ellipse(this.x + this.dWidth - this.dWidth/5, this.y + this.dWidth/5, 10, 10);
    }
  }
}
