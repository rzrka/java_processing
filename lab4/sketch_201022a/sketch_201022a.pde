int circle_d = 200; 
float x, y;
int success = 0;
int miss = 0;
int speed = 1;
void setup() {
  size(800, 600);
  background(0);
  x = 400;
  y = 300;
}

void draw() {
  circle_d-=speed;
  background(0);
  text(success, 10, 10);
  text(miss, 30, 10);
  
  
  if (circle_d <= 10) {
    circle_d = 200;
    x = random(800);
    y = random(600);
    miss++;
  }

  ellipse(x, y, circle_d, circle_d);
}

void mousePressed() {
  if (mousePressed == true) {
      int click_x = mouseX;
      int click_y = mouseY;
      if ((Math.pow((click_x - x), 2) + (Math.pow((click_y - y), 2)) <= Math.pow(circle_d, 2))) {
        circle_d = 200;
        x = random(800);
        y = random(600);
        success ++;
        speed ++;
      }else{
        circle_d = 200;
        x = random(800);
        y = random(600);
        miss ++;
      }
      println(click_x);
      println(click_y);
  }
}  
