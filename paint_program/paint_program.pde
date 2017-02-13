// Color Variables
color white = color(255, 255, 255);
color black = color(0, 0, 0);
color darkGray = color(50, 50, 50);
color red = color(192, 41, 66);
color orange = color(217, 91, 67);
color yellow = color(236, 208, 120);
color green = color(83, 119, 122);
color blue = color(10, 37, 46); 
color purple = color(84, 36, 55);
color guiGray = color(127, 127, 127);
color[] paletteColors = {red, orange, yellow, green, blue, purple, darkGray, white};

// Window/Canvas Variables
int windowWidth = 800;
int windowHeight = 600;

// GUI Variables
PFont titleFont;
int titleBarHeight = 50;
int paletteWidth = 76;
int brushGuiStart = 458;
int brushGuiEnd = windowHeight - 10;
int brushGuiCenter = brushGuiStart + (brushGuiEnd - brushGuiStart)/2;
int[] incBrushSizeBox = {19, brushGuiStart, 57, brushGuiStart+16};
int[] decBrushSizeBox = {19, brushGuiEnd-16, 57, brushGuiEnd};
int minBrushSize = 1;
int maxBrushSize = 74;

// Active Variables (these get updated with GUI)
color currColor = red;
int currBrushSize = 37;

void setup() {
  size(800, 600);
  background(white);
  titleFont = createFont("Courier", 32);
  frameRate(180);
}

void draw() {  
  println(frameRate);
  drawGUI();
  noStroke();
  
  if (mousePressed) {    
    fill(currColor, 127);
  } else {
    noFill();
  }
  
  /* Drawing Area */
  if (mouseX > paletteWidth && mouseY > titleBarHeight) {
    ellipse(mouseX, mouseY, currBrushSize, currBrushSize);
  }
}

void drawGUI() {
  drawTitleBar();
  drawPalette();
}

void drawTitleBar() {
  fill(white);
  stroke(black);
  rect(0, 0, windowWidth, titleBarHeight);
  fill(darkGray);
  textFont(titleFont);
  text("StuffDraw", 10, 40);
  textSize(10);
  text("v.1.0.0", 200, 40);
}

void drawPalette() {
  fill(guiGray);  
  rect(0, titleBarHeight, paletteWidth, windowHeight);
  noStroke();
  
  
  /* Colors */
  int dotYPos = titleBarHeight + 32;
  for(int i = 0; i < paletteColors.length; i++) {
     fill(paletteColors[i]);
     ellipse(paletteWidth/2, dotYPos, 40, 40);
     dotYPos += 47;
  }
  
  /* Brush Size */
  fill(darkGray);
  triangle(paletteWidth/2, brushGuiStart, 19, brushGuiStart+16, 57, brushGuiStart+16);
  triangle(paletteWidth/2, brushGuiEnd, 19, brushGuiEnd-16, 57, brushGuiEnd-16);
  
  fill(currColor);
  ellipse(paletteWidth/2, brushGuiCenter, currBrushSize, currBrushSize);
}

void mousePressed() {
  /* Select a Color from Palette */
  if (mouseX < paletteWidth && mouseY < 458 && mousePressed) {
    if (get(mouseX, mouseY) != guiGray) {
      currColor = get(mouseX, mouseY);
    }
  }
  
  /* Increase Brush Size */
  if (mouseX > incBrushSizeBox[0] &&
      mouseX < incBrushSizeBox[2] &&
      mouseY > incBrushSizeBox[1] &&
      mouseY < incBrushSizeBox[3] &&
      currBrushSize < maxBrushSize-10) {
        currBrushSize += 2;
      }
  /* Decrease Brush Size */
  if (mouseX > decBrushSizeBox[0] &&
    mouseX < decBrushSizeBox[2] &&
    mouseY > decBrushSizeBox[1] &&
    mouseY < decBrushSizeBox[3] &&
    currBrushSize > minBrushSize) {
      currBrushSize -= 2;
    }

}
