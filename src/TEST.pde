GameMap map;
Player player;

boolean gameStarted = false;

void setup() {
  size(800, 600);
  map = new GameMap();
  player = new Player(width/2, height/2, 40);
}

void draw() {

  if (!gameStarted) {
    drawStartScreen();
  } else {
    runGame();
  }
}

/* ================= START SCREEN ================= */

void drawStartScreen() {
  background(20);

  fill(255);
  textAlign(CENTER, CENTER);

  textSize(48);
  text("TapeQuest", width/2, height/2 - 50);

  textSize(20);
  text("Press ENTER to Start", width/2, height/2 + 20);
}

void keyPressed() {
  if (!gameStarted && keyCode == ENTER) {
    gameStarted = true;
  }
}

/* ================= GAME LOOP ================= */

void runGame() {
  map.render();
  player.update();
  player.render();
}

/* ================= GAME MAP ================= */

class GameMap {
  void render() {
    background(#00C145);
  }
}

/* ================= PLAYER ================= */

class Player {

  float x, y;
  float size;

  Player(float startX, float startY, float s) {
    x = startX;
    y = startY;
    size = s;
  }

  void update() {
    float speed = 3;

    if (keyPressed) {
      if (key == 'w') y -= speed;
      if (key == 's') y += speed;
      if (key == 'a') x -= speed;
      if (key == 'd') x += speed;
    }
  }

  void render() {
    fill(50);
    ellipse(x, y, size, size);
  }
}
