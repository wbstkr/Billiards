public PoolTable table;

public void setup() {
    size(1200, 720);
    table = new PoolTable(20);
}

public void draw() {
    background(0);
    table.run();
}