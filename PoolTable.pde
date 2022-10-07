public class PoolTable {
    public ArrayList<Ball> balls;
    
    public PoolTable(int initCount) {
        this.balls = new ArrayList();
        while(initCount > 0) {
            this.balls.add(new Ball(random(width), random(height)));
            initCount--;
        }
    }
    
    public void run() {
        for (Ball ball : this.balls) {
            ball.run();
        }
    }
}