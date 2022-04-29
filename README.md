# VGA Graphics Mode Pixel Drawer in Assembly

This repository contains an assembly language project that demonstrates basic graphics programming in VGA mode. The program sets the video mode to 256-color graphics, then draws a series of colored pixels across the screen using BIOS interrupts.

## Features

- **VGA Graphics Mode Setup**: Initializes the screen to 256-color graphics mode (13h).
- **Pixel Drawing**: Draws pixels on the screen with increasing color values.
- **Loop and Conditional Logic**: Uses loops and conditional jumps to control pixel drawing and program flow.

### Code Snippets

#### Initial Setup
The program sets up the data segment and initializes the VGA graphics mode.

```assembly
.MODEL SMALL   ; Adjust code segments to 64KB
.STACK         ; Stack segment
.DATA          ; Declare variables and constants
ATRIB  DB  5   ; Initial color value (magenta)

.CODE          ; Code segments

MOV AX, @DATA
MOV DS, AX     ; Load data segment

MOV CX, 1      ; Initialize pointer for line

MOV AH, 0      ; Service 0 of INT 10 to set video mode
MOV AL, 13H    ; VGA mode (256 colors)
INT 10H        ; Set graphics mode
```

#### Pixel Drawing Loop

The program draws pixels in a loop, adjusting the color and position for each iteration.

```assembly
OTRO:              ; Loop until CX reaches 101
    MOV DX, CX     ; Adjust pointer on Y axis
    MOV AL, ATRIB  ; Set color for current pixel
    
    MOV AH, 0CH    ; Service 0C of INT 10 to write a pixel
    INT 10H        ; Draw pixel
                 
    CMP CX, 101    ; Check if CX has reached 101
    JZ FIN         ; Jump to FIN if true
    INC CX         ; Increment CX (adjust pointer on X axis)
    ADD ATRIB, 2   ; Increment ATRIB by 2
    JMP OTRO       ; Repeat loop
```

#### Program Exit

The program exits cleanly after drawing the pixels.

```assembly
FIN:
MOV AX, 4C00H  ; Successful exit
INT 21H
```

### Usage

1.  Assemble and link the code using an assembler (e.g., TASM, MASM).
2.  Run the executable.
3.  The program will enter VGA graphics mode and draw a series of colored pixels on the screen.

### Memory Variables

-   `ATRIB`: Stores the current color value for pixel drawing.
-   `CX`: Loop counter and pointer for pixel position.