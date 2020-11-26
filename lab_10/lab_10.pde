import java.util.ArrayList;

ArrayList<Integer> x = new ArrayList<Integer>();
ArrayList<Integer> y = new ArrayList<Integer>();

boolean flag = false;
int d = 50;
void setup() {
  size(1000, 700);
  background(255);
}
void draw() {
  if (flag) {
  for (int i = 0; i < x.size(); i++) {
      fill(255/(i + 1), 0, 0);
      text(255/(i + 1), x.get(i)-50, y.get(i)-50);
      ellipse(x.get(i),y.get(i),d,d);
    }
  }

}

void mousePressed() {
  if (mousePressed == true) {
      int click_x = mouseX;
      int click_y = mouseY;
      
      x.add(click_x); //<>//
      y.add(click_y);
      flag = false;    
      
  }
}

void keyPressed() {
  if (keyPressed == true) {
  flag = true;
  }
}
