void setup() {
size(1000, 700);
}

void draw(){
background(100, 50, 90);
line(0,700,mouseX, mouseY);
line(1000, 0,mouseX, mouseY);
line(0, 0,mouseX, mouseY);
line(1000, 700,mouseX, mouseY);
circle(mouseX, mouseY, 50);
}
