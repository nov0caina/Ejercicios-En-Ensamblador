.model small
.stack 
.data 
     limite db 5
     suma db 0
     num db 0
     resultado db 0
     d db 0
     u db 0
     msg db 'Introduzca 10 numeros',13,10,'$'  
     msg1 db 'El resultado es de = $' 
     msg2 db 'Se sumaran los numeros menores a 5',13,10,'$'
     msg3 db 'Si desea introducir un numero menor a 10 favor de primero ingresar un 0',13,10,'$'
.code
     inicio:
     mov dx, @data 
     mov ds, dx 
     mov cx,10
     
     lea dx, msg
     mov ah, 09h
     int 21h 
     lea dx, msg2
     mov ah, 09h
     int 21h
     lea dx, msg3
     mov ah, 09h
     int 21h
     
     run:
     mov ah,01h
     int 21h
     sub al,30h
     mov d,al
          
     mov ah,01h
     int 21h
     sub al,30h
     mov u,al
     
     mov al,d 
     mov bl,10
     mul bl
     add al,u
     
     mov num,al
     
     mov ah,02h
     mov dl,13
     int 21h
     mov ah,02h
     mov dl,10
     int 21h
     
     mov al,num
     cmp al,limite
     je nosumar
     ja nosumar
     jb sumar
     
     nosumar:
     dec cx
     cmp cx,1
     je run
     ja run
     jb salir
     
     sumar:
     add suma,al
     dec cx
     cmp cx,1     
     je run
     ja run
     jb salir
     
     salir:
     lea dx, msg1
     mov ah, 09h
     int 21h
     mov al,suma
     aam 
     mov bx,ax
     mov ah,02h
     mov dl,bh 
     add dl,30h
     int 21h
     mov ah,02h
     mov dl,bl
     add dl,30h
     int 21h
     
.exit
end    