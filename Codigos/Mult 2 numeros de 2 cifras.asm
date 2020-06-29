.model small
.stack 100h 
.data
    
    msg1 db 10,13,7,'               MULTIPLICACION DE NUMEROS DE DOS CIFRAS       ','$'
    msg2 db 10,10,13,13,7,'Ingrese las cantidades a multiplicar:','$'      
    salto db 10,10,13,'     ','$'
         
.code
   
    numero1 db ?
    numero2 db ?
    numero3 db ?
    numero4 db ?
    resul1 db ?
    resul2 db ?   
    resul3 db ?
    resul4 db ?
    acarreo db 0
    acarreo2 db 0
    sum1 db ?
    sum2 db ?
    sum3 db ?
    sum4 db ?
    sumAc db 0
    sumAc2 db 0  
    sumAc3 db 0
    
                  
.startup 

 
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,msg1
    int 21h    
    
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,salto
    int 21h
    
    mov ax,@data
    mov ds,ax
    mov ah,09
    lea dx,msg2
    int 21h  
    
    ;-------------Lee los valores------------
    
    mov ah,01h
    int 21h          ;Lee el decimal del primer numero
    sub al,30h
    mov numero1, al  ;Mueve el dec. a la variable numero1
      
    mov ah,01h
    int 21h          ;Lee la unidad del primer numero
    sub al,30h
    mov numero2, al  ;Mueve la unidad a la variable numero2              
    
    mov ah,02h
    mov dl, '*'      ;Imprime *
    int 21h
    
    mov ah,01h
    int 21h          ;Lee el numero3
    sub al,30h
    mov numero3, al  ;Mueve el numero a la variable numero3
    
    mov ah,01h
    int 21h          ;Lee el numero4                       
    sub al,30h                                             
    mov numero4, al  ;Mueve el numero a la variable numero4
    
    mov ah,02h
    mov dl,'='       ;Imprime =
    int 21h
    
    ;-------------Operaciones-----------------
    ;----Multiplicacion parte1---------     
    mov al,numero4
    mov bl,numero2
    mul bl
    mov ah,0h
    AAM
    mov acarreo,ah
    mov resul2,al
         
    mov al,numero4
    mov bl,numero1
    mul bl
    mov resul1,al
    mov bl,acarreo
    add resul1,bl
    mov ah,00h
    mov al,resul1
    
    AAM
    mov resul1,al
    mov acarreo,ah
    ;----Multiplicacion parte2---------
    
    mov al,numero3
    mov bl,numero2
    mul bl
    mov ah,00h
    AAM
    mov acarreo2,ah
    mov resul4,al
         
    mov al,numero3
    mov bl,numero1
    mul bl
    mov resul3,al
    mov bl,acarreo2
    add resul3,bl
    mov ah,00h
    mov al,resul3
    
    AAM
    mov resul3,al
    mov acarreo2,ah 
        
    ;------Sumas----------------------------- 
     
    mov al,resul1
    mov bl,resul4
    add al,bl
    AAM
    mov sum1,al
    mov sumAc,ah
    
    mov al,sumAc
    mov bl,acarreo
    add al,bl
    mov dl,resul3
    add al,dl
    AAM
    mov sum2,al
    mov sumAc2,ah
    
    mov al,sumAc2
    mov bl,acarreo2
    add al,bl
    AAM
    mov sum3,al
    mov sumAc3,ah
    
    ;-------Muestra resultados---------------
    
    mov ah,02h
    mov dl,sumAc3
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,sum3
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,sum2
    add dl,30h
    int 21h
    
    mov ah,02h
    mov dl,sum1
    add dl,30h
    int 21h  
    
    mov ah,02h
    mov dl,resul2
    add dl,30h
    int 21h
    
                  
   salir:
   mov ah,4ch   ;Interrupcion para terminar con codigo de retorno
   int 21h
 
end