Die[] dice = new Die[9];

void setup() {
  size(160, 200);
  for (int i = 0; i < dice.length; i++) {
    int row = i / 3;
    int col = i % 3;
    dice[i] = new Die(col * 50 + 10, row * 50 + 10);
  }
  noLoop();
}

void mouseClicked() {
  redraw();
}

void draw() {
  background(0);
  int tot = 0;
  for (int i = 0; i < dice.length; i++) {
    dice[i].roll();
    dice[i].draw();
    tot += dice[i].val;
  }
  fill(200);
  textAlign(CENTER);
  textSize(20);
  text("Total: " + tot, width / 2, 180);
}

class Die {
  int x, y, val;
  short[] sides = {0, 1, 2, 3, 6, 7, 14};
  public Die(int xPos, int yPos) {
    x = xPos;
    y = yPos;
    roll();
  }
  
  private void roll() {
    val = (int)(Math.random() * 6) + 1;
  }
  
  public void draw() {
    fill(255);
    rect(x, y, 40, 40, 10);
    fill(0);
    short n = sides[val];
    if ((n & 1) > 0) {
      ellipse(x + 20, y + 20, 5, 5);
    }
    if (((n >> 1) & 1) > 0) {
      ellipse(x + 10, y + 10, 5, 5);
      ellipse(x + 30, y + 30, 5, 5);
    }
    if (((n >> 2) & 1) > 0) {
      ellipse(x + 30, y + 10, 5, 5);
      ellipse(x + 10, y + 30, 5, 5);
    }
    if (((n >> 3) & 1) > 0) {
      ellipse(x + 10, y + 20, 5, 5);
      ellipse(x + 30, y + 20, 5, 5);
    }
  }
}
