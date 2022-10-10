public class PoolTable {
    private ArrayList<Ball> balls;
    
    public PoolTable(int initCount) {
        this.balls = new ArrayList();
        while(initCount > 0) {
            this.balls.add(new Ball(random(width), random(height)));
            initCount--;
        }
    }

    public void add(float x, float y) {
        this.balls.add(new Ball(x, y));
    }
    
    public void run() {
        for (Ball ball : this.balls) {
            ball.run(this.balls);
        }
    }
}