void setup() {
  size(1400, 400);
  background(127);
}

void draw() {
  background(127);
  drawRef();
  histEvent(150, 200, "1941", "Antanasoff and his student Berry made the first digital electronic Computer\n this computer is able to store information. It was made inm the U.S",true);
  histEvent(300, 300, "1945", "It was made by two professors at the University of Pennsylvania \n it was the first automatic general purpose",false);
  histEvent(450, 200, "Test 3", "detail 3",true);
  histEvent(600, 300, "Test 3", "detail 3",false);
  histEvent(750, 200, "Test 3", "detail 3",true);
  histEvent(900, 300, "Test 3", "detail 3",false);
  histEvent(1050,200, "Test 3", "detail 3",true);
  histEvent(1200, 300, "Test 3", "detail 3",false);
}

void drawRef() {
  //timelineformat
  strokeWeight(3);
  stroke(0);
  line(100, 250, 1300, 250);
  textSize(18);
  text("1940", 80, 270);
  text("1960", 1300, 270);

  //Title text
  textSize(35);
  textAlign(CENTER);
  fill(50);
  text("Historic Computer Systems", width/2, 60);
  textSize(30);
  text("by Vincent Nguyen", width/2, 85);
}

void histEvent(int x, int y, String val, String detail, boolean top) {
  if (top) {
    line(x, y, x+20, y+50);
  } else {
    line(x, y, x+20, y-50);
  }
  fill(200);
  rectMode(CENTER);
  rect(x, y, 80, 20);
  fill(0);
  textSize(12);
  text(val, x, y+5);

  if (mouseX>x-40 && mouseX<x+40 && mouseY>y-10 && mouseY<y+10) {
    text(detail, width/2, 350);
  }
}
