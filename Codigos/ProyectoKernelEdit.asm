     name "kernel"
; this is a very basic example
; of a tiny operating system.
;
; this is kernel module!
;
; it is assumed that this machine
; code is loaded by 'micro-os_loader.asm'
; from floppy drive from:
;   cylinder: 0
;   sector: 2
;   head: 0


;=================================================
; how to test micro-operating system:
;   1. compile micro-os_loader.asm
;   2. compile micro-os_kernel.asm
;   3. compile writebin.asm
;   4. insert empty floppy disk to drive a:
;   5. from command prompt type:
;        writebin loader.bin
;        writebin kernel.bin /k
;=================================================

; directive to create bin file:
#make_bin#

; where to load? (for emulator. all these values are saved into .binf file)
#load_segment=0800#
#load_offset=0000#

; these values are set to registers on load, actually only ds, es, cs, ip, ss, sp are
; important. these values are used for the emulator to emulate real microprocessor state 
; after micro-os_loader transfers control to this kernel (as expected).
include emu8086.inc
#al=0b#
#ah=00#
#bh=00#
#bl=00#
#ch=00#
#cl=02#
#dh=00#
#dl=00#
#ds=0800#
#es=0800#
#si=7c02#
#di=0000#
#bp=0000#
#cs=0800#
#ip=0000#
#ss=07c0#
#sp=03fe#







; kernel is loaded at 0800:0000 by micro-os_loader
org 0000h

; skip the data and function delaration section:
jmp start 
; The first byte of this jump instruction is 0E9h
; It is used by to determine if we had a sucessful launch or not.
; The loader prints out an error message if kernel not found.
; The kernel prints out "F" if it is written to sector 1 instead of sector 2.
           



;==== data section =====================

; welcome message:
msg  db "Bonvenon al Mikro-OS!", 0 

cmd_size        equ 10    ; size of command_buffer
command_buffer  db cmd_size dup("b")
clean_str       db cmd_size dup(" "), 0
prompt          db ">", 0

; commands:
choro    db "horo", 0
choro_tail:
cdato    db "dato", 0
cdato_tail:
chelpi    db "helpi", 0
chelpi_tail:
ccls     db "cls", 0
ccls_tail:
crestarti  db "restarti", 0
crestarti_tail:
cforlasi    db "forlasi", 0
cforlasi_tail:
celiri    db "eliri", 0
celiri_tail:

help_msg db "Danki vin por elekti Mikro-OS!", 0Dh,0Ah
         db "La mallonga listo de apogxitaj komandoj:", 0Dh,0Ah
         db "horo        - Presi la nuna tempon.", 0Dh,0Ah
         db "dato        - Presi la nuna daton.", 0Dh,0Ah
         db "helpi       - Presi cxi tiu listo.", 0Dh,0Ah
         db "cls         - Purigxi la ekrano.", 0Dh,0Ah
         db "restarti    - Restartigxas la komputilo.", 0Dh,0Ah
         db "forlasi     - Sama kiel restartigi.", 0Dh,0Ah 
         db "eliri       - Sama kiel forlasi.", 0Dh,0Ah
         db "pli veni!", 0Dh,0Ah, 0

unknown  db "nekonata komando: " , 0    

;======================================

start:

; set data segment:
push    cs
pop     ds

; set default video mode 80x25:
mov     ah, 00h
mov     al, 03h
int     10h

; blinking disabled for compatibility with dos/bios,
; emulator and windows prompt never blink.
mov     ax, 1003h
mov     bx, 0      ; disable blinking.
int     10h


; *** the integrity check  ***
cmp [0000], 0E9h
jz integrity_check_ok
integrity_failed:  
mov     al, 'F'
mov     ah, 0eh
int     10h  
; wait for any key...
mov     ax, 0
int     16h
; reboot...
mov     ax, 0040h
mov     ds, ax
mov     w.[0072h], 0000h
jmp	0ffffh:0000h	 
integrity_check_ok:
nop
; *** ok ***
              


; clear screen:
call    clear_screen
                     
                       
; print out the message:
lea     si, msg
call    print_string


eternal_loop:
call    get_command

call    process_cmd

; make eternal loop:
jmp eternal_loop


;===========================================
get_command proc near

; set cursor position to bottom
; of the screen:
mov     ax, 40h
mov     es, ax
mov     al, es:[84h]

gotoxy  0, al

; clear command line:
lea     si, clean_str
call    print_string

gotoxy  0, al

; show prompt:
lea     si, prompt 
call    print_string


; wait for a command:
mov     dx, cmd_size    ; buffer size.
lea     di, command_buffer
call    get_string


ret
get_command endp
;===========================================

process_cmd proc    near

;//// check commands here ///
; set es to ds
push    ds
pop     es

cld     ; forward compare.

; compare command buffer with 'horo'
lea     si, command_buffer
mov     cx, choro_tail - offset choro   ; size of ['hora',0] string.
lea     di, choro
repe    cmpsb
je      horo_command

; compare command buffer with 'dato'
lea     si, command_buffer
mov     cx, cdato_tail - offset cdato   ; size of ['fecha',0] string.
lea     di, cdato
repe    cmpsb
je      dato_command

; compare command buffer with 'helpi'
lea     si, command_buffer
mov     cx, chelpi_tail - offset chelpi   ; size of ['help',0] string.
lea     di, chelpi
repe    cmpsb
je      helpi_command
            
; compare command buffer with 'cls'
lea     si, command_buffer
mov     cx, ccls_tail - offset ccls  ; size of ['cls',0] string.
lea     di, ccls
repe    cmpsb
jne     not_cls
jmp     cls_command
not_cls:

; compare command buffer with 'forlasi'
lea     si, command_buffer
mov     cx, cforlasi_tail - offset cforlasi ; size of ['quit',0] string.
lea     di, cforlasi
repe    cmpsb
je      restarti_command

; compare command buffer with 'eliri'
lea     si, command_buffer
mov     cx, celiri_tail - offset celiri ; size of ['exit',0] string.
lea     di, celiri
repe    cmpsb
je      restarti_command

; compare command buffer with 'restarti'
lea     si, command_buffer
mov     cx, crestarti_tail - offset crestarti  ; size of ['reboot',0] string.
lea     di, crestarti
repe    cmpsb
je      restarti_command

; ignore empty lines
cmp     command_buffer, 0
jz      processed


;////////////////////////////

; if gets here, then command is
; unknown...

mov     al, 1
call    scroll_t_area

; set cursor position just
; above prompt line:
mov     ax, 40h
mov     es, ax
mov     al, es:[84h]
dec     al
gotoxy  0, al

lea     si, unknown
call    print_string

lea     si, command_buffer
call    print_string

mov     al, 1
call    scroll_t_area

jmp     processed

; +++++ 'horo' command ++++++
horo_command:


gotoxy 2,2
printn "Saluton, kiel vi fartas :D"
printn "La nuna tempo estas:"

MOV AH, 2CH
INT 21H

MOV CL, CH
MOV CH, 0H

MOV AX, CX
CALL PRINT_NUM

PRINT ":"
      
MOV AH, 2CH
INT 21H

MOV CL, CL
MOV CH, 0H

MOV AX, CX 
CALL PRINT_NUM  

PRINT ":"  

MOV AH, 2CH  
INT 21H

MOV CL, DH
MOV CH, 0H

MOV AX, CX  
CALL PRINT_NUM

DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS

jmp     processed  


; +++++ 'dato' command ++++++
dato_command:

gotoxy 2,2
printn "Saluton, kiel vi fartas :D"
printn "La nuna dato estas:"

MOV AH, 2AH
INT 21H

MOV AH, 0H
MOV AL, 0H

MOV AL, DL
CALL PRINT_NUM
PRINT "/"

MOV AL, DH
CALL PRINT_NUM
PRINT "/"

MOV AX, CX
CALL PRINT_NUM    

jmp processed

; +++++ 'helpi' command ++++++
helpi_command:

; scroll text area 9 lines up:
mov     al, 9
call    scroll_t_area

; set cursor position 9 lines
; above prompt line:
mov     ax, 40h
mov     es, ax
mov     al, es:[84h]
sub     al, 9
gotoxy  0, al

lea     si, help_msg
call    print_string

mov     al, 1
call    scroll_t_area

jmp     processed




; +++++ 'cls' command ++++++
cls_command:
call    clear_screen
jmp     processed







; +++ 'forlasi', 'eliri', 'restarti' +++
restarti_command:
call    clear_screen
print 5,2,0011_1111b," please eject any floppy disks "
print 5,3,0011_1111b," and press any key to reboot... "
mov ax, 0  ; wait for any key....
int 16h

; store magic value at 0040h:0072h:
;   0000h - cold boot.
;   1234h - warm boot.
mov     ax, 0040h
mov     ds, ax
mov     w.[0072h], 0000h ; cold boot.
jmp	0ffffh:0000h	 ; reboot!

; ++++++++++++++++++++++++++

processed:
ret
 endp

;===========================================

; scroll all screen except last row
; up by value specified in al

scroll_t_area   proc    near

mov dx, 40h
mov es, dx  ; for getting screen parameters.
mov ah, 06h ; scroll up function id.
mov bh, 07  ; attribute for new lines.
mov ch, 0   ; upper row.
mov cl, 0   ; upper col.
mov di, 84h ; rows on screen -1,
mov dh, es:[di] ; lower row (byte).
dec dh  ; don't scroll bottom line.
mov di, 4ah ; columns on screen,
mov dl, es:[di]
dec dl  ; lower col.
int 10h

ret
scroll_t_area   endp

;===========================================




; get characters from keyboard and write a null terminated string 
; to buffer at DS:DI, maximum buffer size is in DX.
; 'enter' stops the input.
get_string      proc    near
push    ax
push    cx
push    di
push    dx

mov     cx, 0                   ; char counter.

cmp     dx, 1                   ; buffer too small?
jbe     empty_buffer            ;

dec     dx                      ; reserve space for last zero.


;============================
; eternal loop to get
; and processes key presses:

wait_for_key:

mov     ah, 0                   ; get pressed key.
int     16h

cmp     al, 0Dh                 ; 'return' pressed?
jz      exit


cmp     al, 8                   ; 'backspace' pressed?
jne     add_to_buffer
jcxz    wait_for_key            ; nothing to remove!
dec     cx
dec     di
putc    8                       ; backspace.
putc    ' '                     ; clear position.
putc    8                       ; backspace again.
jmp     wait_for_key

add_to_buffer:

        cmp     cx, dx          ; buffer is full?
        jae     wait_for_key    ; if so wait for 'backspace' or 'return'...

        mov     [di], al
        inc     di
        inc     cx
        
        ; print the key:
        mov     ah, 0eh
        int     10h

jmp     wait_for_key
;============================

exit:

; terminate by null:
mov     [di], 0

empty_buffer:

pop     dx
pop     di
pop     cx
pop     ax
ret
get_string      endp




; print a null terminated string at current cursor position, 
; string address: ds:si
print_string proc near
push    ax      ; store registers...
push    si      ;

next_char:      
        mov     al, [si]
        cmp     al, 0
        jz      printed
        inc     si
        mov     ah, 0eh ; teletype function.
        int     10h
        jmp     next_char
printed:

pop     si      ; re-store registers...
pop     ax      ;

ret
print_string endp



; clear the screen by scrolling entire screen window,
; and set cursor position on top.
; default attribute is set to white on blue.
clear_screen proc near
        push    ax      ; store registers...
        push    ds      ;
        push    bx      ;
        push    cx      ;
        push    di      ;

        mov     ax, 40h
        mov     ds, ax  ; for getting screen parameters.
        mov     ah, 06h ; scroll up function id.
        mov     al, 0   ; scroll all lines!
        mov     bh, 1001_1111b  ; attribute for new lines.
        mov     ch, 0   ; upper row.
        mov     cl, 0   ; upper col.
        mov     di, 84h ; rows on screen -1,
        mov     dh, [di] ; lower row (byte).
        mov     di, 4ah ; columns on screen,
        mov     dl, [di]
        dec     dl      ; lower col.
        int     10h

        ; set cursor position to top
        ; of the screen:
        mov     bh, 0   ; current page.
        mov     dl, 0   ; col.
        mov     dh, 0   ; row.
        mov     ah, 02
        int     10h

        pop     di      ; re-store registers...
        pop     cx      ;
        pop     bx      ;
        pop     ds      ;
        pop     ax      ;

        ret
clear_screen endp



