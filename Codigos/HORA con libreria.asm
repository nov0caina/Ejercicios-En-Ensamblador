include emu8086.inc

printn "Hola :D"
gotoxy 2,2
printn "Que tal"

MOV AH, 2CH
INT 21H

MOV CL, CH
MOV CH, 0H

MOV AX, CX
CALL PRINT_NUM

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS