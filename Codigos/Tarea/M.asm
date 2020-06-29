.model small  
.stack 100
.data           
     
     H db 0 
     L db 0 
     num1 db 1
     num2 db 1
     resul db 0 
     msg1 db '                    Serie de Fibonacci ',13,10,'$'
     
.code
    mov dx,@data
    mov ds,dx 
              
    mov ah,09h
    lea dx,msg1
    int 21h
    
    mov cx,9
   
    mov al,num1
    aam
    mov H,ah
    mov L,al
    mov ah, 02h
    mov dl,H
    add dl,30h
    int 21h 
    mov ah, 02h
    mov dl,L
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,44
    int 21h
    
    mov al,num2
    aam
    mov H,ah
    mov L,al
    mov ah, 02h
    mov dl,H
    add dl,30h
    int 21h 
    mov ah, 02h
    mov dl,L
    add dl,30h
    int 21h
    
    
    mov ah,02h
    mov dl,44
    int 21h
    
    ciclo:    
    mov al,num1
    add resul,al
    mov al,num2 
    add resul,al
    mov al,resul
    aam
    mov H,ah
    mov L,al
    
    mov ah,02h
    mov dl,H
    add dl,30h
    int 21h 
    
    mov ah,02h
    mov dl,L
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,44
    int 21h 
    
    mov al,num2
    mov num1,al
    mov al,resul
    mov num2,al
    mov resul,00h
    
    loop ciclo 
    
    mov ah,04ch
    int 21h
    
.exit
end
    
    
    
    
    
    