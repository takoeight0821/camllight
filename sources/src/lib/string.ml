(* Operation on strings, with sanity checks *)

#open "bool";;
#open "eq";;
#open "int";;
#open "exc";;

let create_string n =
  if n < 0 || n > sys__max_string_length
  then invalid_arg "create_string"
  else fstring__create_string n
;;

let make_string n c =
  if n < 0 || n > sys__max_string_length
  then invalid_arg "make_string"
  else fstring__make_string n c
;;

let nth_char s n =
  if n < 0 || n >= string_length s
  then invalid_arg "nth_char"
  else fstring__nth_char s n
;;
let set_nth_char s n c =
  if n < 0 || n >= string_length s
  then invalid_arg "set_nth_char"
  else fstring__set_nth_char s n c
;;

let index_char s start len c =
  let l = string_length s
  and lim = start + len in
  if start < 0 || len < 0 || lim > l then invalid_arg "index_char" else
  let rec pos p =
   if p >= lim then raise Not_found else
   if s.[p] == c then p else pos (succ p) in
  pos start
;;

let rev_index_char s start len c =
  let l = string_length s
  and lim = start - len in
  if lim < -1 || len < 0 || start >= l then invalid_arg "rev_index_char" else
  let rec pos p =
   if p <= lim then raise Not_found else
   if s.[p] == c then p else pos (pred p) in
  pos start
;;

let fill_string s start len c =
  if start < 0 || len < 0 || start+len > string_length s
  then invalid_arg "fill_string"
  else fstring__fill_string s start len c
;;

let blit_string src start_src dst start_dst len =
  if start_src < 0 || start_src + len > string_length src
  || start_dst < 0 || start_dst + len > string_length dst
  || len < 0
  then invalid_arg "blit_string"
  else fstring__blit_string src start_src dst start_dst len
;;

let prefix ^ = fstring__prefix ^
;;

let concat = fstring__concat
;;

let sub_string s start len =
  if start < 0 || len < 0 || start+len > string_length s
  then invalid_arg "sub_string"
  else fstring__sub_string s start len
;;

let replace_string dest src pos =
  if pos < 0 || pos + string_length src > string_length dest
  then invalid_arg "replace_string"
  else fstring__replace_string dest src pos
;;

let string_for_read = fstring__string_for_read
;;
