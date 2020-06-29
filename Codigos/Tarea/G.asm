.model small  
.stack    
.data
 
msg1 db 13,10,'por favor ingrese un numero: ', '$'
msg2 db 13,10, 'el numero ingresado es cero: ', '$'
salto db 13,10,'','$' 
var1 db ?
var2 db ?
nf db ?
n db ?  
aux db ?
.code
 

 
mov ax, @data 
mov ds, ax

inicio:
cmp aux,10
je mostrar
 
mov ah, 09h
lea dx, msg1
int 21h
 
mov ah,01h
int 21h
sub al, 30h 
mov var2,al

int 21h
sub al, 30h   
mov var1, al
;unir numero
  mov al,var2
  mov bl,10
  mul bl
  add al,var1
  mov nf,al

;comparacion  
;mov ah, var1
;mov bl, var1
    mov al,nf
    mov bl,2
    div bl
    
add aux,1
cmp ah,0
 
 
je par
jmp inicio 
 
par:
mov al,nf
add n,al
jmp inicio
 
            
mostrar:   
    mov ah, 09h
    lea dx, salto
    int 21h
  ;parte alta
  mov al,n
  aam   
  mov bx,ax
  mov ah,02h
  mov dl,bh
  add dl,30h
  int 21h 
  
  ;parte baja 
  mov ah,02h
  mov dl,bl     
  add dl,30h
  int 21h 
  jmp salir           

; salir del programa
salir:
mov ax, 4c00h
int 21h
