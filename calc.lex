   /* cs152-calculator */
   
%{   
   /* write your C code here for defination of variables and including headers */
%}


   /* some common rules, for example DIGIT */
DIGIT    [0-9]
   
%%
   /* specific lexer rules in regex */

"="            {printf("EQUAL\n"); }
"+"            {printf("PLUS\n"); }
"-"            {printf("MINUS\n"); }
"*"            {printf("MULT\n"); }
"/"            {printf("DIV\n"); }
"("            {printf("L_PAREN\n"); }
")"            {printf("R_PAREN\n"); }
{DIGIT}+       {printf("NUMBER %s\n", yytext); }

%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
}

