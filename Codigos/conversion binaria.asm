.model small
.stack
.data
   msgc db '*****************CONVERSION BINARIA********************$'
   msg db 10,13,'Ingresa El Numero a Convertir: $'
   cad  db 9 dup (' '),'$'
   var1 db 0
   num  db 0
   aux  db 0
  
.code
.startup
   
   mov ah,09h
   lea dx,msgc
   int 21h
   
   mov ah,09h
   lea dx,msg
   int 21h
   
   mov var1,0   ;Residuo de cero
   mov ah,01h   ;Utilizado con la interrupcu�n siguiente
   int 21h      ;Interrupci�n para leer
   sub al,30h   ;Obtenci�n de valor real
   mov num,al   ;N�mero con que trabajaremos

   mov al,num   
   mov bl,10    ;Movemos a bl 10
   mul bl       ;Multiplicamos 10 por el n�mero a convertir
   mov aux,al   ;Asignamos a aux el residuo

   mov var1,0   ;Para segundo d�gito se repite
   mov ah,01h
   int 21h      
   sub al,30h
   add aux,al   ;Lo agregamos al n�mero anterior multiplicado por 10
   mov bl,aux   ;�ste ya no necesita ser multiplicado
   mov num,bl   ;El n�mero resultante a bl

   mov ah,02h   ;Imprimimos signo de igual
   mov dl,'='
   int 21h

   mov SI,6     ;Comienzan los ciclos de divisi�n entre 2
   bin:         ;Uso de etiqueta

      mov Ah,00h;Aseguramos residuo de 0
      mov Al,num
      mov Bl,2
      div Bl
      mov var1,Ah
      mov num,Al

      mov dl,var1
      add dl,30h

      mov cad[SI],dl;Concatenamos resultados

      cmp num,1 ;Hacemos comparaci�n
      dec SI
      jne bin   ;Indicamos volver a etiqueta bin o:
       je salida   ;Ir a etiqueta salir



      cmp num,0 ;Comparacion con 0
       jne bin
        je salida

   salida:          ;Etiqueta de salida
      
      
      
      
      mov dl,num ;Proceso para imprimir cadena final con numero binario
      add dl,30h

      mov cad[SI],dl

  mov ah,09h
  lea Dx,cad
  int 21h

.exit
end

