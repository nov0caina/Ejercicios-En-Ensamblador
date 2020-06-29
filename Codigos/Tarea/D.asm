.model small
.stack
.data
    msg1 db 'ingrese una calificacion : ','$'  
    msg2 db 13,10, 'El promedio es mayor  7','$'
    msg3 db 13,10,'El promedio es menor a 7 ','$'
    msg4 db 13,10,'Promedio final: ','$'
    salto db 13,10,'',13,10,'$'
    u db ? 
    d db ? 
    n db ?
    r db ?    
    aux db ?
    ver db ?
    ver2 db ?
.code  
   mov ax,@data
   mov ds,ax
   
   inicio:   
    
   cmp aux,10
   je pro
    
    
   ;mensaje
   mov ah , 09h
   lea dx,msg1
   int 21h
   
   mov ah,01h
   int 21h
   sub al,30h
   mov d,al
   
   mov ah,01h
   int 21h
   sub al,30h
   mov u,al  
   ;junto el numero
    mov al,d
    mov bl,10
    mul bl
    add al,u
    mov n,al 
   
   
   mov ah , 09h
   lea dx,salto
   int 21h
   
   
   mov al,n
   add r,al
   add aux,1
   jmp inicio 
   
   pro:
   xor ax,ax
   mov al,r
   mov bl,10
   div bl
   mov r,al
   jmp mostrar
   
   
                                            
   mostrar:
   
   mov ah,09h
   lea dx,msg4
   int 21h   
   
   mov ah,09h
   lea dx,salto
   int 21h  
   ;alta
   mov al,r
   aam
   mov bx,ax
   mov ah,02h
   mov dl,bh 
   mov ver,dl
   add dl,30h
   ;int 21h
   ;baja
   mov ah,02h
   mov dl,bl
   mov ver2,dl
   add dl,30h
   ;int 21h
   
   cmp ver,1
   
   ja mayor
   jb menor
   je igual
   
   mayor:
   mov ah,09h
   lea dx,msg2
   int 21h  
   jmp final
   menor:
   cmp ver2,7
   je igual
   ja mayor
   mov ah,09h
   lea dx,msg3
   int 21h 
   jmp final
   igual:
   mov ah,09h
   lea dx,msg2
   int 21h 
   jmp final
   
   
   final: 
   mov ah, 4cH
   int 21h
   