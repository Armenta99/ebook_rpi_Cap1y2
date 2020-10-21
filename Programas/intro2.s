/* Armenta Peña José Francisco */
/* No. Control: 18212146*/
/* Programa en ARM32: Práctica #2 del libro de practicas de RPI, cambiar variables.*/
/* Materia: Lenguajez de Interfaz*/


.data
var1 : .byte 0b00110010
.align
var2 : .byte 0b11000000
.align

.text
.global main
main : ldr r1, = var1 /* r1 <- & var1 */
		ldrsb r1, [ r1 ] /* r1 <- *r1 */
		ldr r2, = var2 /* r2 <- & var2 */
		ldrsb r2, [ r2 ] /* r2 <- *r2 */
		add r0, r1, r2 /* r0 <- r1 + r2 */
		bx lr