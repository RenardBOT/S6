%{
	//Compilation
	//lex -v exemple0.lex
	//gcc -Wall lex.yy.c -o analyseur -lfl
	//SOUS-CATEGORIES : titre = 1 , normal = 2 , item = 3

#include <stdio.h>

int TAB[100][4];
int position = 1;
int it = 0;
int level = 0;
%}

RETOURLIGNE \n|(\r\n)

%start TITRE
%start ITEM

%%

<INITIAL>^" "{0,3}\#{1,6}" "+ {
	level = titleLevel();
	BEGIN TITRE;
}

<TITRE>{RETOURLIGNE} {
	printf("Fin titre\n");
}

<TITRE>({RETOURLIGNE}" "*){2,} {
	printf("Fin titre\n");
}

<INITIAL>({RETOURLIGNE}" "*){2,} {
	printf("Ligne vide\n");
}

<INITIAL>^\*" "+ {
	printf("Debut de liste\n");
	BEGIN ITEM;
}

<ITEM>^\*" "+ {
	printf("item de liste\n");
}

<ITEM>({RETOURLIGNE}" "*){2,} {
	printf("Fin de liste\n");
}

"*" {
	printf("ETOILE\n");
}

<INITIAL>[^" "\t#\*_\n\r][^#\*\n\r]+ {
	printf("TEXTE : %s [index : %d]\n", yytext,fillTab(position,yyleng,2,0));
}

<TITRE>[^" "\t#\*_\n\r][^#\*\n\r]+ {
	printf("TEXTE [index : %d]\n", fillTab(position,yyleng,1,level));
	BEGIN INITIAL;
}

<ITEM>[^" "\t#\*\n\r][^#\*\n\r]+ {
	printf("TEXTE [index : %d]\n", fillTab(position,yyleng,3,0));
	BEGIN INITIAL;
}

[" "\t] {

}

. {
	printf("Caractère non reconnu\n");
}
%%

int fillTab(int pos, int lg, int sscat, int niveau){
	TAB[it][0] = pos;
	TAB[it][1] = lg;
	TAB[it][2] = sscat;
	TAB[it][3] = niveau;
	position += yyleng ;
	return it++;
} 

int titleLevel(){
	char * in = yytext;
	int out = 0;
	for(int i = 0 ; i < yyleng ; i++)
		if(in[i] == '#')
			out++;
	return out;
} 

void printTAB(){
	printf("pos\t|\tlg\t|\tsscat\t|\tlv title\n");
	for(int i = 0 ; i < it ; i++)
		printf("%d\t|\t%d\t|\t%d\t|\t%d\n",TAB[i][0],TAB[i][1],TAB[i][2],TAB[i][3]);
} 

int yywrap(){
	printTAB();
	return 1;
} 