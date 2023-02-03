float minSize = 10;

public void setup() {
  size(1000, 1000);
  background(0);
}

public void draw() {
  if(mousePressed && mouseX > 0 && mouseX <= 1000) {
    minSize = (float)Math.sqrt(1000-mouseX)*2; 
  }
  fill(255);
  stroke(200);
  sierpinski(50, 950, 900, minSize);
}

public void sierpinski(float x, float y, float len, float minLim) {
  if(len < minLim) {
    triangle(x, y, x + len, y, x + len/2, y - len);
  } else {
    triangle(x, y, x + len, y, x + len/2, y - len);
    coloring(len);
    sierpinski(x, y, len/2, minLim);
    coloring(len);
    sierpinski(x + len/4, y - len/2, len/2, minLim);
    coloring(len);
    sierpinski(x + len/2, y, len/2, minLim);
  }
}

public void coloring(float len) {
  float opacity = 1/len*5000;
  if(opacity > 90) {
    opacity = 90;
  }
  noStroke();
  fill(0,  opacity);
}
