;QUESARDO
.MODEL SMALL   ;AJUSTAMOS TODOS LOS SEGMENTOS DE CODIGO A 64KB
.STACK         ;SEGMENTO DE PILA
.DATA          ;DECLARAR VARIABLES Y CONSTANTES 
ATRIB  DB  5   ;VALOR DEL COLOR INICIAL (MAGENTA)

.CODE          ;SEGMENTOS DE CODIGO   

 
;PLANIS   
MOV AX, @DATA
MOV DS, AX     ;CARGA DE DATOS (DE DATA)


MOV CX, 1      ;INICIO DEL PUNTERO DE LA LINEA (EN 1 )

MOV AH, 0      ;SERVICIO 0 DE LA INT 10 QUE ACTIVA EL MODO GRAFICO
MOV AL, 13H    ;MODO DE VIDEO VGA (256 COLORES)
INT 10H        ;MODO GRAFICO  

;CHRIS
OTRO:              ;BUCLE QUE TERMINA HASTA QUE CX = 101  
    MOV DX, CX     ;(AJUSTE DE PUNTERO EN EL EJE Y)
    
    MOV AL, ATRIB  ;DEFINE EL COLOR PARA EL PIXEL GRAFICO ACTUAL 
    
    MOV AH, 0CH    ;SERVICIO 0C DE LA INT 10 PARA ESCRIBIR UN PIXEL GRAFICO
    INT 10H  
                            
                 
;YON                 
    CMP CX, 101    ;COMPARA CX HA ALCANZADO EL VALOR DE 101
    JZ FIN         ;CUANDO CX = 101 SALTA A FIN
    INC CX         ;INCREMENTO EN 1 A CX (AJUSTE DE PUNTERO EN EL EJE X)
    ADD ATRIB, 2   ;INCREMENTO EN 2 A ATRIB
    JMP OTRO	   ;RECURSIVIDAD DEL BUCLE "OTRO"

FIN:      
MOV AX, 4C00H  ;SALIDA EXITOSA DEL PROGRAMA
INT 21H
