class Bat {
  PVector pos, size, vel;
  char up, down;
  int score = 0;

  Bat(boolean left, char up, char down) {
    this.up = up;
    this.down = down;
    pos = new PVector(width*0.1*(left?1:9), height*0.5);
    size = new PVector(width*0.015, height*0.15);
    vel = new PVector(4, 4);
  }

  void run() {
    
    if (keys.get(up)) {
      pos.y -= vel.y;
      vel.y += 6/vel.y;
    } else {
      vel.y = 5;
    }
    if (keys.get(down)) {
      pos.y += vel.x;
      vel.x += 6/vel.x;
    } else {
      vel.x = 5;
    }
    
    pos.y = constrain(pos.y, 0, height);
    if ( ( (ball.pos.x+ball.SIZE/2 > pos.x-size.x/2 && ball.pos.x-ball.SIZE/2 < pos.x+size.x/2) || (ball.pos.x-ball.SIZE/2 < pos.x+size.x/2 && ball.pos.x+ball.SIZE/2 > pos.x-size.x/2) ) && 
      (ball.pos.y > pos.y-size.y/2 && ball.pos.y < pos.y+size.y/2) ) {
      if (pos.x > width/2) {
        ball.vel = PVector.mult(PVector.fromAngle(PI), ball.vel.mag()*1.2);
        ball.vel.rotate(map(pos.y-ball.pos.y, -size.y, size.y, -THIRD_PI, THIRD_PI) );
      } else {
        ball.vel = PVector.mult(PVector.fromAngle(0), ball.vel.mag()*1.2);
        ball.vel.rotate( map(pos.y-ball.pos.y, -size.y, size.y, THIRD_PI, -THIRD_PI) );
      }
      ball.vel.y += vel.y*0.9;
    }
  }

  void display() {
    rect(pos.x, pos.y, size.x, size.y);
  }
}
