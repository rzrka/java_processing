int i = 500; //<>//
int d = 20;
boolean check = true;
void setup(){
  frameRate(60);
  size(1000,700);
}

void draw(){
  background(0);
  circle(i, 350, d);
  if (i == 1000-d/2){
    check = false;
  } else if(i==0+d/2){
    check = true;
  }
  if (check == true){
    i++;
  }else{
    i--;
  }
}
