Player player;
int scale = 20;

PVector food;

void setup() {
  size(600, 600);
  player = new Player();
  frameRate(10);
  pickLocation();
}

void pickLocation() {
  int cols = width/scale;
  int rows = height/scale;
  food = new PVector(floor(random(cols)), floor(random(rows)));
  food.mult(scale);
}

void mousePressed() {
  player.total++;
}

void draw() {
  background(51);

  if (player.eat(food)) {
    pickLocation();
  }
  player.death();
  player.update();
  player.show();

  fill(255, 0, 100);
  rect(food.x, food.y, scale, scale);
}

void keyPressed() {
  if (keyCode == UP) {
    player.dir(0, -1);
  } else if (keyCode == DOWN) {
    player.dir(0, 1);
  } else if (keyCode == RIGHT) {
    player.dir(1, 0);
  } else if (keyCode == LEFT) {
    player.dir(-1, 0);
  }
}