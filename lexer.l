%{
    // ToDo: Разбить токены до минимума
    int line = 1;
    int yylex();
    void yyerror(char *);
%}


digit                   [0-9]
letter                  [a-zA-Z]
number                  {digit}+
indentifier             ({letter}|_)({digit}|_|{letter})*

%%
CREATE       printf("<CREATE>");
GLOBAL       printf("<GLOBAL>");
LOCAL        printf("<LOCAL>");
TEMPORARY    printf("<TEMPORARY>");
TABLE        printf("<TABLE>");
ON\ COMMIT   printf("<ON COMMIT>");
DELETE       printf("<DELETE>");
RESERVE      printf("<RESERVE>");
ROWS         printf("<ROWS>");
FOREIGN\ KEY printf("<FOREIGN KEY>");

REFERENCES   printf("<REFERENCES>");
ON\ UPDATE   printf("<ON UPDATE>");
ON\ DELETE   printf("<ON DELETE>");

CASCADE|SET\ NULL|SET\ DEFAULT|NO\ ACTION  printf("<TRIGGER ACTION>");
CHAR|VARCHAR(\({number}\))                 printf("<TYPE STRING>");
NUMERIC(\({number}(,(\ )?{number})?\))? |     
INTEGER                                 |
FLOAT(\({number}\))?                    |
REAL                                        printf("<TYPE NUMBER>");
(DATE|TIME)(\({number}\))?                  printf("<TYPE TIME>");
NOT\ NULL|PRIMARY\ KEY|UNIQUE               printf("<CONSRTAINT>");
{indentifier}                                printf("<INDENTIFIER>");
{number}                                    printf("<NUMBER>");
,                                           printf("<COMMA>");
\n                                          {
                                                printf("\n");
                                                line++;
                                            }
\)                                          printf("<RB>");
\(                                          printf("<LB>");
\;                                          printf("SEMICOLOM");
[ \t]+                                      printf(" ");
.                                           {
                                                yyerror(yytext);
                                            };

%%
void yyerror(char *s){
    printf("\nERROR: illegal symbol on line: %d.\n", line);
    exit(1);
}