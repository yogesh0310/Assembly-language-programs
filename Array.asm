%macro write 2

mov rax,1

mov rdi,1

mov rsi,%1

mov rdx,%2

syscall

%endmacro

section .data

msg db "Enter numbers",10

len equ $-msg

msg1 db "Numbers are",10

len1 equ $-msg1

section .bss

arr resq 10

cnt resb 1 

section .text

global _start

_start:

write msg,len

mov rbx,arr

mov byte[cnt],10

up:Mov rax,0

   mov rdi,0

   mov rsi,rbx

   mov rdx,8

   syscall

   add rbx,8

   dec byte[cnt]

   jnz up

write msg1,len1

    mov rbx,arr

     mov byte[cnt],10

    down: mov rax,1

     mov rdi,1

     mov rsi,rbx

     mov rdx,8

     syscall

     add rbx,8

     dec byte[cnt]

     jnz down

mov rax,60

mov rdi,0

syscall

;Output:

;[student@localhost ~]$ nasm -f elf64 yogesh.asm

;[student@localhost ~]$ ld -o yogesh yogesh.o

;[student@localhost ~]$ ./yogesh

;Enter numbers

;1

;2

;3

;4

;5

;6

;7

;8

;9

;10

;Numbers are

;1

;2

;3

;4

;5

;6

;7

;8

;9

;10

    
