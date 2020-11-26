// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example

// Basic example of falling rectangles

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// A reference to our box2d world
Box2DProcessing box2d;
PImage pic;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;

void setup() {
  size(640,360);
  smooth();
  pic = loadImage("https://cdn2.iconfinder.com/data/icons/shopping-elements-6/64/03-Shopping_Busket-512.png");
  pic.resize(50, 50);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -20);

  // Create ArrayLists	
  boxes = new ArrayList<Box>();
  boundaries = new ArrayList<Boundary>();

  // Add a bunch of fixed boundaries
  boundaries.add(new Boundary(0,360,400,10));
  boxes.add(new Box(10, 10));
}
float box_y = random(50, 310); 
float box_x = 590;
boolean check = true;
int accept = 0;
int miss = 0;

void draw() {
  background(255);
  image(pic, box_x, box_y);
  // We must always step through time!
  box2d.step();
  
  if (mousePressed) {
    for (Box b: boxes) {
     if (mouseX <=320) { 
       b.attract(mouseX,mouseY);
       }
    }
  }

  // Display all the boundaries
  for (Boundary wall: boundaries) {
    wall.display();
  }

  // Display all the boxes
  for (Box b: boxes) {
    b.display();
  }

  // Boxes that leave the screen, we delete them
  // (note they have to be deleted from both the box2d world and our list
  for (int i = boxes.size()-1; i >= 0; i--) {
    Box b = boxes.get(i);
    if (b.done()) {
      boxes.remove(i);
      boxes.add(new Box(10, 10));
      miss ++;
      box_y = random(50, 310); 
    }
    if (b.accept_done(box_x, box_y)) {
      boxes.remove(i);
      boxes.add(new Box(10, 10));
      accept ++;
      box_y = random(50, 310); 
    }
  }
  
  fill(0);
  text("Попаданий: " + accept,20,20);
  text("Промахов: " + miss,20,50);
}
