.model small       
.stack 
.data 
     var: .long db 7,9,11
     suma db 0
     num db 0
     resultado db 0 
     c db 0
     d db 0
     u db 0
     igual db '= $'
     msg db 'Introduzca 10 numeros',13,10,'$'
     msg2 db 'Se sumaran los numeros impares mayores a 5',13,10,'$'  
     msg3 db 'Si desea introducir un numero menor a 10 favor de primero ingresar un 0',13,10,'$'
     msg4 db 'El resultado es de $'
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
     cmp al,7
     je sumar        
     jbe nosumar
     
     nosumar:
     cmp al,9
     je sumar
     cmp al,11
     je sumar
     cmp al,13
     je sumar
     cmp al,15
     je sumar
     cmp al,17
     je sumar
     cmp al,19
     je sumar
     cmp al,21
     je sumar
     cmp al,23
     je sumar
     cmp al,25
     je sumar
     cmp al,27
     je sumar
     cmp al,29
     je sumar
     cmp al,31
     je sumar
     cmp al,33
     je sumar
     cmp al,35
     je sumar
     cmp al,37
     je sumar
     cmp al,39
     je sumar
     cmp al,41
     je sumar
     cmp al,43
     je sumar
     cmp al,45
     je sumar
     cmp al,47
     je sumar
     cmp al,49
     je sumar
     cmp al,51
     je sumar
     cmp al,53
     je sumar
     cmp al,55
     je sumar
     cmp al,57
     je sumar
     cmp al,59
     je sumar
     cmp al,61
     je sumar
     cmp al,63
     je sumar
     cmp al,65
     je sumar
     cmp al,67
     je sumar
     cmp al,69
     je sumar
     cmp al,71
     je sumar
     cmp al,73
     je sumar
     cmp al,75
     je sumar
     cmp al,77
     je sumar
     cmp al,79
     je sumar
     cmp al,81
     je sumar
     cmp al,83
     je sumar
     cmp al,85
     je sumar
     cmp al,87
     je sumar
     cmp al,89
     je sumar
     cmp al,91
     je sumar
     cmp al,93
     je sumar
     cmp al,95
     je sumar
     cmp al,97
     je sumar
     cmp al,99
     je sumar
      
     dec cx
     cmp cx,1
     je run
     ja run
     jb salir
     
     sumar:
     aam
     add c,ah
     mov dh,c
     add suma,al
     MOV dl,suma
     dec cx
     cmp cx,1     
     je run
     ja run
     jb salir
     
     salir:
     mov al,suma
     aam
     mov u,al
     add c,ah
     mov al,c
     aam
     mov d,al
     mov c,ah
     
     lea dx, msg4
     mov ah, 09h
     int 21h
     lea dx, igual
     mov ah, 09h
     int 21h
      
     mov ah,02h
     mov dl,c
     add dl,30h
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