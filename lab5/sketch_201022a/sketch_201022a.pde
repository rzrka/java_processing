int j = 0;
int i = 0;

void setup() {
  size(800, 600);
  background(0);
  frameRate(30);
}

void draw() {
  i++;
  if (i > 0 && i < 150) { //<>//
    fill(0,255,0); //<>//
    ellipse(400, 150, 50,50);
  }else{ //<>//
    fill(0,100,0);
    ellipse(400, 150, 50,50);
  }    
  if ( i > 90 && i < 150) {
    if (i % 15 == 0) {
      j++;
    }
    
    if (j % 2 == 0) {
      fill (0,255,0);
      ellipse(400, 150, 50,50);
    } else {
      fill(0,100,0);
      ellipse(400, 150, 50,50);
    }
  }
  if (i > 150 && i < 300) {
      fill(255,255,0);
      ellipse(400, 250, 50,50); //<>//
  }else{
    fill(100,100,0);
    ellipse(400, 250, 50,50);
  }
  if ( i > 210 && i < 300) {
    if (i % 15 == 0) {
      j++;
    }
    
    if (j % 2 == 0) {
      fill (255,255,0);
      ellipse(400, 250, 50,50);
    } else {
      fill(100,100,0);
      ellipse(400, 250, 50,50);
    }
  }
  if (i > 300 && i < 450) {
      fill(255,0,0);
      ellipse(400, 350, 50,50);
  }else{
    fill(100,0,0);
    ellipse(400, 350, 50,50);
  }
  if ( i > 390 && i < 450) {
    if (i % 15 == 0) {
      j++;
    }
    
    if (j % 2 == 0) {
      fill (255,0,0);
      ellipse(400, 350, 50,50);
    } else {
      fill(100,0,0);
      ellipse(400, 350, 50,50);
    }
  }
  if (i == 449){
        i = 0;
      }
}
