class Powerup {
  int x, y, diam, speed;
  char type;
  PImage r2, r3;

  Powerup() {
    x = int(random(width));
    y = -200;
    diam = int(random(20, 90));
    speed = int(random(1, 5));
    r2 = loadImage("ball.png");
    r3 = loadImage("ammo.png");
    int rand = int(random(2));
    if (rand ==0) {
      type = 'h';
    } else if (rand == 1) {
      type = 'a';
    }
  }

  void display() {

    if (type == 'h') {
      fill(0, 222, 0);
      r2.resize(diam, diam);
      image(r2, x, y);
    } else if (type == 'a') {
      fill(255, 0, 0);
      r3.resize(diam, diam);
      image(r3, x, y);
    }
    //ellipse(x, y, diam, diam);
  }

  void move() {
    y = y + speed;
  }

  boolean reachedBottom() {
    if (y > height + 200) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Spaceship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
