boolean[] doors = new boolean[ 100 ];
static int door_size = 30;
static int canvas_size = 630;
static int number_of_columns = 10;
int pass_counter = 0;
int door_counter = 0;
int door_x;
int door_y;

void setup() {
  populate_doors();
  size( canvas_size, canvas_size );
  frameRate(60);
  background( 0 );
}

void populate_doors() {
  for ( int i = 0; i < 100; i++ ) {
    doors[ i ] = false;
  }
}

void draw() {
  fill( 0, 20 );
  rect( 0, 0, canvas_size, canvas_size );
  toggle_door();
  draw_door();
  increment_door();
}

void toggle_door() {
  doors[ door_counter ] = !doors[ door_counter ];
}

void draw_door() {
  door_x = ( ( door_counter%number_of_columns ) * door_size*2 ) + door_size;
  door_y = ( floor( door_counter/number_of_columns ) * door_size*2 ) + door_size;
  
  
  if ( doors[ door_counter ] ) {
    fill( 0, 255, 0 );
    rect( door_x, door_y, door_size, door_size );
  } else {
    /* If you would like circles instead of squares
    fill( 0 );
    rect( door_x, door_y, door_size, door_size );
    fill ( 255 );
    fill( 0, 255, 100 );
    ellipse( door_x+(door_size/2), door_y+(door_size/2), door_size, door_size );
    */
    fill( 0, 255, 255 );
    rect( door_x, door_y, door_size, door_size );
  }
}

void increment_door() {
  door_counter += pass_counter + 1;
  if ( door_counter >= 100 ) {
    door_counter = pass_counter + 1;
    pass_counter++;
  }
  if ( pass_counter >= 100 ) {
    pass_counter = 0;
    door_counter = pass_counter;
  }
  frameRate(60 - (door_counter/2));
}
