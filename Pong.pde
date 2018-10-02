Ball ball;
Bat player1, player2;


void setup(){
  size(1400, 800, FX2D);//fullScreen(FX2D);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
  ball = new Ball(random(1)<0.5?random(-QUARTER_PI, QUARTER_PI):random(PI-QUARTER_PI, PI+QUARTER_PI));
  player1 = new Bat(true, 'W', 'S');
  player2 = new Bat(false, 'I', 'K');
  for(int i = 0; i < controls.length; ++i){
    keys.put(controls[i], false);
  }
  textSize(width*0.05);
  textAlign(CENTER, CENTER);
}

void draw(){
  background(30);
  ball.run();
  player1.run();
  player2.run();
  
  ball.display();
  player1.display();
  player2.display();
  
  text(player1.score+"   :   "+player2.score, width/2, height*0.1);
}

void reset(int winner){
  ball = new Ball(winner==1?random(-QUARTER_PI, QUARTER_PI):random(PI-QUARTER_PI, PI+QUARTER_PI));
  player1.pos.y = height/2;
  player2.pos.y = height/2;
  if(winner == 0){
    player2.score++;
  }else{
    player1.score++;
  }
}
