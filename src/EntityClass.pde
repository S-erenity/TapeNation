// =====================================================================
//  EntityClass.pde
//  Abstract base class for all game entities (Player, Enemy).
//  Provides shared fields and enforces display() / update() contracts.
// =====================================================================

interface Drawable {
  void display();
}

abstract class Entity implements Drawable {

  float x, y;
  float radius;
  int   bx, by, bw, bh;   // map boundary

  Entity(float x, float y, float radius, int bx, int by, int bw, int bh) {
    this.x      = x;
    this.y      = y;
    this.radius = radius;
    this.bx     = bx;
    this.by     = by;
    this.bw     = bw;
    this.bh     = bh;
  }

  // Subclasses must implement their own update logic
  abstract void update();

  // Shared collision helper
  boolean overlaps(Entity other) {
    return dist(x, y, other.x, other.y) < radius + other.radius;
  }

  // Clamp position inside the map walls
  void clampToBounds() {
    x = constrain(x, bx + radius, bx + bw - radius);
    y = constrain(y, by + radius, by + bh - radius);
  }
}
