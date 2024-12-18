// Vincent Nguyuen | Grade App | 13/09/2024
float grade;
void setup() {
  size(400, 150);
  background(200);
}

void draw() {
  background(200);
  textSize(35);
  textAlign(CENTER);
  fill(0);
  text("Grade by Vincent Nguyen", width/2, 40);
  line(0, 100, width, 100);
  for (int i=0; i<width; i+=50) {
    line(i, 90, i, 105);
    textSize(8);
    text((float)i/width*4, i, 90);
  }
  ellipse(mouseX, 100, 5, 5);
  textSize(16);
  text((float)mouseX/width*4, mouseX, 120);
  assignGrade((float)mouseX/width*4);
}

void assignGrade(float tgrade) {
  if (tgrade >= 3.51) {
    println("Assign letter grade A.", width/2, 125);
  } else if (tgrade >= 3.0) {
    text("Assign letter grade A-.", width/2, 125);
  } else if (tgrade >= 2.84) {
    text("Assign letter grade B+.", width/2, 125);
  } else if (tgrade >= 2.67) {
    text("Assign letter grade B.", width/2, 125);
  } else if (tgrade >= 2.50) {
    text("Assign letter grade B-.", width/2, 125);
  } else if (tgrade >= 2.34) {
    text("Assign letter grade C+.", width/2, 125);
  } else if (tgrade >= 2.17) {
    text("Assign letter grade C.", width/2, 125);
  } else if (tgrade >= 2.00) {
    text("Assign letter grade C-.", width/2, 125);
  } else if (tgrade >= 1.66) {
    text("Assign letter grade D+.", width/2, 125);
  } else if (tgrade >= 1.33) {
    text("Assign letter grade D.", width/2, 125);
  } else if (tgrade >= 1.00) {
    text("Assign letter grade D-.", width/2, 125);
  } else {
    text("Assign letter grade F.", width/2, 125);
  }
}
