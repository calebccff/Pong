class Ball{
  PVector pos, vel;
  float speed = 7;
  final float SIZE = 20;
  
  Ball(float dir){
    pos = new PVector(width/2, height/2);
    resetBall(dir);
  }
  
  void resetBall(float dir){
    vel = PVector.mult(PVector.fromAngle(dir), speed);
  }
  
  void run(){
    if(pos.x != constrain(pos.x, SIZE/2, width-SIZE/2)){
      pos.x = constrain(pos.x, SIZE/2, width-SIZE/2);
      if(pos.x < width*0.5){
        reset(0);
      }else{
        reset(1);
      }
    }
    if(pos.y != constrain(pos.y, SIZE/2, height-SIZE/2)){
      pos.y = constrain(pos.y, SIZE/2, height-SIZE/2);
      vel.y = -vel.y;
    }
    pos.add(vel);
  }
  
  void display(){
    ellipse(pos.x, pos.y, SIZE, SIZE);
  }
}
