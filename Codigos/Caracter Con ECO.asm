.model small
.stack
.data
 
.code

    mov ah, 01h
    int 21h
    
;    mov al, 01h
;    mov cl, al
            
    mov ah, 02h
    mov dl, al
    int 21h 

.exit
end