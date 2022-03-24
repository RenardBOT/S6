%{
	//Compilation
	//lex -v exemple0.lex
	//gcc -Wall lex.yy.c -o analyseur -lfl
#include <stdio.h>
int compteur = 0;
%}
%%
[0-9]+ { printf("[NOMBRE]");
		 compteur++;
}

^[a-zA-Z]+(" "[a-zA-Z]+)+"."$ {
	printf("[PHRASE]") ;
} 



%%
yywrap(){
	printf("Quantité de nombres : %d\n ",compteur);
	return(1);
}  

