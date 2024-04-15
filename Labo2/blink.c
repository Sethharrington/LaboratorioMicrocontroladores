#include <avr/io.h>
#include <util/delay.h>
/* Pines
B1: Verde vehicular
B2: Amarillo vehicular
B3: Rojo Vehicular
B4: Verde peatonal
B5: Rojo peatonal
B6: Entrada del boton
*/
int main(void)
{
  DDRB = 0x3F; // Configuracion del puerto

  unsigned int state = 1;
  unsigned int count = 0;
  unsigned int boton = 0;
  //  Parpadear
  while (1)
  {
    _delay_ms(10); // Delay 1 segundo
    count++;
    DDRA = boton;
    DDRD = count;
    if (PINB > 0x3F)
    {
      boton = 1;
      DDRA = boton;
    }
    if (boton == 1 && count > 100)
      state = 2;

    switch (state)
    {
    // Paso Vehicular
    case 1:
      PORTB = 0x22; // Se encienden B1: verde vehicular y B5: rojo peatonal
      break;

    // Se presiona un boton
    case 2:
      for (count = 0; count < 3; count++)
      {
        PORTB = 0x20; // NoB1: apaga verde vehicular y B5: rojo peatonal
        _delay_ms(10000);
        PORTB = 0x22; // Se encienden B1: verde vehicular y B5: rojo peatonal
        _delay_ms(10000);
      }
      PORTB = 0x24; // Se encienden B2: amarillo vehicular y B5: rojo peatonal
      _delay_ms(30000);
      PORTB = 0x28; // B3: rojo vehicular y B5: rojo peatonal
      _delay_ms(2000);
      state = 3; // Paso peatonal
      break;

    // Paso peatonal
    case 3:
      PORTB = 0x18; // Se encienden B3: rojo vehicular y B4: verde peatonal
      _delay_ms(100000);
      for (count = 0; count < 3; count++)
      {
        PORTB = 0x08; // B3: rojo vehicular y NoB4: verde peatonal
        _delay_ms(10000);
        PORTB = 0x18; // B3: rojo vehicular y B4: verde peatonal
        _delay_ms(10000);
      }
      PORTB = 0x28; // B3: rojo vehicular y B5: rojo peatonal
      _delay_ms(10000);
      state = 1;

      // Reiniciar valores
      boton = 0;
      count = 0;
      break;

    default:        // Paso vehicular
      PORTB = 0x21; // Se encienden B1: verde vehicular y B5: rojo peatonal
      break;
    }
    _delay_ms(10000);
  }
}
