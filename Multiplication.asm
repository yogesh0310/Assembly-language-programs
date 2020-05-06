%macro write 2

mov rax,1

mov rdi,1

mov rsi,%1

mov rdx,%2

syscall

%endmacro

section .data

msg db "Result is "

len equ $-msg

n1 dq 1122334455667788H

n2 dq 8877665544332211H

section .bss

char_buff resb 16

section .text

global _start

_start:

write msg,len

MOV rax,[n1]

mov rbx,[n2]

mul rbx

mov rsi,char_buff

mov rcx,16

l2:rol rax,4

   mov dl,al

   and dl,0fh

   cmp dl,09h

   JBE l1

   ADD dl,07h

   

l1:ADD dl,30h   

   mov byte[rsi],dl

   inc rsi

   dec rcx

   jnz l2

   

write char_buff,16

mov rax,60

mov rdi,0

syscall

