.model small
.stack 100h 
.data
   
unidades1 db 0
decenas1 db 0 
unidades2 db 0
decenas2 db 0
numero1 db 0
numero2 db 0   

titulo db 10,13,7,'         Comparacion de numeros de 2 digitos         ','$'
instrucciones db 10,13,7, 'Ingrese un numero: ','$'
instrucciones2 db 10,13,'Ingrese un nuevo numero: ','$'
diferentes1 db 10,13,'Son diferentes','$'
iguales1 db 10,13,'Son iguales','$'

.code 
  mov ax,@data
  mov ds,ax  
  mov ah,09
  lea dx,titulo
  int 21h 
  
  mov ax,@data
  mov ds,ax  
  mov ah,09
  lea dx,instrucciones
  int 21h     
  
  ;---------Primer Numero 2Digitos---------
  pedirNumeros:
   mov ah,01     ;Pide primer digito del primer numero
   int 21h 
   sub al,30h
   mov decenas1,al
   
   mov ah,01     ;Pide segundo digito del primer numero
   int 21h 
   sub al,30h
   mov unidades1,al
   
   mov al,decenas1
   mov bl,10
   mul bl
   add al,unidades1
   mov numero1,al 
   
   mov al,numero1
   AAM
   mov cx,ax

   ;---------Segundo Numero 2Digitos---------
   mov ax,@data
   mov ds,ax  
   mov ah,09
   lea dx,instrucciones2
   int 21h
  
   mov ah,01     ;Pide primer digito del segundo numero
   int 21h                               
   sub al,30h                            
   mov decenas2,al                        
                                         
   mov ah,01     ;Pide segundo digito del segundo numero
   int 21h 
   sub al,30h
   mov unidades2,al
   
   mov al,decenas2
   mov bl,10
   mul bl
   add al,unidades2
   mov numero2,al 
   
   mov bl,numero2
   AAM
   mov bx,ax
   ;------Comparacion----                                                               
   cmp cx,bx     ;Compara el numero en 'bl' con el nuevo numero en 'al'
   
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