open OUnit2
open Lexer

let lexbuf = Lexing.from_string

let test_var _ = 
  let lb = lexbuf "var" in 
  let tok1 = Lexer.next_token lb in  	
  assert_equal tok1 Var	

let test_ident _ = 
  let lb = lexbuf "var vart" in 
  let tok1 = Lexer.next_token lb |> ignore; Lexer.next_token lb in 
  assert_equal tok1 (Ident "vart")

let suite =
  "lexer tests" >:::
  ["test_var">:: test_var;
   "test_ident" >:: test_ident]

let () =
  run_test_tt_main suite