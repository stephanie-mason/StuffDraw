// Color Variables
color white = color(255, 255, 255);
color black = color(0, 0, 0);
color red = color(255, 0, 0);
color guiGray = color(100, 100, 100);

// Window/Canvas Variables
int windowWidth = 800;
int windowHeight = 600;

// GUI Variables
int titleBarHeight = 50;
PFont titleFont;

void setup() {
  size(800, 600);
  background(white);
  titleFont = createFont("Comic Sans MS", 32);  
}

color currColor = red;
void draw() {  
  drawGUI();
  
  
  if (mousePressed) {
    noStroke();
    fill(currColor);
  } else {
    noStroke();
    noFill();
  }
  ellipse(mouseX, mouseY, 20, 20);
}

void drawGUI() {
  fill(guiGray);
  drawTitleBar();
  rect(0, titleBarHeight, 100, windowHeight);
}

void drawTitleBar() {
  stroke(black);
  line(0, titleBarHeight, windowWidth, titleBarHeight);  
  fill(red);
  textFont(titleFont);
  text("StuffDraw", 10, 40);
}