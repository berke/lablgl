(* $Id: var2switch.ml,v 1.5 2001-05-08 01:58:25 garrigue Exp $ *)

(* Build a switch statement translating variants to C tags *)

open Genlex

let lexer = make_lexer ["->"; "$$"]

let main () =
  let table = ref false and prefix = ref "" and tag_number = ref 0 in
  Arg.parse
    ["-table", Arg.Set table, " Produce table output"]
    (fun s -> prefix := s)
    "";
  let s = lexer (Stream.of_channel stdin) in
  try
    while true do
      match Stream.npeek 1 s with
      | [Ident tag] ->
	 Stream.junk s;
	 incr tag_number;
	 print_string (if !table then "    {MLTAG_" else "    case MLTAG_");
	 print_string tag;
	 print_string (if !table then ", " else ":\treturn ");
	 let name =
	   (* match s with parser *)
	   (*     [< ' Kwd "->" ; ' Ident name >] -> name *)
	   (*   | [< >] -> !prefix ^ String.uppercase tag *)
	   match Stream.npeek 2 s with
	   | [Kwd "->"; Ident name] -> Stream.junk s; Stream.junk s; name
	   | _ -> !prefix ^ String.uppercase_ascii tag
	 in
	 print_string name;
	 print_string (if !table then "},\n" else ";\n")
      | [Kwd "$$"] -> Stream.junk s; raise End_of_file
      | _ -> raise End_of_file
    done with End_of_file ->
    Printf.printf "#define TAG_NUMBER %d\n" !tag_number

let _ = Printexc.print main ()
