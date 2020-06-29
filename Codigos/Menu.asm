.model small
.stack 100h 
.data
    
    mas db 10,10,13,13,7,'Es suma','$'
    menos db 10,10,13,13,7,'Es resta','$'
    divi db 10,10,13,13,7,'Es division','$'
    multi db 10,10,13,13,7,'Es multiplicacion','$'
    desc db 10,10,13,13,7,'Simbolo desconocido...','$' 
       
    bienvenido db 10,13,7,'         Bienvenido','$'
    mensaje db 10,13,10,13,7,'Seleccione una opcion:','$'
    suma db 10,13,10,13,7,            '1.-Suma              (+)','$'
    resta db 10,13,7,           '2.-Resta             (-)','$'
    multiplicacion db 10,13,7,  '3.-Multiplicacion    (*)','$' 
    division db 10,13,7,        '4.-Division          (/)','$'
    input db 10,13,10,13,7,'Introduzca un simbolo:','$'   
       
.code

    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,bienvenido
    int 21h
    
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,mensaje
    int 21h
    
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,suma
    int 21h
    
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,resta
    int 21h
    
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,multiplicacion
    int 21h              
    
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,division
    int 21h
;---------------Pedir seleccion--------------
    ingresar:
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,input
    int 21h
    
    pedirSeleccion:
    mov ah,01    ;Pide simbolo
    int 21h  
    
    mov bl,al
    
    cmp bl,2bh
    
    jne diferenteResta
    je essuma
    
    essuma:
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,mas
    int 21h  
    
    jmp salir     
         
    diferenteResta:    
    cmp bl,2dh
    
    jne diferenteMult
    je esresta
  
    esresta:
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,menos
    int 21h 
    
    jmp salir 
    
    diferenteMult:
    cmp bl,2ah
    
    jne diferenteDiv
    je esmult
    
    esmult:
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,multi
    int 21h  
    
    jmp salir
    
    diferenteDiv:
    cmp bl,2fh
    
    jne desconocido
    je esdiv
    
    esdiv:
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,divi
    int 21h
       
    jmp salir       
           
    desconocido:
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,desc
    int 21h
    
    jmp ingresar
    
    jmp salir
   
   salir:
   mov ah,4ch   ;Interrupcion para terminar con codigo de retorno
   int 21h  
   
end