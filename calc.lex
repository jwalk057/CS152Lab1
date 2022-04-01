   /* cs152-calculator */
   
%{   
   /* write your C code here for defination of variables and including headers */
int currLine =1, currPos=1;
int numOp =0, numInt =0, numParen =0, numEq =0;
%}


   /* some common rules, for example DIGIT */
DIGIT    [0-9]
   
%%
   /* specific lexer rules in regex */

"="            {printf("EQUAL\n"); numEq++; }
"+"            {printf("PLUS\n"); numOp++;}
"-"            {printf("MINUS\n"); numOp++;}
"*"            {printf("MULT\n"); numOp++;}
"/"            {printf("DIV\n"); numOp++;}
"("            {printf("L_PAREN\n"); numParen++;}
")"            {printf("R_PAREN\n"); numParen++;}
{DIGIT}+       {printf("NUMBER %s\n", yytext); numInt++;}

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
	printf("Number of integers: %d\n", numInt);
	printf("Number of operands: %d\n", numOp);
	printf("Number of equals: %d\n", numEq);
	printf("Number of parenthesis: %d\n", numParen);
}

