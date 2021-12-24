%{
    // ToDo: Разбить токены до минимума
    #include "yacc.tab.h"
    int line = 1;
%}


digit                   [0-9]
letter                  [a-zA-Z]
number                  {digit}+
identifiere              ({letter}|_)({digit}|_|{letter})*

%%
CREATE       {printf("CREATE"); return (CREATE);}
GLOBAL       {printf("GLOBAL"); return (GLOBAL);}
LOCAL        {printf("LOCAL"); return (LOCAL);}
TEMPORARY    {printf("TEMPORARY"); return (TEMPORARY);}
TABLE        {printf("TABLE");return (TABLE);}
ON\ COMMIT   {printf("ON_COMMIT"); return (ON_COMMIT);}
DELETE       {printf("DELETE"); return (DELETE);}
PRESERVE     {printf("PRESERVE"); return (PRESERVE);}
ROWS         {printf("ROWS"); return (ROWS);}
FOREIGN\ KEY {printf("FOREIGN_KEY"); return (FOREIGN_KEY);}
UNIQUE       {printf("UNIQUE"); return (UNIQUE);}
PRIMARY\ KEY {printf("PRIMARY_KEY"); return (PRIMARY_KEY);}
NOT\ NULL    {printf("NOT_NULL"); return(NOT_NULL);}
CASCADE      |
SET\ NULL    |
SET\ DEFAULT |
NO\ ACTION   {printf("TRIGGER_ACTION"); return(TRIGGER_ACTION);}
REFERENCES   {printf("REFERENCES"); return (REFERENCES);}
ON\ UPDATE   {printf("ON_UPDATE"); return (ON_UPDATE);}
ON\ DELETE   {printf("ON_DELETE"); return (ON_DELETE);}
VARCHAR      {printf("VARCHAR"); return(VARCHAR);}
CHAR         {printf("CHAR"); return(CHAR);}
INTEGER      {printf("INTEGER"); return(INTEGER);}
NUMERIC      {printf("NUMERIC"); return (NUMERIC);}
FLOAT        {printf("FLOAT"); return(FLOAT);}
REAL         {printf("REAL"); return(REAL);}
TIME         {printf("TIME"); return(TIME);}
DATE         {printf("DATE"); return(DATE);}
{number}     {printf("NUMBER"); return(NUMBER);}
{letter}     {printf("LETTER"); return (LETTER);}
{identifiere} {printf("IDENTIFIERE"); return (IDENTIFIERE);}
,                                           {printf("COMMA"); return  (COMMA);}
\n                                          {
                                                printf("\n");
                                              line++;
                                            };
\)                                          {printf("RB"); return  (RB);}
\(                                          {printf("LB"); return  (LB);}
\;                                          {printf("SEMICOLON"); return  (SEMICOLON);}
[ \t]+                                      printf(" ");
.                                           yyerror("Unexpected symbol");

%%

 int main(int argc, char* argv[]) {
  FILE* myfile = fopen("test.txt", "r");
  if (!myfile) {
    printf("Problem ;with opening file!");
    return -1;
  }
  yyin = myfile;
  
  yyparse();
  return(0); 
}

int yywrap(){
    return(1);
}