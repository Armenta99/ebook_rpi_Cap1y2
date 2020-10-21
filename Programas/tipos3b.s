/* Armenta Peña José Francisco */
/* No. Control: 18212146*/
/* Programa en ARM32: Práctica #10 del libro de practicas de RPI, ciclo con loop forzando el ensamblador*/
/* Materia: Lenguajez de Interfaz*/


.data
var1: .asciz " %d\ 012 "

.text
.global main
main : push { r4, lr }
		mov r1, # 0
		ldr r4, = var1
		mov r0, r4
		bl printf
		mov r0, r4
		mov r1, # 1
		bl printf
		mov r0, r4
		mov r1, # 2
		bl printf
		mov r0, r4
		mov r1, # 3
		bl printf
		mov r0, r4
		mov r1, # 4
		pop { r4, lr }
		b printf
