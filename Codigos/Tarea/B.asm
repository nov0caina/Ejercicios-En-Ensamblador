.model small       
.stack 
.data 
     var: .long db 7,9,11
     suma db 0
     contadorpri db 0 
     contadormul db 0
     num db 0
     resultado db 0 
     c db 0
     d db 0
     u db 0
     msg db 'Introduzca 10 numeros',13,10,'$'
     msg2 db 'Se mostraran cuantos multiplos de 3 o cuantos primos ingreso',13,10,'$'  
     msg3 db 'Si desea introducir un numero menor a 10 favor de primero ingresar un 0',13,10,'$'
     msg4 db 'El resultado de multiplos es = $'
     msg5 db 'El resultado de primos es = $'
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
     cmp al,3
     je sumarmul        
     jbe nosumar
     
     nosumar:
     cmp al,6
     je sumarmul 
     cmp al,9
     je sumarmul 
     cmp al,12
     je sumarmul 
     cmp al,15
     je sumarmul 
     cmp al,18
     je sumarmul 
     cmp al,21
     je sumarmul 
     cmp al,24
     je sumarmul 
     cmp al,27
     je sumarmul 
     cmp al,30
     je sumarmul 
     cmp al,33
     je sumarmul 
     cmp al,36
     je sumarmul 
     cmp al,39
     je sumarmul 
     cmp al,42
     je sumarmul 
     cmp al,45
     je sumarmul 
     cmp al,48
     je sumarmul 
     cmp al,51
     je sumarmul 
     cmp al,54
     je sumarmul 
     cmp al,57
     je sumarmul 
     cmp al,60
     je sumarmul 
     cmp al,63
     je sumarmul 
     cmp al,66
     je sumarmul 
     cmp al,69
     je sumarmul 
     cmp al,72
     je sumarmul 
     cmp al,81
     je sumarmul 
     cmp al,84
     je sumarmul 
     cmp al,87
     je sumarmul 
     cmp al,90
     je sumarmul 
     cmp al,93
     je sumarmul 
     cmp al,96
     je sumarmul 
     cmp al,99
     je sumarmul 
     cmp al,5
     je sumarpri
     cmp al,7
     je sumarpri
     cmp al,11
     je sumarpri
     cmp al,13
     je sumarpri
     cmp al,17
     je sumarpri
     cmp al,19
     je sumarpri
     cmp al,23
     je sumarpri
     cmp al,29
     je sumarpri
     cmp al,31
     je sumarpri
     cmp al,37
     je sumarpri
     cmp al,41
     je sumarpri
     cmp al,43
     je sumarpri
     cmp al,47
     je sumarpri
     cmp al,53
     je sumarpri
     cmp al,59
     je sumarpri
     cmp al,61
     je sumarpri
     cmp al,67
     je sumarpri
     cmp al,71
     je sumarpri
     cmp al,73
     je sumarpri
     cmp al,79
     je sumarpri
     cmp al,83
     je sumarpri
     cmp al,89
     je sumarpri
     cmp al,97
     je sumarpri
     
     dec cx
     cmp cx,1
     je run
     ja run
     jb salir
     
     sumarmul:
     add contadormul,1
     dec cx
     cmp cx,1     
     je run
     ja run
     jb salir
     
     sumarpri:
     add contadorpri,1
     dec cx
     cmp cx,1     
     je run
     ja run
     jb salir 
     
     salir:
     mov al,contadorpri
     aam
     mov d,ah
     mov u,al
     
     lea dx, msg5
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
     
     mov ah,02h
     mov dl,13
     int 21h
     mov ah,02h
     mov dl,10
     int 21h
     
     mov al,contadormul
     aam
     mov d,ah
     mov u,al 
     
     lea dx, msg4
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