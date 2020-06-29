.model small
.stack
.data   
    msgUno db "*",10,13,"$"   
    msgDos db "**",10,13,"$"
    msgTres db "***",10,13,"$"
    msgCuatro db "****",10,13,"$"
    msgCinco db "*****",10,13,"$"       
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,09
    lea dx,msgUno
    int 21h
    
    mov ah,09
    lea dx, msgDos
    int 21h
    
    mov ah,09
    lea dx, msgTres
    int 21h
    
    mov ah,09
    lea dx, msgCuatro
    int 21h
    
    mov ah,09
    lea dx, msgCinco
    int 21h
   
    mov ax, 4c00h
    int 21h 
      
main endp
end main