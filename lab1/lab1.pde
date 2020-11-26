void setup() {
size(1000, 700);
}

void draw(){
float color1, color2, color3, x1, y1;
color1 = random(0,255);
color2 = random(0,255);
color3 = random(0,255);
x1 = random(0,1000);
y1 = random(0,700);
fill(color1, color2, color3);
circle(x1, y1, 50);

}
