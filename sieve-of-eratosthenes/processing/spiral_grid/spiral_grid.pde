// Five is being obliterated by three

int square_size = 30;
int number_of_squares = 10;
int canvas_size = ( square_size*number_of_squares ) + square_size;
int number_of_rows = ( canvas_size - square_size ) / ( 2 * square_size );
boolean[] primes = new boolean[ number_of_rows*number_of_rows ];
PVector position = new PVector( square_size, square_size );
String direction = "right";
int current_factor = 3;
int current_straight_length = 1;
int current_straight_distance_traveled = 1;
boolean increment_current_straight_length = false;
int distance_traveled = 1;
boolean flash = true;
int frame_rate = 10;

void setup() {
  size( canvas_size, canvas_size );
  frameRate( frame_rate );
  background( 0 );
  fill( 0, 255, 0 );
  initialize_primes();
  populate_primes();
  paint_initial_primes();
  reset_position();
  increment_position();
}

void draw() {
  if ( flash ) {
    fill( 0, 255, 255 );
    set_next_non_prime();
  } else {
    fill( 0 );
  }
  flash = !flash;
  paint_sieve();
}

void initialize_primes() {
  for ( int i = 1; i < primes.length; i++ ) {
    primes[ i ] = true;
  }
}

void populate_primes() {
  for ( int i = 2; i < sqrt( primes.length ); i++ ) {
    if ( primes[ i ] ) {
      for ( int j = i*i; j < primes.length; j += i ) {
        primes[ j ] = false;
      }
    }
  }
}

void paint_initial_primes() {
  for ( int i = 1; i <= number_of_rows*number_of_rows; i++ ) {
    rect( position.x, position.y, square_size, square_size );
    if ( i % number_of_rows == 0 ) {
      position.set( square_size, position.y + square_size*2 );
    } else {
      position.set( position.x + square_size*2, position.y );
    }
  }
  position.set( square_size, square_size );
}

void set_next_non_prime() {
  if ( distance_traveled + current_factor > number_of_rows*number_of_rows ) {
    reset_position();
    current_factor++;
    if ( current_factor > number_of_rows*number_of_rows ) {
      frameRate( 0 );
    }
    distance_traveled = 1;
    current_straight_distance_traveled = 1;
    current_straight_length = 1;
    reduce_frame_rate();
  }
  for ( int i = 0; i < current_factor; i++ ) {
    increment_position();
  }
}

void reset_position() {
  position = new PVector(
    ( canvas_size / 2 ) - ( square_size / 2 ),
    ( canvas_size / 2 ) - ( square_size / 2 )
  );
}

void increment_position() {
  boolean change_direction = direction_change_needed();
  if ( direction == "right" ) {
    position.set( position.x + square_size*2, position.y );
    if ( change_direction ) {
      direction = "up";
    }
  } else if ( direction == "up" ) {
    position.set( position.x, position.y - square_size*2 );
    if ( change_direction ) {
      direction = "left";
    }
  } else if ( direction == "left" ) {
    position.set( position.x - square_size*2, position.y );
    if ( change_direction ) {
      direction = "down";
    }
  } else if ( direction == "down" ) {
    position.set( position.x, position.y + square_size*2 );
    if ( change_direction ) {
      direction = "right";
    }
  }
  current_straight_distance_traveled++;
  distance_traveled++;
}

boolean direction_change_needed()
{
  boolean change_direction = false;
  if ( current_straight_length == current_straight_distance_traveled ) {
    change_direction = true;
    if ( increment_current_straight_length ) {
      current_straight_length++;
    }
    increment_current_straight_length = !increment_current_straight_length;
    current_straight_distance_traveled = 0;
  }
  return change_direction;
}

void paint_sieve()
{
  rect( position.x, position.y, square_size, square_size );
  fill( 0 );
  text( distance_traveled, position.x + square_size/2, position.y + square_size/2 );
}

void reduce_frame_rate()
{
  if ( frame_rate > 10 ) {
    frame_rate -= 10;
    frameRate( frame_rate );
  }
}
