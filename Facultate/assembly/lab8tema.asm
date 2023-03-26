bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    s1 db 7, 33, 55, 19, 46
    lens1 equ $-s1
    s2 db 33, 21, 7, 13, 27, 19, 55, 46, 1
    lens2 equ $-s2
    d times lens2 db 0
    ;d= 2 0 1 0 0 4 3 5 0
    ;Se dau doua siruri de octeti s1 si s2. Sa se construiasca sirul de octeti d, care contine pentru fiecare octet din s2 pozitia sa in s1, sau 0 in caz contrar.
; our code starts here
segment code use32 class=code
    start:
        mov esi, s2
        
        mov edi, s1
        mov ecx, 0
        mov cl, lens2
        
        repeta:
            lodsb
            
            push ecx
            
            mov ecx, 0
            mov cl, lens1
            
        repeta2:
            SCASB
            je gasit
        
        loop repeta2
        
            jmp nugasit
        
        gasit:
            mov dl,cl
            pop ecx
            mov al, lens1
            sub al,dl ; poz pe care se gaseste
            inc al
            mov dl, lens2
            sub dl,cl
            push edi;
            mov edi, d;
        incedi:
            cmp dl, 0
            je stop
            inc edi
            dec dl
            jne incedi
        stop:
            stosb
            pop edi
            jmp done
            
            
        nugasit:  
            pop ecx
            
        done:
            mov edi, s1
            
            
            
            
        
        loop repeta
            
    
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
