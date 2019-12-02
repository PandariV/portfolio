class Smallsnow implements Snow {
  float x = 0, y = 0, z = 0, size = 0;
  float xSpeed = 0, ySpeed = 0;
  
  Smallsnow() {
    reset();
  }
  
  void update() {
    if(x >= -(width/4) && x <= (width/4))
      x += xSpeed;
    y += ySpeed;
    if(y >= -size/2) {
      reset();
    }
  }
  void reset(){
    x = random(-(width/4), (width/4));
    y = random(-1000, -10);
    z = random(-(width/4), (width/4));
    xSpeed = random(-1, 1);
    ySpeed = random(2, 6);
    size = random(1, 5);
  }
  
  void show() {
    push();
    fill(255);
    translate(x, y, z);
    sphere(size);
    pop();
  }
}
