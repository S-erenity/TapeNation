// =====================================================================
//  EnemyClass.pde
//  Extends Entity. Wanders randomly, chases player within aggro range.
// =====================================================================

class Enemy extends Entity {

  final float WANDER_SPEED = 1.0;
  final float CHASE_SPEED  = 2.2;
  final float AGGRO_RANGE  = 150;

  float wanderAngle;
  int   wanderChangeTime = 0;
  int   wanderInterval   = 1500;

  boolean aggroed = false;

  Enemy(float startX, float startY, int bx, int by, int bw, int bh) {
    super(startX, startY, 14, bx, by, bw, bh);
    wanderAngle = random(TWO_PI);
  }

  // ── Update (satisfies abstract contract from Entity) ───────────────
  // Overloaded: main loop calls update(Player) for AI logic
  void update() { /* unused — GameManager calls update(Player) */ }

  void update(Player p) {
    float d = dist(x, y, p.x, p.y);
    aggroed = (d <= AGGRO_RANGE);

    if (aggroed) {
      float dx  = p.x - x;
      float dy  = p.y - y;
      float mag = sqrt(dx * dx + dy * dy);
      x += (dx / mag) * CHASE_SPEED;
      y += (dy / mag) * CHASE_SPEED;
    } else {
      // Wander: change direction periodically
      if (millis() - wanderChangeTime > wanderInterval) {
        wanderAngle      = random(TWO_PI);
        wanderChangeTime = millis();
      }
      x += cos(wanderAngle) * WANDER_SPEED;
      y += sin(wanderAngle) * WANDER_SPEED;

      // Bounce off walls
      if (x - radius < bx || x + radius > bx + bw) {
        wanderAngle = PI - wanderAngle;
        clampToBounds();
      }
      if (y - radius < by || y + radius > by + bh) {
        wanderAngle = -wanderAngle;
        clampToBounds();
      }
    }
  }

  // ── Display (satisfies Drawable interface) ─────────────────────────
  void display() { /* unused — GameManager calls display(Player) */ }

  void display(Player p) {
    // Aggro range ring when idle
    if (!aggroed) {
      noFill();
      stroke(255, 60, 60, 55);
      strokeWeight(1);
      ellipse(x, y, AGGRO_RANGE * 2, AGGRO_RANGE * 2);
    }

    // Chase glow
    if (aggroed) {
      noStroke();
      fill(255, 0, 0, 50);
      ellipse(x, y, (radius + 12) * 2, (radius + 12) * 2);
    }

    // Body
    stroke(180, 0, 0);
    strokeWeight(2);
    fill(aggroed ? color(255, 40, 40) : color(200, 60, 60));
    ellipse(x, y, radius * 2, radius * 2);

    // Eye always faces player
    float angle = atan2(p.y - y, p.x - x);
    fill(255);
    noStroke();
    ellipse(x + cos(angle) * (radius * 0.45),
            y + sin(angle) * (radius * 0.45), 5, 5);
  }

  // Uses inherited overlaps() from Entity for hit detection
  boolean hits(Player p) {
    return overlaps(p);
  }
}
