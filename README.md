![](imagen/portadatcnm.png)

#    Tecnológico Nacional de México
#   Instituto Tecnológico de Tijuana
#        Subdirección Académica

# Departamento de Sistemas y Computación
# Ingeniería en Sistemas Computacionales
# Lenguajes de interfaz 

# Practica Bloque: 2
# Objetivo: Lectura y ejercicios de ARM32 del ebook OpenSource


# Nombre: Armenta Peña José Francisco 
# No. Control: 18212146
   

# Profesor:
# MC. René Solis Reyes
# Semestre sep - ene 2020


  
![](https://images.cooltext.com/5473986.png)
<a href="http://cooltext.com" target="_top"><img src="https://cooltext.com/images/ct_pixel.gif" width="80" height="15" alt="Cool Text: Logo and Graphics Generator" border="0" /></a>

# Lectura previa

## Características generales de la arquitectura ARM

ARM es una arquitectura RISC (Reduced Instruction Set Computer=Ordenador con Conjunto Reducido de Instrucciones) de 32 bits, salvo la versión del core ARMv8- A que es mixta 32/64 bits (bus de 32 bits con registros de 64 bits). Se trata de una arquitectura licenciable, quiere decir que la empresa desarrolladora ARM Holdings diseña la arquitectura, pero son otras compañías las que fabrican y venden los chips, llevándose ARM Holdings un pequeño porcentaje por la licencia.  El chip en concreto que lleva la Raspberry Pi es el BCM2835, se trata de un SoC (System on a Chip=Sistema en un sólo chip) que contiene además de la CPU otros elementos como un núcleo GPU (hardware acelerado OpenGL ES/OpenVG/Open EGL/OpenMAX y decodificación H.264 por hardware) y un núcleo DSP (Digital signal processing=Procesamiento digital de señales) que es un procesador más pequeño y simple que el principal, pero especializado en el procesado y representación de señales analógicas.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/1.PNG)

### Registros 
La arquitectura ARMv6 presenta un conjunto de 17 registros (16 principales más uno de estado) de 32 bits cada uno. 
**Registros Generales.** Su función es el almacenamiento temporal de datos. Son los 13 registros que van R0 hasta R12.
**Registros Especiales.** Son los últimos 3 registros principales: R13, R14 y R15. Como son de propósito especial, tienen nombres alternativos.
- SP/R13. Stack Pointer ó Puntero de Pila. Sirve como puntero para almacenar variables locales y registros en llamadas a funciones.
- LR/R14. Link Register ó Registro de Enlace. Almacena la dirección de retorno cuando una instrucción BL ó BLX ejecuta una llamada a una rutina.
- PC/R15. Program Counter ó Contador de Programa. Es un registro que indica la posición donde está el procesador en su secuencia de instrucciones. Se incrementa de 4 en 4 cada vez que se ejecuta una instrucción, salvo que ésta provoque un salto.

**Registro CPSR.** Almacena las banderas condicionales y los bits de control. Los bits de control definen la habilitación de interrupciones normales (I), interrupciones rápidas (F), modo Thumb 1 (T) y el modo de operación de la CPU.

Desde el Modo Usuario sólo podemos acceder a las banderas condicionales, que contienen información sobre el estado de la última operación realizada por la ALU. A diferencia de otras arquitecturas en ARMv6 podemos elegir si queremos que una instrucción actualice o no las banderas condicionales, poniendo una “s” detrás del nemotécnico 2 . Existen 4 banderas y son las siguientes:
- **N.** Se activa cuando el resultado es negativo.
- **Z.** Se activa cuando el resultado es cero o una comparación es cierta. 
- **C.** Indica acarreo en las operaciones aritméticas.
- **V.** Desbordamiento aritmético.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/2.PNG)


### Esquema de almacenamiento
Cuando escribimos un dato en una posición de memoria, dependiendo de si es byte, half word o word,... se ubica en memoria según el esquema de la figura siguiente. La dirección de un dato es la de su byte menos significativo.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/3.PNG)

## El lenguaje ensamblador

El ensamblador es un lenguaje de bajo nivel que permite un control directo de la CPU y todos los elementos asociados. Cada línea de un programa ensamblador consta de una instrucción del procesador y la posición que ocupan los datos de esa instrucción. 
El ensamblador presenta una serie de ventajas e inconvenientes con respecto a otros lenguajes de más alto nivel. Al ser un lenguaje de bajo nivel, presenta como principal característica la flexibilidad y la posibilidad de acceso directo a nivel de registro. En contrapartida, programar en ensamblador es laborioso puesto que los programas contienen un número elevado de líneas y la corrección y depuración de éstos se hace difícil.

## El entorno 

Los pasos habituales para hacer un programa (en cualquier lenguaje) son los siguientes: lo primero es escribir el programa en el lenguaje fuente mediante un editor de programas. El resultado es un fichero en un lenguaje que puede entender el usuario, pero no la máquina. Para traducirlo a lenguaje máquina hay que utilizar un programa traductor. Éste genera un fichero con la traducción de dicho programa, pero todavía no es un programa ejecutable. Un fichero ejecutable contiene el programa traducido más una serie de códigos que debe tener todo programa que vaya a ser ejecutado en una máquina determinada. Entre estos códigos comunes se encuentran las librerías del lenguaje. El encargado de unir el código del programa con el código de estas librerías es un programa llamado montador (linker) que genera el programa ejecutable 

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/4.PNG)

Durante el proceso de creación de un programa se suelen producir errores. Hay
dos tipos de errores: los sintácticos o detectables en tiempo de traducción y los
errores semánticos o detectables en tiempo de ejecución. Los errores sintácticos son,
por ejemplo, escribir mal una instrucción o hacer una operación entre dos tipos
de datos incompatibles. Estos errores son detectados por el traductor y se deben
solucionar para poder generar un ejecutable


## Configuración del entorno para realizar las prácticas en casa

Esta parte ya había sido elaborada previamente con un video tutorial elaborado por el MC. René Solis Reyes, donde nos proporcionaba los sitios de descarga y los pasos a realizar para emulador QEMU, que nos proporciona una máquina virtual de 32 bits para trabajar.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/QEMU.PNG)


## Aspecto de un programa en ensamblador 
Con el siguiente código nos apoyaremos para visualizar el contenido que tiene un programa.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/5.PNG)

La principal característica de un módulo fuente en ensamblador es que existe una clara separación entre las instrucciones y los datos. La estructura más general de un módulo fuente es: 
- **Sección de datos.** Viene identificada por la directiva .data. En esta zona se definen todas las variables que utiliza el programa con el objeto de reservar memoria para contener los valores asignados. 
- **Sección de código.** Se indica con la directiva .text, y sólo puede contener código o datos no modificables. Como todas las instrucciones son de 32 bits no hay que tener especial cuidado en que estén alineadas. Si tratamos de escribir en esta zona el ensamblador nos mostrará un mensaje de error.

Un módulo fuente, como el del ejemplo, está formado por instrucciones, datos, símbolos y directivas. Las instrucciones se aplican en tiempo de ejecución mientras que las directivas se aplican en tiempo de ensamblado.

### Instrucciones
Son representaciones nemotécnicas del juego de instrucciones del procesador. 
- **Instrucciones de transferencia de datos:** Mueven información entre registros y posiciones de memoria. En la arquitectura ARMv6 no existen puertos ya que la E/S está mapeada en memoria. Pertenecen a este grupo las siguientes instrucciones: mov, ldr, str, ldm, stm, push, pop. 
- **Instrucciones aritméticas:** Realizan operaciones aritméticas sobre números binarios o BCD. Son instrucciones de este grupo add, cmp, adc, sbc, mul. 
- **Instrucciones de manejo de bit:** Realizan operaciones de desplazamiento, rotación y lógicas sobre registros o posiciones de memoria. Están en este grupo las instrucciones: and, tst, eor, orr, LSL, LSR, ASR, ROR, RRX. 
- **Instrucciones de transferencia de control:** Se utilizan para controlar el flujo de ejecución de las instrucciones del programa. Tales como b, bl, bx, blx y sus variantes condicionales. 

### Dato 
Es una entidad que aporta un valor numérico, que puede expresarse en distintas bases o incluso a través de una cadena. Los datos se pueden representar de distintas maneras. Para representar números tenemos 4 bases. La más habitual es en su forma decimal, la cual no lleva ningún delimitador especial. Luego tenemos otra muy útil que es la representación hexadecimal, que indicaremos con el prefijo 0x. Otra interesante es la binaria, que emplea el prefijo 0b antes del número en binario. La cuarta y última base es la octal, que usaremos en raras ocasiones y se especifica con el prefijo 0. Sí, un cero a la izquierda de cualquier valor convierte en octal dicho número.

### Símbolos 
Son representaciones abstractas que el ensamblador maneja en tiempo de ensamblado pero que en el código binario resultante tendrá un valor numérico concreto. Hay tres tipos de símbolos: las etiquetas, las macros y las constantes simbólicas.
Como las etiquetas se pueden ubicar tanto en la sección de datos como en la de código, la versatilidad que nos dan las mismas es enorme. En la zona de datos, las etiquetas pueden representar variables, constantes y cadenas. En la zona de código podemos usar etiquetas de salto, funciones y punteros en la zona de datos. Las macros y las constantes simbólicas son símbolos cuyo ámbito pertenece al preprocesador, a diferencia de las etiquetas que pertenecen al ensamblador.
 
### Directivas
Sirven para indicar ciertas cosas al ensamblador, como delimitar secciones, insertar datos, crear macros, constantes simbólicas, etcétera.
- **Directivas de asignación:** Se utilizan para dar valores a las constantes o reservar posiciones de memoria para las variables (con un posible valor inicial). .byte, .hword, .word, .ascii, .asciz, .zero y .space son directivas que indican al compilador que reserve memoria para las variables del tipo indicado. 
- **Directivas de operando:** Se aplican a los datos en tiempo de compilación. En general, incluyen las operaciones lógicas &, |, ∼, aritméticas +, -, *, /, % y de desplazamiento <, >, <<, >>
- **Directivas de Macros:** Una macro es un conjunto de sentencias en ensamblador (directivas e instrucciones) que pueden aparecer varias veces repetidas en un programa con algunas modificaciones (opcionales). Por ejemplo, supongamos que a lo largo de un programa realizamos varias veces la operación n 2+1 donde n y el resultado son registros. Para ello se implementa una directiva de Macros.

### Desplazamiento lógico
Los desplazamientos lógicos desplazan los bit del registro fuente introduciendo ceros (uno o más de uno). El último bit que sale del registro fuente se almacena en el flag C

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/rotdeslog.PNG)

### Desplazamiento aritmético
El desplazamiento aritmético hace lo mismo, pero manteniendo el signo.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/rotdesari.PNG)


### Rotación
Las instrucciones de rotación también se desplazan, pero el bit que sale del valor se realimenta. No existe ninguna instrucción para rotar hacia la izquierda ROL, ya que puede simularse con la de rotación a la derecha ROR que sí existe. En estas instrucciones el bit desplazado fuera es el mismo que el que entra, además de dejar una copia en el flag C.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/insrot.PNG)


### Rotación con Carry
Las instrucciones de rotación con el carry funcionan de manera similar, pero el bit que entra es el que había en el flag C y el que sale va a parar al flag C. Estas instrucciones sólo rotan un bit, al contrario que las anteriores que podían rotar/desplazar varios. La rotación con carry a la derecha es RRX, no existe la contrapartida RLX porque se puede sintetizar con otra instrucción ya existente adcs. 

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/insrotcar.PNG)


## Ensamblar y linkar un programa


Para ensamblar un programa lo que debemos de hacer es tener el programa (en este caso es el intro1.s) y una vez accesado el directorio donde se encuentra el programa lo que debemos de hacer es en la terminal escribir el comando:

```bash
as -o intro1.o intro1.s
```

Lo que hará esto es crear un archivo temporal que nos permitirá linkear nuestro programa. Una vez teniendo el archivo “.o” debemos de escribir el siguiente comando para linkear:

```bash
gcc -o intro1 intro1.o
```
Y con esto tendremos nuestro programa completo.

Una vez teniendo nuestro programa escribiremos:

```bash
gdb intro1
```
Y con esto accederemos al depurador de nuestro programa donde podremos realizar acciones como pedir información de nuestro programa, consultar ayuda con el depurador y modificar el valor de los registros.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/intro1.PNG)
**Linkear el programa para depurarlo**

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/intro1gdb.PNG)

**Depurador**


### Instrucciones de multiplicación
Las instrucciones de multiplicación admiten muchas posibilidades, debido a que
es una operación en la cual el resultado tiene el doble de bits que cada operando.
En la siguiente tabla vemos las 5 instrucciones de multiplicación que existen.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/mult.PNG) 




![](https://images.cooltext.com/5473987.png)

<a href="http://cooltext.com" target="_top"><img src="https://cooltext.com/images/ct_pixel.gif" width="80" height="15" alt="Cool Text: Logo and Graphics Generator" border="0" /></a>

# Lectura previa
## Modos de direccionamiento del ARM 

En la arquitectura ARM los accesos a memoria se hacen mediante instrucciones específicas ldr y str (luego veremos las variantes ldm, stm y las preprocesadas push y pop). El resto de instrucciones toman operandos desde registros o valores inmediatos, sin excepciones. En este caso la arquitectura nos fuerza a que trabajemos de un modo determinado: primero cargamos los registros desde memoria, luego procesamos el valor de estos registros con el amplio abanico de instrucciones del ARM, para finalmente volcar los resultados desde registros a memoria. Existen otras arquitecturas como la Intel x86, donde las instrucciones de procesado nos permiten leer o escribir directamente de memoria. 

## Tipos de datos 
**Tipos de datos básicos.** En la siguiente tabla se recogen los diferentes tipos de datos básicos que podrán aparecer en los ejemplos, así como su tamaño y rango de representación. 

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/TipDatos.PNG)

La mayoría de las instrucciones (salvo multiplicación) hacen la misma operación tanto si se trata de un número natural como si es entero en complemento a dos. Nosotros decidiremos el tipo mediante las constantes que pongamos o según los flags que interpretemos del resultado de la operación.


**Punteros.** Un puntero siempre ocupa 32 bits y contiene una dirección de memoria. En ensamblador no tienen tanta utilidad como en C, ya que disponemos de registros de sobra y es más costoso acceder a las variables a través de los punteros que directamente. En este ejemplo acceder a la dirección de var1 nos cuesta 2 ldrs a través del puntero, mientras que directamente se puede hacer con uno sólo.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/Puntero.PNG)

**Vectores.** Todos los elementos de un vector se almacenan en un único bloque de memoria a partir de una dirección determinada. Los diferentes elementos se almacenan en posiciones consecutivas, de manera que el elemento i está entre los i-1 e i+1. Los vectores están definidos siempre a partir de la posición 0.

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/VectorMemoria.PNG)

**Matrices bidimensionales.** Una matriz bidimensional de N×M elementos se almacena en un único bloque de memoria. Interpretaremos una matriz de N×M como una matriz con N filas de M elementos cada una. Si cada elemento de la matriz ocupa B bytes, la matriz ocupará un bloque de M ×N ×B bytes (ver figura 2.2(a)).
Dentro de este bloque, los elementos se almacenan por filas. Primero se guardan todos los elementos de la fila 0, después todos los de la fila 1, etc. como se ve en la figura 2.2(b).

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/FormatoMatriz.PNG)

## Instrucciones de salto
Las instrucciones de salto pueden producir saltos incondicionales (b y bx) o saltos condicionales. Cuando saltamos a una etiqueta empleamos b, mientras que si queremos saltar a un registro lo hacemos con bx. La variante de registro bx la solemos usar como instrucción de retorno de subrutina, raramente tiene otros usos.

La lista completa de condiciones es ésta: 
- EQ (equal, igual). Cuando Z está activo (Z vale 1). 
- NEQ (not equal, igual). Cuando Z está inactivo (Z vale 0). 
- MI (minus, negativo). Cuando N está activo (N vale 1). 
- PL (plus, positivo o cero). Cuando N está inactivo (N vale 0). 
- CS/HS (carry set/higher or same, carry activo/mayor o igual). Cuando C está activo (C vale 1). 
- CC/LO (carry clear/lower, carry inactivo/menor). Cuando C está inactivo (C vale 0).
- VS (overlow set, desbordamiento activo). Cuando V está activo (V vale 1).
- VC (overlow clear, desbordamiento inactivo). Cuando V está inactivo (V vale 0).
- GT (greater than, mayor en complemento a dos). Cuando Z está inactivo y N=V (Z vale 0, N vale V).
- LT (lower than, menor en complemento a dos). Cuando N!=V (N vale not V).
- GE (greater or equal, mayor o igual en complemento a dos). Cuando N=V (N vale V).
- LE (lower or equal, menor o igual en complemento a dos). Cuando Z está activo y N!=V (Z vale 1, N vale not V).
- HI (higher, mayor). Cuando C está activo y Z inactivo (C vale 1, Z vale 0).
- LS (lower or same, menor o igual). Cuando C está inactivo ó Z activo (C vale 0 ó Z vale 1).


## Estructuras de control de alto nivel (ciclos y condiciones)
En este punto veremos cómo se traducen a ensamblador las estructuras de control de alto nivel que definen un bucle (for, while, . . . ), así como las condicionales (if-else). Las estructuras for y while se pueden ejecutar un mínimo de 0 iteraciones (si la primera vez no se cumple la condición). 
Ciclos en C

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/cicloC.PNG)


Ciclos en ensamblador

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/cicloS.PNG)


Condiciones en C

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/ifC.PNG)


Condiciones en ensamblador

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/ifS.PNG)


### Suma de vectores

![](https://github.com/Armenta99/ebook_rpi_cap1y2/blob/main/Imagenes/SumVectores.PNG)

 
 
 [Fuente consultada](https://riuma.uma.es/xmlui/bitstream/handle/10630/10214/LibroDePracticas.pdf?sequence=1&isAllowed=y)



