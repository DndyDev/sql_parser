%{
 #include <stdio.h>
 #include <stdlib.h>
 #include <locale.h>
 #define YYERROR_VERBOSE 1

    int yylex();
    int yywrap();
    extern int line;
    int errCount = 1;

    void yyerror(const char* errStr);

 
%}
%token  CREATE
        GLOBAL
        LOCAL
        TEMPORARY
        TABLE
        ON_COMMIT
        DELETE
        PRESERVE
        ROWS
        FOREIGN_KEY
        UNIQUE
        NOT_NULL
        PRIMARY_KEY
        REFERENCES
        TRIGGER_ACTION
        ON_UPDATE
        ON_DELETE
        VARCHAR
        CHAR
        INTEGER
        NUMERIC
        FLOAT
        REAL
        NUMBER
        TIME
        DATE
        LETTER
        COMMA
        RB
        LB
        SEMICOLON
        IDENTIFIERE
%start base
%%

base:     
    base create SEMICOLON           {printf("-----------------complete----------------- \n");}|
    create SEMICOLON                {printf("-----------------complete----------------- \n");};


create:   
    CREATE first_params TABLE table_name LB elements RB second_params;

first_params:    
    |
    GLOBAL TEMPORARY|
    LOCAL TEMPORARY;

second_params:      
    |
    ON_COMMIT DELETE ROWS |
    ON_COMMIT PRESERVE ROWS;

elements:   
    element |
    elements COMMA element;

element: 
    constaint_def |
    field_def;

constaint_def: 
    unique_constr|
    link_constr;

unique_constr: 
    UNIQUE LB field_list RB        |
    PRIMARY_KEY LB field_list RB   |
    PRIMARY_KEY LB error {yyerror("Wrong PRIMARY KEY decration");} RB;


link_constr: 
    FOREIGN_KEY field_list link_spec;

link_spec: 
    REFERENCES table_name                               |
    REFERENCES table_name LB field_list RB              |
    REFERENCES table_name trigger_act                   |
    REFERENCES table_name LB field_list RB trigger_act  ;


trigger_act:    
    ON_UPDATE TRIGGER_ACTION|
    ON_DELETE TRIGGER_ACTION|
    ON_UPDATE TRIGGER_ACTION ON_DELETE TRIGGER_ACTION;

field_list: 
    field_name                          |
    field_list COMMA field_name    | 
    LB field_list RB               |
    field_list error {yyerror("Need a COMMA in fiels declaration");} field_name;

field_def:  
    field_name field_type | 
    field_name field_type field_constr;

field_constr: 
    constaint |
    field_constr constaint;

field_type:     
    numeric_type  |
    char_type     |
    datetime_type ;


char_type:      
    CHAR LB NUMBER RB     |
    CHAR LB error {yyerror("Wrong CHAR type");} RB  |
    CHAR                  |
    VARCHAR LB NUMBER RB  |
    VARCHAR LB error {yyerror("Wrong VARCHAR type");} RB |
    VARCHAR               ;
    

numeric_type:   
    NUMERIC LB NUMBER COMMA NUMBER RB |
    NUMERIC LB NUMBER RB              |
    NUMERIC LB error {yyerror("Wrong NUMERIC type");} RB  |
    NUMERIC                           |
    INTEGER                           |
    FLOAT LB NUMBER RB                |
    FLOAT                             |
    REAL                              ;


datetime_type:  
    DATE              |
    TIME              |
    TIME LB NUMBER RB ;
    
constaint:
    NOT_NULL | UNIQUE |PRIMARY_KEY;

field_name:
    IDENTIFIERE;

table_name:
    IDENTIFIERE;
%%
    void yyerror(const char* errStr)
    {
        printf("\nerror: %s in line %d, current error: %d \n", errStr, line, errCount);
        errCount++;
        if (errCount > 3) {exit(-1);}
    }
