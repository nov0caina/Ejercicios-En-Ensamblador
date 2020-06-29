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
     msg2 db 'Se sumaran los numeros mayores a 5',13,10,'$'  
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
     cmp al,6
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
     cmp al,8
     je sumar
     cmp al,10
     je sumar
     cmp al,12
     je sumar
     cmp al,14
     je sumar
     cmp al,16
     je sumar
     cmp al,18
     je sumar
     cmp al,20
     je sumar
     cmp al,22
     je sumar
     cmp al,24
     je sumar
     cmp al,26
     je sumar
     cmp al,28
     je sumar
     cmp al,30
     je sumar
     cmp al,32
     je sumar
     cmp al,34
     je sumar
     cmp al,36
     je sumar
     cmp al,38
     je sumar
     cmp al,40
     je sumar
     cmp al,42
     je sumar
     cmp al,44
     je sumar
     cmp al,46
     je sumar
     cmp al,48
     je sumar
     cmp al,50
     je sumar
     cmp al,52
     je sumar
     cmp al,54
     je sumar
     cmp al,56
     je sumar
     cmp al,58
     je sumar
     cmp al,60
     je sumar
     cmp al,62
     je sumar
     cmp al,64
     je sumar
     cmp al,66
     je sumar
     cmp al,68
     je sumar
     cmp al,70
     je sumar
     cmp al,72
     je sumar
     cmp al,74
     je sumar
     cmp al,76
     je sumar
     cmp al,78
     je sumar
     cmp al,80
     je sumar
     cmp al,82
     je sumar
     cmp al,84
     je sumar
     cmp al,86
     je sumar
     cmp al,88
     je sumar
     cmp al,90
     je sumar
     cmp al,92
     je sumar
     cmp al,94
     je sumar
     cmp al,96
     je sumar
     cmp al,98
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