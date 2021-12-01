%{

    int line = 1;

%}

digit                   [0-9]
char                    [A-Za-z]
number                  {digit}+
indentifier             ({char}|_)({digit}|_|{char})*

%%

CREATE                  printf("CREATE");
GLOBAL      |
LOCAL                   printf("GLOB_LOC");
TEMPORARY               printf("TEMPORARY");
TABLE                   printf("TABLE");

ON\ COMMIT              printf("ON_COMMIT");
DELETE      |
PRESERVE                printf("DELETE_PRESERVE");
ROWS                    printf("ROWS");
REFERENCES              printf("REFERENCES");
FOREIGN\ KEY            printf("FOREIGN_KEY");
ON\ UPDATE              printf("ON_UPDATE");
ON\ DELETE              printf("ON_DELETE");
NOT\ NULL   |
UNIQUE      |
PRIMARY{" "}+KEY            printf("CONSRTAINT");
CASCADE     |
SET\ NULL   |
SET\ DEFAULT |
NO\ ACTION                                  printf("TRIGGER_ACTION");

(DATE|TIME)(\({number}\))?                  printf("TYPE_DATETIME");
NUMERIC(\({number}(,(\ )?{number})?\))? |     
INTEGER                                 |
FLOAT(\({number}\))?                    |
REAL                                        printf("TYPE_NUMERIC");
(CHAR|VARCHAR)(\({number}\))?               printf("TYPE_CHAR");

{indentifier}           printf("INDENTIFIER");
{number}                printf("NUMBER");

,           printf("COMMA");
\n          {
                printf("\n"); 
                line++; 
            };
[ \t]+      printf(" ");
\(          printf("LB");
\)          printf("RB");
\;          printf("SEMICOLOM");
.           {yyerror(yytext);};
                    

%%

void yyerror(char *s){
    printf("\n ERROR LINE %d: %s \n ", line, s);
}

int main(int argc, char **av){

    if(argc == 2 && (yyin = fopen(av[1], "r")) == NULL){
        perror(av[1]);
        exit(1);
    }
    yylex();
    exit(0);
}

yywrap(){
    return(1);
}







