(* $Id: var2switch.ml,v 1.1 1998-01-05 06:32:47 garrigue Exp $ *)

(* Build a switch statement translating variants to C tags *)

open Genlex

let lexer = make_lexer ["->"]

let main () =
  let s = lexer (Stream.of_channel stdin) in
  try while true do match s with parser
      [< ' Ident tag >] ->
	print_string "    case MLTAG_";
	print_string tag;
	print_string ":\treturn ";
	let name =
	  match s with parser
	      [< ' Kwd "->" ; ' Ident name >] -> name
	    | [< >] -> Sys.argv.(1) ^ String.uppercase tag
	in print_string name;
	print_string ";\n"
    | [< >] -> raise End_of_file
  done with End_of_file -> ()

let _ = Printexc.print main ()
