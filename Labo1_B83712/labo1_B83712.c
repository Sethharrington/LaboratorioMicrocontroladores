#include <pic14/pic12f683.h>
#include <math.h>
// CONFIG
typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDTE_OFF & _MCLRE_OFF);

// FUNCIONES
void delay(unsigned int tiempo);

// MAIN
void main(void)
{
	// Declaracion de variables
	unsigned int result = 1;
	TRISIO = 0b00001000;	 // Poner todos los pines como salidas
	GPIO = 0x00;			 // Poner pines en bajo
	ANSEL = 0b0001000;		 // Habilitar el GP3 como entrada analogica
	unsigned int time = 150; // Tiempo de espera

	// Loop forever
	while (1)
	{
		// Se encarga del numero aleatorio
		// mientras el ususario no hay presionado el boton
		// El loop se encarga de incrementar el resultado
		// En el momento que el usuario presiona el boton
		// se obtiene un numero aleatorio.
		(result >= 6) ? result = 1 : result++;

		// Se activa cuando se presiona el boton (GP3 recibe una senal analogica en alto)
		if (GP3)
		{
			// for (result = 1; result < 7; result++)
			// {

			// Enciende cada uno de los leds respectivamente segun el numero
			switch (result)
			{
			case 1:
				GPIO = 0x01;
				break;
			case 2:
				GPIO = 0x02;
				break;
			case 3:
				GPIO = 0x05;
				break;
			case 4:
				GPIO = 0x06;
				break;
			case 5:
				GPIO = 0x07;
				break;
			case 6:
				GPIO = 0x16;
				break;

			// Enciende error
			default:
				GPIO = 0x31;
			}
			// Tiempo de espera encendido
			delay(time);
			GPIO = 0x00;
			//}
		}
	}
}

void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for (i = 0; i < tiempo; i++)
		for (j = 0; j < 1275; j++)
			;
}
