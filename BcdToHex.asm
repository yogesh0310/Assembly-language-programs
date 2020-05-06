%macro write 02

        mov rax,01

        mov rdi,01

        mov rsi,%1

        mov rdx,%2

syscall

%endmacro

%macro read 02

push rax

push rbx

push rcx

mov rax, 00

mov rdi,0

mov rsi,%1

mov rdx,%2

syscall

pop rcx

pop rbx

pop rax

%endmacro

section .bss

cnt resb 1

b resb 1

char_buff resb 04

section .data

msg db "enter BCD number",10

len equ $-msg

section .text

global _start

_start:

write msg,len

mov byte[cnt],5

mov bx,0000

L1: mov ax,000Ah

    mul bx

    mov bx,ax

    read b,1

    sub byte[b],30h

    mov al,byte[b]

    mov ah,00

    add bx,ax

    dec byte[cnt]

    jnz L1

mov rsi,char_buff

mov cx,04

up:rol bx,04

mov dl,bl

and dl,0FH

cmp dl,09

jbe add30

add dl,07H

add30:add dl,30H

mov byte[rsi],dl

inc rsi

dec cx

jnz up

write  char_buff,04

mov rax,60

mov rdi,00

syscall

