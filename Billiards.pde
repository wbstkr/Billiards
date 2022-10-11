public PoolTable table;
public boolean pmousePressed;
public Ball selectedBall;

public void setup() {
    size(1200, 720);
    table = new PoolTable(0);
    pmousePressed = false;
    selectedBall = null;
}

public void draw() {
    background(0);
    table.run();
    
    if (mousePressed && !pmousePressed) {
        for (Ball ball : table.getBalls()) {
            if (ball.touching(new PVector(mouseX, mouseY))) {
                selectedBall = ball;
            }
        }
        if (selectedBall == null) {
            table.add(mouseX, mouseY, new PVector(0, 0));
        }
    } else if (mousePressed && pmousePressed) {
        if (selectedBall != null) {
            stroke(0xFFFFFFFF);
            line(selectedBall.position.x, selectedBall.position.y, mouseX, mouseY);
        }
    } else {
        if (selectedBall != null) {
            selectedBall.addForce(PVector.sub(selectedBall.position, new PVector(mouseX, mouseY)).mult(0.05));
            selectedBall = null;
        }
    }
    pmousePressed = mousePressed;
}