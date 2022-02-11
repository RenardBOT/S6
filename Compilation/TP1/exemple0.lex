%{
	//Compilation
	//lex -v exemple0.lex
	//gcc -Wall lex.yy.c -o analyseur -lfl
#include <stdio.h>
%}
%%
[0-9]+ { printf("[NOMBRE]");
}
%%

