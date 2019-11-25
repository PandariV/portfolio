class Tree {
  float x, y, z;
  
  Tree(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void show() {
    push();
    translate(x, y-26, z);
    fill(162, 104, 77);
    box(50);
    translate(0, -50, 0);
    pyramid(60, 70, 178, 103);
    translate(0, -60, 0);
    pyramid(50, 70, 178, 103);
    translate(0, -50, 0);
    pyramid(40, 70, 178, 103);
    pop();
  }
}
