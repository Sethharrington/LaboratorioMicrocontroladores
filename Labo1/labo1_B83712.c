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
	unsigned int result;
	TRISIO = 0b00001000; // Poner todos los pines como salidas
	GPIO = 0x00;		 // Poner pines en bajo
	ANSEL = 0b00001000;
	// TRISA = 0;

	unsigned int time = 120;

	// Loop forever
	while (1)
	{
		result = 4;
		if (GP3)
		{
			// for (result = 1; result < 7; result++)
			// {
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
				GPIO = 0x06; // GPIO = 0x0110
				break;

			case 5:
				GPIO = 0x07; // 0x0111
				break;

			case 6:
				GPIO = 0x16;
				break;
			default:
				GPIO = 0x04;
			}
			delay(time);
			GPIO = 0x00;
			delay(time);
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
