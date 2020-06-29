.model small
.stack
.data

    msg1 db 'Ingrese un numero: ','$'  
    msg2 db 13,10, 'Supera los 20','$'
    msg3 db 13,10,'No supera los 20 ','$'
    msg4 db 13,10,'Suma total: ','$'
    salto db 13,10,'',13,10,'$'
    n db ?
    r db ?    
    aux db ?
    ver db ?

.code  
 mov ax,@data
 mov ds,ax
 
 inicio:   
  
 cmp aux,10
 je mostrar 
  
  
 ;mensaje
 mov ah , 09h
 lea dx,msg1
 int 21h
 
 mov ah,01h
 int 21h
 sub al,30h
 mov n,al 
 
 mov ah , 09h
 lea dx,salto
 int 21h
 
 
 mov al,n
 add r,al
 add aux,1
 jmp inicio 
 
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
 int 21h
 ;baja
 mov ah,02h
 mov dl,bl
 add dl,30h
 int 21h
 
 cmp ver,2
 
 ja mayor
 jb menor
 je igual
 
 mayor:
 mov ah,09h
 lea dx,msg2
 int 21h  
 jmp final
 menor:
 mov ah,09h
 lea dx,msg3
 int 21h 
 jmp final
 igual:
 mov ah,09h
 lea dx,msg3
 int 21h 
 jmp final
 
 
 final: 
 mov ah, 4cH
 int 21h
 