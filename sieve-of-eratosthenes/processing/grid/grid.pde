int square_size = 30;
int canvas_size = ( square_size*20 ) + square_size;
int number_of_rows = ( canvas_size - square_size ) / ( 2 * square_size );
boolean[] primes = new boolean[ number_of_rows*number_of_rows ];
PVector position = new PVector( square_size, square_size );
int current_factor = 2;
int current_multiple = 4;
boolean flash = true;

void setup() {
  size( canvas_size, canvas_size );
  frameRate( 40 );
  background( 0 );
  fill( 0, 255, 0 );
  paint_all();
  fill( 0 );
}

void draw() {
  if ( flash ) {
    fill( 0 );
  } else {
    fill( 0, 255, 255 );
    set_next_non_prime();
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

void paint_all() {
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

void paint_sieve()
{
  position.x = ( ( ( current_multiple-1 ) %number_of_rows ) * square_size*2 ) + square_size;
  position.y = ( floor( ( current_multiple-1 ) / number_of_rows ) * square_size*2 ) + square_size;
  rect( position.x, position.y, square_size, square_size );
}

void set_next_non_prime()
{
  if ( current_factor <= number_of_rows*number_of_rows ) {
    current_multiple += current_factor;
  }
  if ( current_multiple > number_of_rows*number_of_rows ) {
    current_factor++;
    current_multiple = current_factor*current_factor;
  }
}
