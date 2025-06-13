(* Taken from the Zarith library.
   It is distributed under LGPL 2 licensing, with static linking exception.
   See the LICENSE file included in the distribution.
   Contributed by Christophe Troestler.
   Adapted to Num by Xavier Leroy.
*)

open Printf

let eval_string
      ?(print_outcome = false) ?(err_formatter = Format.err_formatter) str =
  let lexbuf = Lexing.from_string str in
  let phrase = !Toploop.parse_toplevel_phrase lexbuf in
  Toploop.execute_phrase print_outcome err_formatter phrase

let printers = [
  "nat_printer";
  "big_int_printer";
  "ratio_printer";
  "num_printer";
]

let () =
  let ok =
    List.for_all
      (fun p -> eval_string(sprintf "#install_printer Num_top_printers.%s;;" p))
      printers in
  if not ok then Format.eprintf "Problem installing Num printers@."
