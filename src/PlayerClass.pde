

class Player extends Entity {

  final float SPEED = 3.5;

  boolean movingUp, movingDown, movingLeft, movingRight;

  int maxHP = 10;
  int hp    = 10;

  Player(float startX, float startY, int bx, int by, int bw, int bh) {
    super(startX, startY, 16, bx, by, bw, bh);
  }

  void update() {
    if (movingUp)    y -= SPEED;
    if (movingDown)  y += SPEED;
    if (movingLeft)  x -= SPEED;
    if (movingRight) x += SPEED;
    clampToBounds();
  }

  void display() {
    noStroke();
    fill(255, 255, 255, 40);
    ellipse(x, y, (radius + 10) * 2, (radius + 10) * 2);

    stroke(220);
    strokeWeight(2);
    fill(255);
    ellipse(x, y, radius * 2, radius * 2);

    float dx = 0, dy = 0;
    if (movingRight) dx =  1;
    if (movingLeft)  dx = -1;
    if (movingDown)  dy =  1;
    if (movingUp)    dy = -1;
    if (dx != 0 || dy != 0) {
      float mag = sqrt(dx * dx + dy * dy);
      fill(50);
      noStroke();
      ellipse(x + (dx / mag) * (radius * 0.55),
              y + (dy / mag) * (radius * 0.55), 5, 5);
    }
  }

  void onKeyPressed(int k) {
    if (k == UP    || k == 'W' || k == 'w') movingUp    = true;
    if (k == DOWN  || k == 'S' || k == 's') movingDown  = true;
    if (k == LEFT  || k == 'A' || k == 'a') movingLeft  = true;
    if (k == RIGHT || k == 'D' || k == 'd') movingRight = true;
  }

  void onKeyReleased(int k) {
    if (k == UP    || k == 'W' || k == 'w') movingUp    = false;
    if (k == DOWN  || k == 'S' || k == 's') movingDown  = false;
    if (k == LEFT  || k == 'A' || k == 'a') movingLeft  = false;
    if (k == RIGHT || k == 'D' || k == 'd') movingRight = false;
  }

  void takeDamage(int amount) {
    hp = max(0, hp - amount);
  }

  boolean isDead() {
    return hp <= 0;
  }
}
