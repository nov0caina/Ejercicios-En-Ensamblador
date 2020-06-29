.model small
.stack 100h 
.data
    
    num db 1 
    mult db 1
    mostrar db 1
    msg1 db 10,13,7,'               TABLAS DE MULTIPLICAR       ','$'
    msg2 db 10,10,13,13,7,'Tabla del ','$'     

    
    
.code
;--------------------Mensajes   
   mov ax,@data
   mov ds,ax
   mov ah,09
   lea dx,msg1
   int 21h
   
   mov ax, @data
   mov ds, ax  
   siguiente:  
   mov cx, 9    
   mov ah, 09
   lea dx, msg2
   int 21h  
   
   mov ah, 02h
   mov dl, num
   add dl, 30h    
   int 21h  
;--------------------Procedimientos
   
;salto de linea y tabulador 
    
    mov ah, 02h
    mov dl, 10
    int 21h
    mov ah, 02h
    mov dl, 10
    int 21h
    mov ah, 02h
    mov dl, 13
    int 21h   
      
    inicio:
    mov al, num
    mul mult
    aam
    mov bx, ax
    
         
    mov ah, 02h
    mov dl, num
    add dl, 30h    
    int 21h    
    add mult, +1
   
    mov ah, 02h
    mov dl, 2Ah
    int 21h
    
    mov ah, 02h
    mov dl,mostrar
    add dl, 30h
    int 21h
    add mostrar, +1

    mov ah, 02h
    mov dl, 205
    int 21h
    
    ;parte alta del registro  
    mov ah, 02h 
    mov dl, bh
    add dl, 30h 
    int 21h
    
    ;parte baja
    mov ah, 02h
    mov dl, bl
    add dl, 30h
    int 21h
    
    ;saltos de linea y de carro
    mov ah, 02h
    mov dl, 13
    int 21h
    mov ah, 02h
    mov dl, 10
    int 21h
    
    loop inicio
      
    add num,+1  
    mov mostrar,1
    mov mult,1
    cmp num,9
    je salir
    loop siguiente

   
   salir:
   mov ah,4ch   
   int 21h
 
end