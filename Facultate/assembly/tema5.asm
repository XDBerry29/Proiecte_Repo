bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, printf, scanf               ; tell nasm that exit exists even if we won't be defining it
import exit msvcrt.dll    ; exit is a function that ends the calling process. It is defined in msvcrt.dll
import printf msvcrt.dll
import scanf msvcrt.dll   ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    ; ...
    a db 2, 1, -3, 3, -4, 2, 6
    lena equ $-a
    b db 4, 5, 7, 6, 2, 1
    lenb equ $-b
    r times lena+lenb db 0
    ;Se dau 2 siruri de octeti A si B. Sa se construiasca sirul R care sa contina elementele lui B in ordine inversa urmate de elementele negative ale lui A

; our code starts here
segment code use32 class=code
    start:
        ; ...
        mov esi, b
        add esi, lenb
        dec esi
        
        mov edi, r
        mov ecx, 0
        mov cl, lenb
        
        repeta_a:
           std
           lodsb
           cld
           stosb
           loop repeta_a
        
        mov esi, a
                
        mov ecx, 0
        mov cl, lena
        cld
        repeta_b:           
           lodsb
           cmp al, 0
           jl negativ
           jnl pozitiv
           negativ:
              stosb
           pozitiv:
           loop repeta_b
                
        ; exit(0)
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
