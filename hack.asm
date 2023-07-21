    org 0
    incbin "sf2sce.md"

    ; skip checksum check
    org $8138
            nop

    ; make the game think you're on difficulty 7
    ; for the decision tree that determines the type of ending
    org $e5d4
            moveq       #7, d0
            nop

    org $e614
            jsr         my_code

    ; increment the real difficulty, not the difficulty 7 from above
    org $2ce00
my_code:
            move.b      $fffe44, d0
            addq.b      #1, d0
            cmpi.b      #8, d0
            rts
