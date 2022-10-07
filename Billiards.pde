ArrayList<Ball> balls;

public void setup() {
    size(1200, 720);
    
    balls = new ArrayList<Ball>();
    
    for (int i = 0; i < 10; i++) {
        balls.add(new Ball((float)(Math.random() * width),(float)(Math.random() * height)));
    }
    for (Ball b : balls) {
        b.setVel(PVector.random2D().mult((float)(Math.random() * 10f)));
    }
}

public void draw() {
    background(0);
    for (Ball b : balls) {
        b.updatePos();
        b.updateCol(balls);
        b.wrap();
        b.render();
    }
    
    Ball mainBall = balls.get(0);
    
    if (mainBall.vel.mag() < 0.5) {
        stroke(255);
        line(mouseX, mouseY, mainBall.pos.x, balls.get(0).pos.y);
        
        if (mousePressed) {
            mainBall.vel = PVector.sub(mainBall.pos, new PVector(mouseX, mouseY)).mult(0.05);
        }
    }
}