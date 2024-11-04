// Vincent Nguyen |Calc Porject | 2 Oct. 2024
//Button b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20, b21, b22, b23, b24, b25;
Button[] buttons = new Button[25];
String dVal = "0";
String op;
float l, r, result;
boolean left;

void setup() {
  size(210, 250);
  background(50);
  left = true;
  op = " ";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  buttons[0] = new Button(35, 220, 30, 30, "0", true);
  buttons[1] = new Button(35, 185, 30, 30, "1", true);
  buttons[2] = new Button(70, 185, 30, 30, "2", true);
  buttons[3] = new Button(105, 185, 30, 30, "3", true);
  buttons[4] = new Button(35, 150, 30, 30, "4", true);
  buttons[5] = new Button(70, 150, 30, 30, "5", true);
  buttons[6] = new Button(105, 150, 30, 30, "6", true);
  buttons[7] = new Button(35, 115, 30, 30, "7", true);
  buttons[8] = new Button(70, 115, 30, 30, "8", true);
  buttons[9] = new Button(105, 115, 30, 30, "9", true);
  buttons[10] = new Button(140, 185, 30, 30, "+", false);
  buttons[11] = new Button(140, 150, 30, 30, "×", false);
  buttons[12] = new Button(175, 150, 30, 30, "÷", false);
  buttons[13] = new Button(175, 185, 30, 30, "-", false);
  buttons[14] = new Button(105, 80, 30, 30, "^", false);
  buttons[15] = new Button(140, 80, 30, 30, "±", false);
  buttons[16] = new Button(35, 80, 30, 30, "Sin", false);
  buttons[17] = new Button(70, 80, 30, 30, "Cos", false);
  buttons[18] = new Button(140, 220, 30, 30, "%", false);
  buttons[19] = new Button(175, 220, 30, 30, "=", false);
  buttons[20] = new Button(175, 115, 30, 30, "C", false);
  buttons[21] = new Button(180, 80, 30, 40, "ON", false);
  buttons[22] = new Button(140, 115, 30, 30, "Del", false);
  buttons[23] = new Button(70, 220, 30, 30, ".", false);
  buttons[24] = new Button(105, 220, 30, 30, "π", false);
}

void draw() {
  background(50);
  println("Left:" + l + " Op:" + op +"Right:"  + r + " Result:" + result);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  fill(222);
  rect(width/2, 25, 190, 30);
  fill(0);
  if (dVal.length()<13) {
    textSize(11);
  } else if (dVal.length() < 17) {
    textSize(15);
  }
  textAlign(RIGHT);
  text(dVal, width-25, 25);
}

void mousePressed() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && dVal.length() < 20 && left) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        l = float(dVal);
      } else {
        dVal += buttons[i].val;
        l = float(dVal);
      }
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      if (dVal.equals("0")) {
        dVal = buttons[i].val;
        r = float(dVal);
      } else {
        dVal += buttons[i].val;
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("+")) {
      dVal = "0";
      op = "+";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("-")) {
      dVal = "0";
      op = "-";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("×")) {
      dVal = "0";
      op = "×";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("÷")) {
      dVal = "0";
      op = "÷";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("^")) {
      dVal = "0";
      op = "^";
      left = false;
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals(".")) {
      if (!dVal.contains(".")) {
        dVal += buttons[i].val;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        dVal = str(PI);
        l = PI;
      } else {
        dVal = str(PI);
        r = PI;
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("Cos")) {
      if (left) {
        dVal = str(cos(l));
        l = float(dVal);
      } else {
        dVal = str(cos(r));
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("Sin")) {
      if (left) {
        dVal = str(sin(l));
        l = int(float(dVal));
      } else {
        dVal = str(sin(r));
        r = int(float(dVal));
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("C")) {
      left = true;
      op = " ";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      dVal = "0";
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      if (left) {
        l = l * 0.01;
        dVal = str(l);
      } else {
        r = r * 0.01;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("Del") && dVal.length() > 0) {
      if (left) {
        dVal = dVal.substring(0, dVal.length() - 1);
        l = float(dVal);
      } else {
        dVal = dVal.substring(0, dVal.length() - 1);
        r = float(dVal);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left) {
        l = l * -1;
        dVal = str(l);
      } else {
        r = r * -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("=")) {
      performCalc();
    }





    //if (buttons[i].on == true) {
    //if (buttons[i].val.equals("C")) {
    // dVal = "0.0";
    //op = ' ';
    //l = 0.0;
    //r = 0.0;
    // result = 0.0;
    // } else if (dVal.equals("0.0")) {
    // dVal = buttons[i].val;
    // } else {
    //if (left == true) {
    // dVal += buttons[i].val;
    //l = float(dVal);
    // }
    // }
    //}
  }
}

void performCalc() {
  if (op == "+") {
    result = l + r;
  } else if (op == "-") {
    result = l - r;
  } else if (op == "×") {
    result = l * r;
  } else if (op == "÷") {
    result = l / r;
  } else if (op == "^") {
    result = pow(l, r);
  }
  dVal = str(result);
}

void handleEvent(String keyVal, boolean isNum) {
  // handle numbers
  if (left && dVal.length() < 20 && isNum ) {
    if (dVal.equals("0")) {
      dVal += keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  }
}


void keyPressed() {
  println("key:" + key);
  println("keycode;" + keyCode);
  if (key == 1) {
    handleEvent ("0", true);
  } else if (key == 1 || keyCode == 96 || keyCode == 49) {
    handleEvent ("1", true);
  } else if (key == 2 || keyCode == 97 || keyCode == 50) {
    handleEvent ("2", true);
  } else if (key == 3 || keyCode == 98 || keyCode == 51) {
    handleEvent ("3", true);
  } else if (key == 4 || keyCode == 99 || keyCode == 52) {
    handleEvent ("4", true);
  } else if (key == 5 || keyCode == 100 || keyCode == 53) {
    handleEvent ("5", true);
  } else if (key == 6 || keyCode == 101 || keyCode == 54) {
    handleEvent ("6", true);
  } else if (key == 7 || keyCode == 102 || keyCode == 55) {
    handleEvent ("7", true);
  } else if (key == 8 || keyCode == 103 || keyCode == 56) {
    handleEvent ("8", true);
  } else if (key == 9 || keyCode == 104 || keyCode == 57) {
    handleEvent ("9", true);
  } else if (key == '=' || keyCode == 61) {
    handleEvent ("=", true);
  } else if (key == '.' || keyCode == 46) {
    handleEvent (".", true);
  }
}
