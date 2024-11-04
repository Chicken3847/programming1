// Vincent Nguyen | September 18 2024 | EtchASketch
int x, y;
PImage etch;

void setup() {
  size(500,500);
  background(127);
  //etch = loadImage("Etch.png");
  x = width/2;
  y = height/2;
}

void draw() {
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      x = x -1;
    } else if (key == 'd' || key == 'D') {
      x = x + 1;
    } else if (key == 'w' || key == 'W') {
      y = y - 1;
    } else if (key == 's' || key == 'S') {
      y = y + 1;
    } else if (key == 'c' || key == 'C') {
      background(127);
    }
  }
  strokeWeight(2);
  //image(etch, 0, 0);
}

void mousePressed() {
  //saveFrame("line-######.png");
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      moveU(5);
    } else if (keyCode == DOWN) {
      moveD(10);
    } else if (keyCode == LEFT) {
      moveL(10);
    } else if (keyCode == RIGHT) {
      moveR(5);
    }
  }
}

void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x = x + rep;
}

void moveR(int l) {
  line(x, y, x+l, y);
  x = x + l;
}

void moveU(int l) {
  line(x, y, x, y-l);
  y = y - l;
}

void moveD(int l) {
  line(x, y, x, y+l);
  y = y + l;
}

void moveL(int l) {
  line(x, y, x-l, y);
  x = x - l;
}
