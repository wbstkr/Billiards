public class Ball {
    public PVector acceleration;
    public PVector velocity;
    public PVector position;
    public float radius; // will be tied to mass
    
    public Ball(float x, float y) {
        this.acceleration = PVector.random2D().mult(random(10));
        this.velocity = new PVector(0, 0);
        this.position = new PVector(x, y);
        this.radius = 50;
    }
    
    public float floatMod(float dividend, float divisor) {
        return (float) (dividend - Math.floor(dividend / divisor) * divisor);
    }
    
    public void run() {
        collide();
        update();
        wrap();
        render();
    }
    
    public void collide() {
        
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