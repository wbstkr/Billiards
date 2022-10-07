public class Ball {
  float diameter, radius;
  PVector vel, acc, pos;
  
  public Ball( float x, float y ) {
    diameter = 50f;
    radius = diameter / 2f;
    vel = new PVector( 0, 0 );
    acc = new PVector( 0, 0 );
    pos = new PVector( x, y );
  }
  
  public void setVel( PVector a ) {
    vel = a;
  }
  
  public void updatePos() {
    vel.add( acc );
    pos.add( vel );
    vel.mult( 0.99 );
  }
  
  public void updateCol( ArrayList<Ball> a ) {
    for( Ball b : a ) {
      if( this != b ) {
        if( PVector.dist( this.pos, b.pos ) < this.radius + b.radius ) {
          PVector offset = PVector.sub( this.pos, b.pos );
          this.pos = b.pos.copy().add( offset.copy().setMag( this.radius + b.radius ) );
          
          b.vel = offset.copy().rotate( PI ).setMag( ( (float) Math.sin( offset.heading() ) * this.vel.mag() ) + b.vel.mag() );
          
          this.vel.rotate( ( 2 * PI ) - offset.heading() ).setMag( (float) Math.cos( offset.heading() ) * this.vel.mag() );
        }
      }
    }
  }
  
  public void wrap() {
    if( pos.x < ( 0f - radius ) ) {
      pos.x = width + radius;
    }
    if( pos.y < ( 0f - radius ) ) {
      pos.y = height + radius;
    }
    if( pos.x > ( width + radius ) ) {
      pos.x = 0f - radius;
    }
    if( pos.y > ( height + radius ) ) {
      pos.y = 0f - radius;
    }
  }
  
  public void render() {
    noStroke();
    fill( 128 );
    circle( pos.x, pos.y, diameter );
  }
}
