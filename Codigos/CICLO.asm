.model small
.stack 64
.data

msg db "Hola Mundo    ",'$',5,5

MOV AH,02H
MOV DL,20H
INT 21H

.code
begin proc far
    
MOV AX,@data
MOV DS,AX
MOV CX,5

ciclo:

MOV AH,09
LEA DX,MSG
INT 21H 

LOOP CICLO
MOV AH,4CH
INT 21H

BEGIN ENDP
END