float rotX = 0, rotY = 0;
int value = 1;
int wd = 250, pd = 60;
float speed = 0.01;
int total = 0, saved = 0;

void setup(){
  background(0);
  size(800, 600, P3D);
}

void draw(){  
  background(0);
  smooth();
  lights();
  noStroke();
  
  translate(width/2, height/2);
  
  rotateY(speed);
  speed += 0.01;
  fill(255);
  box(wd);
  fill(200, 0, 0);
  textSize(32);
  text("Roll: " + value, -50, -200);
  stroke(200, 0, 0);
  strokeWeight(2);
  line(0, -190, 0, 0);
  
  if(total < 3000) {
    total = millis()- saved;
  } else {
    saved += total;
    total = 0;
    value = (int) random(0, 6) + 1;
  }
  
  if(value == 1) {
    //top (1)
    translate(0, -wd/2);
    sphere(20);
    translate(0, wd/2);
    
    //bottom (6)
    translate(wd/2 - pd, wd/2);
    sphere(20);
    translate(2* (-wd/2 + pd), 0);
    sphere(20);
    translate(2 * (wd/2 - pd), 0, -wd/2 + pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, -wd/2, -wd/2 + pd);
    translate(wd/2 - pd, wd/2, wd/2 - pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, -2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, -wd/2, wd/2 - pd);
    
    //front (4)
    translate(wd/2 - pd, -wd/2 + pd, wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, wd/2 - pd, -wd/2);
    translate(wd/2 - pd, wd/2 - pd, wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, -wd/2 + pd, -wd/2);
    
    //back (3)
    translate(0, 0, -wd/2);
    sphere(20);
    translate(wd/2 - pd, -wd/2 + pd, 0);
    sphere(20);
    translate(2 * (-wd/2 + pd), 2 * (wd/2 - pd), 0);
    sphere(20);
    translate(wd/2 - pd, -wd/2 + pd, wd/2);
    
    //left (5)
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(0, wd/2 - pd, -wd/2 + pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2, wd/2 - pd, -wd/2 + pd);
    translate(-wd/2, wd/2 - pd, wd/2 - pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), -2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2, wd/2 - pd, wd/2 - pd);
    
    //right (2)
    translate(wd/2, wd/2 - pd, -wd/2 + pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), 2 * (wd/2 - pd));
    sphere(20);
    translate(-wd/2, wd/2 - pd, -wd/2 + pd);
  } else if(value == 2) {
    //top (2)
    translate(wd/2 - pd, -wd/2, -wd/2 + pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, wd/2, -wd/2 + pd);
    
    //bottom (5)
    translate(0, wd/2);
    sphere(20);
    translate(wd/2 - pd, 0, -wd/2 + pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, -wd/2, -wd/2 + pd);
    translate(wd/2 - pd, wd/2, wd/2 - pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, -2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, -wd/2, wd/2 - pd);
    
    //front (6)
    translate(wd/2 - pd, 0, wd/2);
    sphere(20);
    translate(-wd/2, 0);
    sphere(20);
    translate(pd, 0, -wd/2);
    translate(wd/2 - pd, -wd/2 + pd, wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, wd/2 - pd, -wd/2);
    translate(wd/2 - pd, wd/2 - pd, wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, -wd/2 + pd, -wd/2);
    
    //back (1)
    translate(0, 0, -wd/2);
    sphere(20);
    translate(0, 0, wd/2);
    
    //left (3)
    translate(wd/2, 0, 0);
    sphere(20);
    translate(0, -wd/2 + pd, wd/2 - pd);
    sphere(20);
    translate(0, 2 * (wd/2 - pd), 2 * (-wd/2 + pd));
    sphere(20);
    translate(-wd/2, -wd/2 + pd, wd/2 - pd);
    
    //right (4)
    translate(-wd/2, -wd/2 + pd, wd/2 - pd);
    sphere(20);
    translate(0, 0, -wd/2);
    sphere(20);
    translate(wd/2, wd/2 - pd, pd);
    translate(-wd/2, wd/2 - pd, wd/2 - pd);
    sphere(20);
    translate(0, 0, -wd/2);
    sphere(20);
    translate(wd/2, -wd/2 + pd, pd);
  } else if(value == 3) {
    //top (3)
    translate(0, -wd/2);
    sphere(20);
    translate(wd/2 - pd, 0, -wd/2 + pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, wd/2, -wd/2 + pd);
    
    //bottom (4)
    translate(wd/2 - pd, wd/2, -wd/2 + pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, -wd/2, -wd/2 + pd);
    translate(wd/2 - pd, wd/2, wd/2 - pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, -2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, -wd/2, wd/2 - pd);
    
    //front (1)
    translate(0, 0, wd/2);
    sphere(20);
    translate(0, 0, -wd/2);
    
    //back (6)
    translate(wd/2 - pd, 0, -wd/2);
    sphere(20);
    translate(-wd/2, 0);
    sphere(20);
    translate(pd, 0, wd/2);
    translate(wd/2 - pd, -wd/2 + pd, -wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, wd/2 - pd, wd/2);
    translate(wd/2 - pd, wd/2 - pd, -wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, -wd/2 + pd, wd/2);
    
    //left (5)
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(0, wd/2 - pd, -wd/2 + pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2, wd/2 - pd, -wd/2 + pd);
    translate(-wd/2, wd/2 - pd, wd/2 - pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), -2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2, wd/2 - pd, wd/2 - pd);
    
    //right (2)
    translate(wd/2, wd/2 - pd, -wd/2 + pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), 2 * (wd/2 - pd));
    sphere(20);
    translate(-wd/2, wd/2 - pd, -wd/2 + pd);
  } else if(value == 4) {
    //top (4)
    translate(wd/2 - pd, -wd/2, -wd/2 + pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, +wd/2, -wd/2 + pd);
    translate(wd/2 - pd, -wd/2, wd/2 - pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, -2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, wd/2, wd/2 - pd);
    
    //bottom (3)
    translate(0, wd/2);
    sphere(20);
    translate(wd/2 - pd, 0, -wd/2 + pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, -wd/2, -wd/2 + pd);
    
    //front (6)
    translate(wd/2 - pd, 0, wd/2);
    sphere(20);
    translate(-wd/2, 0);
    sphere(20);
    translate(pd, 0, -wd/2);
    translate(wd/2 - pd, -wd/2 + pd, wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, wd/2 - pd, -wd/2);
    translate(wd/2 - pd, wd/2 - pd, wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, -wd/2 + pd, -wd/2);
    
    //back (1)
    translate(0, 0, -wd/2);
    sphere(20);
    translate(0, 0, wd/2);
    
    //left (5)
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(0, wd/2 - pd, -wd/2 + pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2, wd/2 - pd, -wd/2 + pd);
    translate(-wd/2, wd/2 - pd, wd/2 - pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), -2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2, wd/2 - pd, wd/2 - pd);
    
    //right (2)
    translate(wd/2, wd/2 - pd, -wd/2 + pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), 2 * (wd/2 - pd));
    sphere(20);
    translate(-wd/2, wd/2 - pd, -wd/2 + pd);
  } else if(value == 5) {
    //top (5)
    translate(0, -wd/2);
    sphere(20);
    translate(wd/2 - pd, 0, -wd/2 + pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, wd/2, -wd/2 + pd);
    translate(wd/2 - pd, -wd/2, wd/2 - pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, -2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, wd/2, wd/2 - pd);
    
    //bottom (2)
    translate(wd/2 - pd, wd/2, -wd/2 + pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, -wd/2, -wd/2 + pd);
    
    //front (3)
    translate(0, 0, wd/2);
    sphere(20);
    translate(wd/2 - pd, -wd/2 + pd, 0);
    sphere(20);
    translate(2 * (-wd/2 + pd), 2 * (wd/2 - pd), 0);
    sphere(20);
    translate(wd/2 - pd, -wd/2 + pd, -wd/2);
    
    //back (4)
    translate(wd/2 - pd, -wd/2 + pd, -wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, wd/2 - pd, wd/2);
    translate(wd/2 - pd, wd/2 - pd, -wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, -wd/2 + pd, wd/2);
    
    //left (1)
    translate(-wd/2, 0);
    sphere(20);
    translate(wd/2, 0);
    
    //right (6)
    translate(wd/2, wd/2 - pd);
    sphere(20);
    translate(0, 2* (-wd/2 + pd));
    sphere(20);
    translate(0, 2 * (wd/2 - pd), -wd/2 + pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), 2 * (wd/2 - pd));
    sphere(20);
    translate(-wd/2, wd/2 - pd, -wd/2 + pd);
    translate(wd/2, wd/2 - pd, wd/2 - pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), -2 * (wd/2 - pd));
    sphere(20);
    translate(-wd/2, wd/2 - pd, wd/2 - pd);
  } else {
    //top (6)
    translate(wd/2 - pd, -wd/2);
    sphere(20);
    translate(2* (-wd/2 + pd), 0);
    sphere(20);
    translate(2 * (wd/2 - pd), 0, -wd/2 + pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, +wd/2, -wd/2 + pd);
    translate(wd/2 - pd, -wd/2, wd/2 - pd);
    sphere(20);
    translate(2 * (-wd/2 + pd), 0, -2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2 - pd, wd/2, wd/2 - pd);
    
    //bottom (1)
    translate(0, wd/2);
    sphere(20);
    translate(0, -wd/2);
    
    //front (4)
    translate(wd/2 - pd, -wd/2 + pd, wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, wd/2 - pd, -wd/2);
    translate(wd/2 - pd, wd/2 - pd, wd/2);
    sphere(20);
    translate(-wd/2, 0, 0);
    sphere(20);
    translate(pd, -wd/2 + pd, -wd/2);
    
    //back (3)
    translate(0, 0, -wd/2);
    sphere(20);
    translate(wd/2 - pd, -wd/2 + pd, 0);
    sphere(20);
    translate(2 * (-wd/2 + pd), 2 * (wd/2 - pd), 0);
    sphere(20);
    translate(wd/2 - pd, -wd/2 + pd, wd/2);
    
    //left (2)
    translate(-wd/2, wd/2 - pd, -wd/2 + pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), 2 * (wd/2 - pd));
    sphere(20);
    translate(wd/2, wd/2 - pd, -wd/2 + pd);
    
    //right (5)
    translate(wd/2, 0, 0);
    sphere(20);
    translate(0, wd/2 - pd, -wd/2 + pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), 2 * (wd/2 - pd));
    sphere(20);
    translate(-wd/2, wd/2 - pd, -wd/2 + pd);
    translate(wd/2, wd/2 - pd, wd/2 - pd);
    sphere(20);
    translate(0, 2 * (-wd/2 + pd), -2 * (wd/2 - pd));
    sphere(20);
    translate(-wd/2, wd/2 - pd, wd/2 - pd);
  }
}
