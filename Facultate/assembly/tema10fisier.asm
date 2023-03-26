bits 32 ; assembling for the 32 bits architecture

; declare the EntryPoint (a label defining the very first instruction of the program)
global start        

; declare external functions needed by our program
extern exit, fopen, fclose, scanf, fprintf, printf , fscanf , fgets
import exit msvcrt.dll  
import fopen msvcrt.dll  
import fclose msvcrt.dll 
import scanf msvcrt.dll 
import fprintf msvcrt.dll
import printf msvcrt.dll 
import fscanf msvcrt.dll
import fgets msvcrt.dll; exit is a function that ends the calling process. It is defined in msvcrt.dll
                          ; msvcrt.dll contains exit, printf and all the other important C-runtime specific functions

; our data is declared here (the variables needed by our program)
segment data use32 class=data
    nume_fisier db "fisier.txt",0
    mod_acces db "w",0
    descriptor dd -1
    format_citire db "%s",0
    spatiu db " ",0
    cuvant db 0

; Se da un nume de fisier (definit in segmentul de date). Sa se creeze un fisier cu numele dat, apoi sa se citeasca de la tastatura cuvinte pana cand se citeste de la tastatura caracterul '$'. Sa se scrie in fisier doar cuvintele care contin cel putin o cifra.
segment code use32 class=code
    start:
        ;deschidere fisier
        push dword mod_acces     
        push dword nume_fisier
        call [fopen]
        add esp, 4*2
        
        mov [descriptor],eax
        
        cmp eax, 0
        je final
        
        ;citim cuvintele
        citire:
        push dword cuvant
        push dword format_citire
        call [scanf]
        add esp, 4*2
        cmp byte[cuvant],"$"
        je inchidere
        
        ;numaram numarul de caractere din cuvant
        mov edi,cuvant
        mov ecx, 0
        mov al, 0
        not	ecx
        cld
        repne scasb
        not	ecx
        dec	ecx 
        mov edi,0    
        verificare:
            push ECX
            mov AL,47
            cmp [cuvant+edi],AL
            jl continua
            mov AL,58
            cmp [cuvant+edi],AL
            jg continua


            ;scriere in fisier
            push dword cuvant
            push dword [descriptor]
            call [fprintf]
            add esp,4*2
            
            push dword spatiu
            push dword [descriptor]
            call [fprintf]
            add esp,4*2
            
            jmp citire
            continua:
                inc edi
        pop ECX
        loop verificare
        jmp citire
        
        inchidere:
        push dword [descriptor]
        call [fclose]
        add esp, 4
        ; exit(0)
        final:
        push    dword 0      ; push the parameter for exit onto the stack
        call    [exit]       ; call exit to terminate the program
