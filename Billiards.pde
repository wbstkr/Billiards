public PoolTable table;

public void setup() {
    size(1200, 720);
    table = new PoolTable(0);
}

public void draw() {
    background(0);
    table.run();
}

public void mousePressed() {
    table.add(mouseX, mouseY);
}