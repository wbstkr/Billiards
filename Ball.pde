public class Ball {
    private PVector acceleration;
    private PVector velocity;
    private PVector position;
    private float radius; // will be tied to mass
    
    public Ball(float x, float y) {
        this.acceleration = PVector.random2D().mult(random(10));
        this.velocity = new PVector(0, 0);
        this.position = new PVector(x, y);
        this.radius = random(30) + 20;
    }
    
    public float floatMod(float dividend, float divisor) {
        return(float)(dividend - Math.floor(dividend / divisor) * divisor);
    }
    
    public boolean touching(Ball ball) {
        return PVector.dist(this.position, ball.position) < this.radius + ball.radius;
    }
    
    public void run(ArrayList<Ball> balls) {
        collide(balls);
        update();
        wrap();
        render();
    }
    
    public void collide(ArrayList<Ball> balls) { // TODO: fina a way to simplify
        for (Ball ball : balls) {
            if (ball != this && touching(ball)) {
                PVector thisVel = this.velocity.copy();
                PVector thatVel = ball.velocity.copy();
                
                float thisMass = this.radius * 1;
                float thatMass = ball.radius * 1;
                
                this.velocity.x = ((thisMass * thisVel.x) + (thatMass * thatVel.x) + (thatMass * 0.99 * (thatVel.x - thisVel.x))) / (thisMass + thatMass);
                this.velocity.y = ((thisMass * thisVel.y) + (thatMass * thatVel.y) + (thatMass * 0.99 * (thatVel.y - thisVel.y))) / (thisMass + thatMass);
                
                ball.velocity.x = ((thisMass * thisVel.x) + (thatMass * thatVel.x) + (thisMass * 0.99 * (thisVel.x - thatVel.x))) / (thisMass + thatMass);
                ball.velocity.y = ((thisMass * thisVel.y) + (thatMass * thatVel.y) + (thisMass * 0.99 * (thisVel.y - thatVel.y))) / (thisMass + thatMass);
            }
        }
    }
    
    public void update() {
        this.velocity.add(this.acceleration);
        this.position.add(this.velocity);
        this.velocity.mult(.99);
        this.acceleration = new PVector(0, 0);
    }
    
    public void wrap() {
        this.position.x = floatMod(this.position.x + this.radius, width + 2 * this.radius) - this.radius;
        this.position.y = floatMod(this.position.y + this.radius, height + 2 * this.radius) - this.radius;
    }
    
    public void render() {
        noStroke();
        ellipseMode(RADIUS);
        fill(0x88FFFFFF);
        circle(this.position.x, this.position.y, this.radius);
    }
}