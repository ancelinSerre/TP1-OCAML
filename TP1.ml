(* Exercice 3 - Création de types composés *)
(*-----------------------------------------*)
type semaine = Lundi | Mardi | Mercredi | Jeudi | Vendredi | Samedi | Dimanche ;;
type point2D = { mutable x : int; mutable y : int} ;;
let origine  = { x=2, y=4} ;;
type segment = { p1 : point2D; p2 : point2D} ;;
type figure  =
| Carre of segment * segment * segment * segment
| Rectangle of segment * segment * segment * segment
| Cercle of segment;;

(* Exercice 4 - Hierarchie de type pour le Uno *)
(*---------------------------------------------*)
type couleur = Vert | Rouge | Bleu | Jaune | Noir ;;
type chiffre = x : int in if x >= 0 && x < 9 x else 0 ;;
type genre   = Chiffre | Piege | Joker ;;
type carte   = genre * couleur * chiffre ;;

(* Exercice 5 - Création de fonctions simples *)
(*--------------------------------------------*)

(* Calcul le cube d'un réel flottant *)
let cube    x = x *. x *. x;;              
(* Entier positif ou non ? *)
let positif x = if x > 0 then true else false;;        
(* Entier pair ou non ? *)
let pair    x = if x mod 2 == 0 then true else false;; 
(* Calcul du signe d'un entier *)
let signe   x = if x > 0 then 1 else if x < 0 then (-1) else 0;;

(* Exercice 6 - Création de fonctions à plusieurs paramètres *)
(*-----------------------------------------------------------*)
let f1 = fun x -> fun y -> fun z -> x * y * z;; (* Produit de 3 entiers, forme curryfiée *)
let f2 = fun x -> fun y -> fun z -> x + y + z;; (* Somme de 3 entiers,   forme curryfiée *)
let f1 x y z = x * y * z;;                      (* Produit de 3 entiers, forme classique *)
let f2 x y z = x + y + z;;                      (* Somme de 3 entiers,   forme classique *)

(* Exercice 7 - Fonctions avancées *)
(*---------------------------------*)

(* Prédicat vérifiant si trois entiers x y z forment un triplet pythagoricien *)
let pytha x y z = 
  if(x*x)+(y*y)=(z*z) || (y*y)+(z*z)=(x*x) || (x*x)+(z*z)=(y*y) then 
    true 
  else 
    false;;

(* Prédicat vérifiant si deux entiers x et y sont de même signe *)
let meme_signe x y = 
  if( x > 0 && y > 0) || (x<0 && y<0) then 
      true
  else 
      false;;

(* Exercice 8 - Différences entre fonction mathématiques et prédicats *)
(*--------------------------------------------------------------------*)

(* Fonction mathématique simple *)
let fonc x y = x + y;;
(* Prédicat simple *)
let fonc x y = if x > 0 && y > 0 then true else false;;

(* Exercice 9 - Fonction calculant le minimum entre deux entiers *)
(*---------------------------------------------------------------*)
let min2entiers x y = if x <= y then x else y;;

(* Exercice 10 - Fonction calculant le minimum entre trois entiers *)
(*-----------------------------------------------------------------*)
let min3entiers x y z = if min2entiers x y <= z then min2entiers x y else z;;

(* Exercice 11 - Fonctions utilisant les types composés *)
(*---------------------------------------------------------------------*)

(* Fonction calculant le point au mileu du segment donné *)
let milieu seg = { x = (seg.p1.x + seg.p2.x) / 2 ; y = (seg.p1.y + seg.p2.y) / 2};;

(* Fonction déterminant si un point appartient ou non à un segment *)
let appartient p seg =
  (* Différents x pour chaque point *) 
  let xA = seg.p1.x in
  let xB = seg.p2.x in
  let xC = p.x      in
  (* Différents y pour chaque point *)
  let yA = seg.p1.y in
  let yB = seg.p2.y in
  let yC = p.y      in
  (* Calcul final pour déterminer si p appartient à seg *)
  if (yA != yB && yC != yA) && (xC <= xB && xC >= xA) then 
      let quotient1 = (xB - xA) / (yB - yA) in
      let quotient2 = (xC - xA) / (yC - yA) in
      if quotient1 = quotient2 then 
        true 
      else 
        false
  else false;; 

(* Exercice 12 - Prédicat déterminant si un jour donnée fait partie du week-end *)
(*------------------------------------------------------------------------------*)
let weekend x = if x = Samedi || x = Dimanche then true else false;;

(* Exercice 13 - Fonction calculant l'aire d'une figure *)
(*------------------------------------------------------*)

(* On a d'abord besoin d'une fonction calculant la distance entre deux points *)
let distance p1 p2 =
  (* Les fonctions mathématiques puissance et racine nécéssitent 
  l'utilisation de rééls flottants ce qui nous oblige à caster nos 
  int en float *)
  let x1 = (float p2.x -. float p1.x) ** 2. in
  let y1 = (float p2.y -. float p1.y) ** 2. in 
  sqrt (x1 +. y1);;

(* On peut maintenant créér la fonction calculant l'aire d'une figure *)
let aire (f : figure) = 
  (* Dans ce cas, on traite des figures donc pour appliquer
  la formule d'aire propre à la figure donnée, 
  on utilise le pattern-matching *)
  match f with
  | Rectangle (s1, s2, s3, s4) ->
      (* Longueur = s1 ; Largeur = s2 *)
      let longueur = distance s1.p1 s1.p2 in
      let largeur  = distance s2.p1 s2.p2 in
      longueur *. largeur
  | Carre (s1, s2, s3, s4) ->
      (* On a besoin d'un seul côté ici ... *)        
      let cote = distance s1.p1 s1.p2 in
      cote ** 2.
  | Cercle (s1) ->
      (* On doit d'abord générer pi avant de calculer l'aire *)
      let pi    = 4. *. (atan 1.) in
      let rayon = distance s1.p1 s1.p2 in
      pi *. (rayon ** 2.);;

(* Exercice 14 - Définir diverses fonctions se rapportant au jeu de Uno *)
(*----------------------------------------------------------------------*)

(* Fonction calculant la valeur d'une carte *)
let valeur carte =
  let genre = carte.g in
  match genre with
  | Chiffre ->
    carte.c 
  | Piege ->
    20
  | _ ->
    50;;

