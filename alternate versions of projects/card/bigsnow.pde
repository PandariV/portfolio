class Bigsnow implements Snow {
  float x = 0, y = 0, z = 0, size = 0;
  float xSpeed = 0, ySpeed = 0;
  
  Bigsnow() {
    reset();
  }
  
  void update() {
    if(x >= -300 && x <= 300)
      x += xSpeed;
    y += ySpeed;
    if(y >= -size/2) {
      reset();
    }
  }
  
  void reset(){
    x = random(-300, 300);
    y = random(-1000, -10);
    z = random(-300, 300);
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
