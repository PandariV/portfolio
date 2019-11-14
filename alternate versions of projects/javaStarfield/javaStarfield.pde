float rotX = 0, rotY = 0;
Particles[] bois;

void setup() {
  size(800, 600, P3D);
  
  bois = new Particles[1];
  
  for(int i = 0; i < bois.length; i++) {
    bois[i] = new Normal(random(10), random(10), random(10));
  }
}

void draw() {
  background(0);
  smooth();
  lights();
  noStroke();
  
  translate(width/2, height/2);
  
  rotateX(rotX);
  rotateY(rotY);
  
  fill(247, 95, 49);
  sphere(100);
  
  for(Particles p : bois) {
    p.show();
  }
}

void mouseDragged(){
  rotY += (mouseX - pmouseX) * 0.01;
  rotX -= (mouseY - pmouseY) * 0.01;
}

interface Particles {
  void show();
  void update();
}

class Normal implements Particles {
  float x, y, z, speed;
  
  Normal(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this. z = z;
    speed = random(100);
  }
  
  void show() {
    //ellipse(x, y, 200, 200);
  }
  
  void update() {
  }
}
