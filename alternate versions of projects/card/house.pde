class House {
  float x, y, z;
  
  House(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void show() {
    push();
    translate(x, y-76, z);
    fill(162, 104, 77);
    box(150);
    translate(0, -150, 0);
    pyramid(80, 203, 78, 97);
    pop();
  }
}
