/* Armenta Peña José Francisco */
/* Fecha: 21/Oct/2020 */
/* No. Control: 18212146*/
/* Programa en C: Práctica #11 del libro de practicas de RPI, suma de vectores*/
/* Materia: Lenguajez de Interfaz*/




# include <stdio.h>
void main ( void ){
int i , suma;
int vector [5]= {128 , 32 , 100 , -30 , 124};
for ( suma = i = 0; i <5; i++ ){
suma += vector [i ];
}
printf (" La suma es %d \n" , suma );
}
