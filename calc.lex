   /* cs152-calculator */
   
%{   
   /* write your C code here for defination of variables and including headers */
int currLine =1, currPos=1;
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

.	{printf("ERROR at line %d, column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext); exit(0);}
"\n"	{currLine++; currPos=1;}
%%
	/* C functions used in lexer */

int main(int argc, char ** argv)
{
	if(argc >=2){
		yyin = fopen(argv[1],"r");
		if(yyin == NULL){
			yyin = stdin;
		}
	}
	else yyin = stdin;
   yylex();
}

