GameMap map;
Player player;

void setup() {
  size(800, 600);
  map = new GameMap();
  player = new Player(width/2, height/2, 40);
}

void draw() {
  map.render();
  player.update();
  player.render();
}

//gamemap

class GameMap {

  void render() {
    background(#00C145);
    noStroke();
  }
}

//player

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
