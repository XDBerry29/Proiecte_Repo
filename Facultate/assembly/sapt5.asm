bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ;x-(a*b*25+c*3)/(a+b)+e; a,b,c-byte; e-doubleword,x-qword
    a db 2
    b db 5
    c db 7
    e dd 18
    x dq 320
    

; our code starts here
segment code use32 class=code
    start:
        mov al, [a]
        imul byte[b];ax = a*b
        mov bx, 25;
        imul bx;
        
        push dx
        push ax 
        pop ecx ;ecx = a*b*25
        
        mov al, 2
        mov bl, 3
        imul bl
        cwde ; eax = c*3
        
        
        add ecx, eax; ecx =(a*b*25+c*3)
        
        mov al, [a]
        add al, [c]
        cbw
        mov bx, ax
        push ecx
        pop ax
        pop dx 
        idiv bx;ax = (a*b*25+c*3)/(a+b)
        cwde
        cdq
        add eax, [e]
        mov ebx, dword[x]
        mov ecx, dword[x+4]
        sub ebx, eax
        sbb ecx, edx ; ecx:ebx=x-(a*b*25+c*3)/(a+b)+e
        
        

        
        
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
