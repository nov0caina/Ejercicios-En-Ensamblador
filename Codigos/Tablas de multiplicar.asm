.model small
.stack 100h 
.data
    
    num db 0 
    msg1 db 10,13,7,'               TABLAS DE MULTIPLICAR       ','$'
    msg2 db 10,10,13,13,7,'Ingrese un numero del 1 al 9:','$'     
     
.code
;--------------------Mensajes   
   mov ax,@data
   mov ds,ax
   mov ah,09
   lea dx,msg1
   int 21h
   
   mov ax,@data
   mov ds,ax
   mov ah,09
   lea dx,msg2
   int 21h   
;--------------------Procedimientos

   pedirNumero:
   mov ah,01
   int 21h
   sub al,30h   ;Resto 48 en hexa (30h) al numero ingresado
   mov num,al   ;Muevo el resultado a la variable num
     
   mov cx,9     ;numero de iteraciones
   
   cicloMul:    
   mov al,num    ;mueve "num" a al para multiplicarlo con cl
   mul cl        ;multiplica cl con al

   AAM           ;los separa en la parte alta y baja del registro ax
   
   mov bx,ax     ;mueve todo ax a bx
      
   mov ah,02h 
   mov dl,10 
   int 21h   
      
   mov ah,02h 
   mov dl,13 
   int 21h    
    
   mov ah,02h
   mov dl,num    ;imprime numero ingresado 
   add dl,30h
   int 21h             
   
   mov ah,02h    ;funcion para imprimir un caracter
   mov dl,2Ah    ;imprimime un asterisco
   int 21h
   
   mov ah,02h                               
   mov dl,cl     ;Imprime etapa del ciclo
   add dl,30h
   int 21h
   
   mov ah,02h
   mov dl,205    ;Imprime el simbolo "="
   int 21h 
          
;--------------------Imprime el resultado   
   mov ah,02h    ;f. para imp. un caracter
   mov dl,bh     ;Imprime la parte alta del registro BX, si el número es mayor de 9 imprime las decenas
   add dl,30h    ;Suma 30hexa para imprimir el numero real.
   int 21h
   
   mov dl,bl     ;imprime la parte baja de BX o las unidades.
   add dl,30h    ;suma 30hexa para imprimir el num real
   int 21h
          
   mov ah,02h
   mov dl,13       
   int 21h          
          
   loop cicloMul
   
   salir:
   mov ah,4ch   ;Interrupcion para terminar con codigo de retorno
   int 21h
 
end