%%% @doc This macro converts hyphenised symbol string into undescored one.
%%% @author Damian T. Dobroczy\\'nski <qoocku@gmail.com>
%%% @since 2014-05-29

-ifndef (LFE_EXTENSION_UNHYPHEN_SYMBOL).
-define (LFE_EXTENSION_UNHYPHEN_SYMBOL, true).

-define (unhyphen_symbol(S),
		 case S of
		   "-" -> "-" ;
		    _ -> [case C of $- -> $_ ; C -> C end || C <- S]
		 end).

-endif.
