bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
;Se dau cuvintele A si B. Se cere dublucuvantul C:
;bitii 0-3 ai lui C coincid cu bitii 5-8 ai lui B
;bitii 4-10 ai lui C sunt invers fata de bitii 0-6 ai lui B
;bitii 11-18 ai lui C sunt 1
;bitii 19-31 ai lui C coincid cu bitii 3-15 ai lui B
segment data use32 class=data
    a dw 0111011101010111b
    b dw 1001101110111110b
    c dd 0

; our code starts here
segment code use32 class=code
    start:
        mov ebx,0;in ebx vom calcula rezultatul
        ;ne ocupam de bitii 16-31 a lui c
        mov ax ,[b];izolam bitii 3-15 a lui b
        and ax, 1111111111111000b;
        or bx,ax;
        
        ;puem 1 pe biti 16-18 a lui c
        or bx,0000000000000111b;
        
        ;mutam cuvantul low in partea extended a lui ebx
        shl ebx, 16;
        
        mov ax, [b];
        and ax, 0000000111100000b;izolam bitii 5-8 ai lui b
        mov cl, 5;
        ror ax, cl;rotim 5 poziti in dreapta
        or bx,ax;
        
        mov ax, [b];
        and ax, 0000000001111111b;izolam bitii 0-6 ai lui b
        mov cl, 4;
        rol ax, cl; rotim 4 poziti in stanga
        or bx, ax;
        
        mov [c], ebx;
        
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
