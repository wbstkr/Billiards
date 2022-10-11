public class PoolTable {
    private ArrayList<Ball> balls;
    
    public PoolTable(int initCount) {
        this.balls = new ArrayList();
        while(initCount > 0) {
            this.balls.add(new Ball(random(width), random(height), PVector.random2D().mult(random(10))));
            initCount--;
        }
    }

    public ArrayList<Ball> getBalls() {return this.balls;}

    public void add(float x, float y, PVector initAcc) {
        this.balls.add(new Ball(x, y, initAcc));
    }
    
    public void run() {
        for (Ball ball : this.balls) {
            ball.run(this.balls);
        }
    }
}