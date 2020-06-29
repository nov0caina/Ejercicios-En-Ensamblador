.model small
.stack 100h 
.data
    
    msg1 db 10,13,7,'               DIVISIONES       ','$'
    msg2 db 10,10,13,13,7,'Ingrese las cantidades a multiplicar:','$'      
    salto db 10,10,13,'     ','$'
         
.code
    
    decenas db ?
    unidades db ?
    dividendo db ?
    divisor db ?
    residuo db ?
    
                  
.startup 

 
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,msg1
    int 21h    
    
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,salto
    int 21h
    
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,msg2
    int 21h  
    
;---------------------------------------
   
   mov ah,01h
   int 21h
   sub al,30h
   mov decenas,al
   mov al,decenas
   mov bl,10
   mul bl
   mov decenas,al 
   
   mov ah,01h
   int 21h
   sub al,30h
   mov unidades,al
   
   mov ah,02h
   mov dl,'/'
   int 21h
   
   mov ah,01h
   int 21h
   sub al,30h
   mov divisor,al
   
   mov ah,02h
   mov dl,'='
   int 21h
   
;----------------------------------------

   xor ax,ax
   mov al,decenas
   mov bl,al
   mov al,unidades
   add al,bl 
   mov bl,divisor
   DIV bl
   AAM
   
   mov residuo,al
   mov bl,ah
   mov dl,bl
   add dl,30h
   mov ah,02h
   int 21h
   
   mov al,residuo
   mov bl,al
   mov dl,bl
   add dl,30h
   mov ah,02h
   int 21h
                   
   salir:
   mov ah,4ch   ;Interrupcion para terminar con codigo de retorno
   int 21h
 
end