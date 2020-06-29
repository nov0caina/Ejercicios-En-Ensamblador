.model small       
.stack 
.data 
     var: .long db 7,9,11
     suma db 0
     contador db 0
     num db 0
     resultado db 0 
     c db 0
     d db 0
     u db 0
     igual db '= $'
     msg db 'Introduzca 10 numeros',13,10,'$' 
     msg3 db 'Si desea introducir un numero menor a 10 favor de primero ingresar un 0',13,10,'$'
     msg4 db 'El resultado es de $'
     msg5 db 'Se mostraran la cantidad de multiplos de 3',13,10,'$'
     
.code
     inicio:
     mov dx, @data 
     mov ds, dx 
     mov cx,10
     
     lea dx, msg
     mov ah, 09h
     int 21h 
     lea dx, msg3
     mov ah, 09h
     int 21h
     lea dx, msg5
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
     cmp al,3
     je sumar        
     jbe nosumar
     
     nosumar: 
     cmp al,6
     je sumar 
     cmp al,9
     je sumar
     cmp al,12
     je sumar
     cmp al,15
     je sumar
     cmp al,18
     je sumar
     cmp al,21
     je sumar
     cmp al,24
     je sumar
     cmp al,27
     je sumar
     cmp al,30
     je sumar
     cmp al,33
     je sumar
     cmp al,36
     je sumar
     cmp al,39
     je sumar
     cmp al,42
     je sumar
     cmp al,45
     je sumar
     cmp al,48
     je sumar
     cmp al,51
     je sumar
     cmp al,54
     je sumar
     cmp al,57
     je sumar
     cmp al,60
     je sumar
     cmp al,63
     je sumar
     cmp al,66
     je sumar
     cmp al,69
     je sumar
     cmp al,72
     je sumar
     cmp al,81
     je sumar
     cmp al,84
     je sumar
     cmp al,87
     je sumar
     cmp al,90
     je sumar
     cmp al,93
     je sumar
     cmp al,96
     je sumar
     cmp al,99
     je sumar
     
     dec cx
     cmp cx,1
     je run
     ja run
     jb salir
     
     sumar:
     add contador,1
     dec cx
     cmp cx,1     
     je run
     ja run
     jb salir 
     
     salir:
     mov al,contador
     aam
     mov d,ah
     mov u,al
     
     lea dx, msg4
     mov ah, 09h
     int 21h
     lea dx, igual
     mov ah, 09h
     int 21h 
     
     mov ah,02h
     mov dl,d 
     add dl,30h
     int 21h
     mov ah,02h
     mov dl,u
     add dl,30h
     int 21h
     
.exit
end      