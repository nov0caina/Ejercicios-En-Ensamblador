.model small 
.stack 100
.data   
     num db 1  
     num1 db 0
     alta db 0 
     baja db 0  
     msjs db 'X = $'
     msji db '/$'
     msjm db ' + $'
.code
  inicio:
   mov dx, @data
   mov ds, dx
  
   mov ah,09h
   mov dx,offset msjs
   int 21h  
   
   mov cx, 9  
   serie:  
   
   mov al, num   
   
   aam 
   mov alta, ah 
   mov baja, al 
    
   mov ah, 02h  
   mov dl, alta
   add dl, 30h  
   int 21h  
  
   mov ah, 02h
   mov dl, baja
   add dl, 30h
   int 21h

   add num1, 01h 
   
   mov ah,09h
   mov dx,offset msji
   int 21h   
   
   mov al, num1  
   
   aam   
   mov alta, ah 
   mov baja, al 
                                                                                    
   mov ah, 02h  
   mov dl, alta 
   add dl, 30h 
   int 21h   
   mov ah, 02h
   mov dl, baja
   add dl, 30h
   int 21h
   
   lea dx, msjm 
   mov ah, 09h
   int 21h   
   
  loop serie 
  
  mov ax, 4c00h 
  int 21h
   
.exit  
end 
