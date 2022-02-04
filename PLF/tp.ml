let l=[1;2;3;4];;
let l'=[1;2]@[3;4];;
let l''=1::2::[3;4];; 

let rec pairs l = match l with 
| [] -> [] 
| t::q ->   if 0 = t mod 2
            then t::(pairs q)
            else pairs q;;

let rec iaj i j =
    if i > j then [] 
    else i::(iaj (i+1) j);;

(* Fonction filtrer *)
let rec filtrer pred l = match l with 
| [] -> [] 
| t::q ->   if pred t
            then t::(filtrer pred q)
            else filtrer pred q;;

(* Fonction concaténation *)

let rec concat a b =
if [] = b then a else match a with 
| [] -> b
| ta::qa -> ta::(concat qa b);;   

let rec lalea n =
    if 0 = n then [] 
    else (Random.int 1000)::(lalea(n-1));;

let rec qksort cmp l = match l with
|[] 
|[_] -> l
| t::q ->   let pp = filtrer(function v -> cmp v t < 0) l in
            let pg = filtrer(function v -> cmp v t > 0) l in
            let eg = filtrer(function v -> cmp v t = 0) l in
            concat(qksort cmp pp)(concat eg (qksort cmp pg));;

let rec reverse l = 
	match l with 
		| t::q -> concat (reverse q) [t];;

let rec rev l pile =
	match l with
		| [] -> pile
		| h::t -> rev t (h::pile);;

let concat2 a b =
	rev (rev b (rev a [])) [];;

let rec iaj2 i j l = 
    if i>j then l
    else iaj2 i(j-1)(j::l);;

let rec digits base n l =
	if n=0 then l
	else
		digits base (n/base) ((n mod base)::l);;

let rec foldl op ter l = 
	match l with 
		| [] -> ter
		| t::q -> foldl op (op  ter t) q;;

let rec trinaif cmp l = 
	match l with
		| [] | [] -> l
		| t::q ->
			let pp = foldl (fun a b -> if cmp a b < 0 then a else b) t q in
			pp::(trinaif cmp (remfirst pp l));; 