goal: command_list;
arg_list:
        arg_list WORD
        | /* empty */
                ;
cmd_and_args:
        WORD arg_list
                ;
pipe_list:
         pipe_list PIPE cmd_and_args
         | cmd_and_args
         ;

io_modifier:
           GREATGREAT Word /* why randomly Upper then lower? */
           | GREAT Word
           | GREATGREATAMP Word
           | GREATAMP Word
           | LESS Word
           ;
io_modifier_list:
                io_modifier_list io_modifier
                | /*empty*/
                ;
background_optional:
                   AMP
                   | /* empty */
                   ;
command_line:
        pipe_list io_modifier_list background_opt NEWLINE
        | NEWLINE /* accept empty cmd line */
        | error NEWLINE{yyerrok;}
                        /* error recover */

command_list:
            command_list command_line
            ; /* command loop*/

