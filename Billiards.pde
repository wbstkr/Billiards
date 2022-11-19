import wbstkr.util.*;

public Controller input;
public PoolTable table;
public Ball selectedBall;

public void setup() {
    size(1200, 720);
    input = new Controller(this);
    table = new PoolTable(0);
    selectedBall = null;
}

public void draw() {
    background(0);
    table.run();
    input.update();
    input.left.run(
        () -> {
            table.getBalls().forEach(ball -> {
                if (ball.touching(input.mouse)) selectedBall = ball;
            });
            if (selectedBall == null) {
                table.add(input.mouse.x, input.mouse.y, new PVector(0, 0));
            }
        },
        () -> {
            if (selectedBall != null) {
                stroke(0xFFFFFFFF);
                line(selectedBall.position.x, selectedBall.position.y, input.mouse.x, input.mouse.y);
            }
        },
        () -> {
            if (selectedBall != null) {
                selectedBall.addForce(PVector.sub(selectedBall.position, input.mouse).mult(0.05));
                selectedBall = null;
            }
        }
    );
}