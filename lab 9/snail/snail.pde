PImage img_gameover, img_snail;
import java.util.*;
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();
HashSet<String> res = new HashSet<String>();
int w = 15, h = 15;
int bs = 40; 
int dir = 2;
int [] dx = {0,0,1,-1}, dy = {1,-1,0,0};  
String gameover = "process";
int x_core, y_core;
void setup(){
  size(600,600);
  x.add(0); 
  y.add(0); 
  img_gameover = loadImage("gameover.png");
  img_snail = loadImage("snail.png");
}

void draw() {
  background(255);

  for(int i = 1; i < x.size(); i++) {
    fill(0,255,0); 
    rect(x.get(i)*bs, y.get(i)*bs, bs, bs);
    image(img_snail, x.get(0)*bs, y.get(0)*bs, 40, 40);
  }
  // движение
  if (gameover == "process") {
    if (frameCount%10==0) {
      if (x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) gameover = "lose";
      x_core = x.get(0) + dx[dir];
      y_core = y.get(0) + dy[dir]; //<>//
      x.add(0,x_core);
      y.add(0,y_core);
      res.add(Integer.toString(x_core) + Integer.toString(y_core));
      if (res.size() >= 219) gameover = "won";
    } //<>//
  }if (gameover == "lose") {
    image(img_gameover, 0, 0, 600, 600);
  }if (gameover == "won"){
    fill(0);
    textSize(30);
    text("WON", width/2, height/2);
  }
}

void keyPressed() {
 int newdir = key=='ы' ? 0 : (key == 'ц' ? 1 : (key == 'в' ? 2 : (key == 'ф' ? 3 : -1)));
 dir = newdir;
}
