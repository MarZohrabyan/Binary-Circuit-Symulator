.MODEL SMALL

.data
        firstGate    db ?
        secondGate   db ?
        thirdGate    db ? 
        fourthGate   db ? 
        fifthGate    db ? 
        sixthGate    db ? 
        seventhGate  db ? 
        
       
.code

org 100H

STARTGATE:
    mov AL, 10011101B   ; input the value
    mov BL,AL           ; copy of input bits into BL
    mov CL,AL           ; and another in CL
    AND BL,00000001B    ; mask off all bits except input bit 0
    AND CL,00000010B    ; mask off all bits except input bit 1
    SHR CL,1            ; move bit 1 value into bit 0 of CL register
                        ; now we have the binary value of each bit in BL and CL, in bit 0 location
    AND BL,CL           ; AND these two registers, result in BL
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    mov firstGate,BL    ; copy the value to the firstGate variable
    
    
    
    mov BL,AL           ; copy of input bits into BL
    AND BL,00000100B    ; mask off all bits except input bit 2
    SHR BL,2            ; move bit 2 value into bit 0 of BL register
                        ; now we have the binary value of each bit in BL, in bit 0 location
    AND BL,firstGate    ; AND the value in BL register with the value stored in firstGate, result in BL
    NOT BL              ; invert bits for the not part of nand
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    mov secondGate,BL   ; copy the value to the secondGate variable
    
   
    
    mov BL,AL           ; copy of input bits into BL
    AND BL,00001000B    ; mask off all bits except input bit 3
    SHR BL,3            ; move bit 3 value into bit 0 of BL register
                        ; now we have the binary value of each bit in BL, in bit 0 location
    NOT BL              ; NOT the value in BL register
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    mov thirdGate,BL    ; copy the value to the thirdGate variable
    
   
    
    mov BL,thirdGate    ; copy the value stored in thirdGate to BL
    mov CL,secondGate   ; copy the value stored in secondGate to CL
    OR BL,CL            ; OR these two registers,result in BL
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    mov thirdGate,BL    ; copy the value to the thirdGate variable
    
     
    
    mov BL,AL           ; copy of input bits into BL
    mov CL,AL           ; copy of input bits into CL
    AND BL,00010000B    ; mask off all bits except input bit 4
    AND CL,00100000B    ; mask off all bits except input bit 5
    SHR BL,4            ; move bit 4 value into bit 0 of BL register
    SHR CL,5            ; move bit 5 value into bit 0 of CL register
                        ; now we have the binary value of each bit in BL, in bit 0 location
    XOR BL,CL           ; XOR these two registers, result in BL
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    mov fourthGate,BL   ; copy the value to the fourthGate variable
    
    
    mov BL,thirdGate    ; copy the value stored in thirdGate to BL
    mov CL,fourthGate   ; copy the value stored in fourthGate to CL 
    AND BL,CL           ; AND these two registers, result in BL
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    mov fifthGate,BL    ; copy the value to the fifthGate variable
    
    
    mov BL,AL           ; copy of input bits into BL
    mov CL,AL           ; copy of input bits into CL
    AND BL,01000000B    ; mask off all bits except input bit 6
    AND CL,10000000B    ; mask off all bits except input bit 7
    SHR BL,6            ; move bit 6 value into bit 0 of BL register
    SHR CL,7            ; move bit 7 value into bit 0 of CL register
                        ; now we have the binary value of each bit in BL, in bit 0 location
    OR BL,CL            ; OR these two registers, result in BL
    NOT BL              ; invert bits for the not part of nor
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    mov sixthGate,BL    ; copy the value to the fifthGate variable
    
    
    mov BL,AL           ; copy of input bits into BL
    AND BL,00010000B    ; mask off all bits except input bit 4
    SHR BL,4            ; move bit 4 value into bit 0 of BL register
                        ; now we have the binary value of each bit in BL, in bit 0 location    
    AND BL,sixthGate    ; AND the value in BL register with the value stored in sixthGate, result in BL
    NOT BL              ; invert bits for the not part of nand
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    mov sixthGate,BL    ; copy the value to the sixthGate variable
   
    
    mov BL,fifthGate    ; copy the value stored in fifthGate to BL
    mov CL,sixthGate    ; copy the value stored in sixthGate to CL
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    AND CL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    
    AND BL,CL           ; AND these two registers, result in BL
    NOT BL              ; invert bits for the not part of nand
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    mov seventhGate,BL  ; copy the value to the seventhGate variable
    
    
    mov BL,seventhGate  ; copy the value stored in seventhGate to BL
    NOT BL              ; NOT the value in BL register
    AND BL,00000001B    ; clear all upper bits positions leaving bit 0 either a zero or one
    mov seventhGate,BL  ; copy the value to the seventhGate variable, answer is now here
    
  
    mov AH,2            ; Windows DOS call for printing out the charachter
    mov DL,seventhGate  ; move the answer to the DL register
    add DL,30H          ; add 30H in order to see decimal number
    int 21H
    
    mov AH,4cH          ; exit the program
    int 21H
    
    END STARTGATE
    
    
    
    
    
         
