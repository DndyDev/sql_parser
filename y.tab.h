/* A Bison parser, made by GNU Bison 3.8.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    CREATE = 258,                  /* CREATE  */
    GLOBAL = 259,                  /* GLOBAL  */
    LOCAL = 260,                   /* LOCAL  */
    TEMPORARY = 261,               /* TEMPORARY  */
    TABLE = 262,                   /* TABLE  */
    ON_COMMIT = 263,               /* ON_COMMIT  */
    DELETE = 264,                  /* DELETE  */
    PRESERVE = 265,                /* PRESERVE  */
    ROWS = 266,                    /* ROWS  */
    FOREIGN_KEY = 267,             /* FOREIGN_KEY  */
    UNIQUE = 268,                  /* UNIQUE  */
    NOT_NULL = 269,                /* NOT_NULL  */
    PRIMARY_KEY = 270,             /* PRIMARY_KEY  */
    REFERENCES = 271,              /* REFERENCES  */
    TRIGGER_ACTION = 272,          /* TRIGGER_ACTION  */
    ON_UPDATE = 273,               /* ON_UPDATE  */
    ON_DELETE = 274,               /* ON_DELETE  */
    VARCHAR = 275,                 /* VARCHAR  */
    CHAR = 276,                    /* CHAR  */
    INTEGER = 277,                 /* INTEGER  */
    NUMERIC = 278,                 /* NUMERIC  */
    FLOAT = 279,                   /* FLOAT  */
    REAL = 280,                    /* REAL  */
    NUMBER = 281,                  /* NUMBER  */
    TIME = 282,                    /* TIME  */
    DATE = 283,                    /* DATE  */
    LETTER = 284,                  /* LETTER  */
    COMMA = 285,                   /* COMMA  */
    RB = 286,                      /* RB  */
    LB = 287,                      /* LB  */
    SEMICOLON = 288,               /* SEMICOLON  */
    IDENTIFIERE = 289              /* IDENTIFIERE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define CREATE 258
#define GLOBAL 259
#define LOCAL 260
#define TEMPORARY 261
#define TABLE 262
#define ON_COMMIT 263
#define DELETE 264
#define PRESERVE 265
#define ROWS 266
#define FOREIGN_KEY 267
#define UNIQUE 268
#define NOT_NULL 269
#define PRIMARY_KEY 270
#define REFERENCES 271
#define TRIGGER_ACTION 272
#define ON_UPDATE 273
#define ON_DELETE 274
#define VARCHAR 275
#define CHAR 276
#define INTEGER 277
#define NUMERIC 278
#define FLOAT 279
#define REAL 280
#define NUMBER 281
#define TIME 282
#define DATE 283
#define LETTER 284
#define COMMA 285
#define RB 286
#define LB 287
#define SEMICOLON 288
#define IDENTIFIERE 289

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
