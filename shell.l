%{

#include <string.h>
#include "y.tab.h"

%}

%%

\n {
    return NEWLINE;
}

\[ \t] {
    // discard spaces and tabs
}

">" {
    return GREAT;
}

"<" {
    return LESS;
}

">>" {
    return GREATGREAT;
}

">&" {
    return GREATAMP;
}

"|" {
    return PIPE;
}

"&" {
    return AMP;
}

[^ \t\n][^ \t\n]* {
    // any 1 or more non space/tabe/newline chars in a row
    yylval.string_val = strdup(yytext);
    // yytext is what's passed into this code
    // yylval i think is how we get it out and access it
    return WORD;
}

/* more tokens */
">>&" {
    return GREATGREATAMP;
}

. {
    // invalid char
    return NOTOKEN;
}

%%

