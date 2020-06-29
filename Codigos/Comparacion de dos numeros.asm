.model small
.stack 100h 
.data

diferentes1 db 10,13,'Son diferentes','$'
iguales1 db 10,13,'Son iguales','$'

.code 

  pedirNumeros:
   mov ah,01     ;Pide primer numero
   int 21h 
  
   mov bl,al     ;Mueve el numero a 'bl' para tener el registro 'al' libre para el segundo numero
       
   mov ah,01     ;Pide nuevo numero
   int 21h 
                                                                   
   cmp bl,al     ;Compara el numero en 'bl' con el nuevo numero en 'al'
   
   ja diferentes ;Dependiendo de la comparacion
   je igual      ;se activa una de las dos instrucciones de salto 'je' o 'ja'
   
   diferentes:   
   mov ax,@data  ;Mueve los datos a 'ax'
   mov ds,ax     ;mueve los datos en 'ax' a 'ds'
   mov ah,09     ;interrupcion para imprimir string
   mov dx,offset diferentes1 ;manda a llamar la etiqueta para imprimirla
   int 21h 
   
   jmp salir     ;Salta a terminar el programa
   
   igual:
   mov ax,@data  ;Mueve los datos a ax             
   mov ds,ax     ;mueve los datos en ax a ds       
   mov ah,09     ;interrupcion para imprimir string
   mov dx,offset iguales1 ;manda a llamar la etiqueta para imprimirla
   int 21h   
   
   jmp salir  
   
   salir:
   mov ah,4ch   ;Interrupcion para terminar con codigo de retorno
   int 21h  
   
end