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
type chiffre = int ;;
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

(* Prédicat indiquant si un entier est un chiffre ou non *)
let is_digit x = 
  if x >= 0 && x <= 9 then
      true
  else
      false;;

(* On ajoute également une exception pour gérer ce cas dans la fonction suivante *)
exception Not_a_digit;;

(* Fonction calculant la valeur d'une carte *)
let valeur carte =
  let genre = carte.gen in
  match genre with
    | Chiffre ->
      let d = carte.digit in
        (* Vérification de la valeur de l'objet digit de la carte *)
        if is_digit d then
          d
        else
          raise Not_a_digit  
    | Piege -> 20
    | Joker -> 50;;

(* Determiner si le joueur suivant peut jouer ou non *)
let peut_jouer carte = 
  let genre = carte.gen in
  match genre with
    | Chiffre -> true
    | Joker -> if carte.digit = 0 then true else false
    | Piege -> false;;

(* Faire une fonction afin de déterminer si le joueur peut 
poser sa carte sur celle présente sur la pile *)
let peut_pose_carte x y = 
  (* Même couleur OU type Chiffre et même chiffre *)
  if x.col = y.col || (x.gen = Chiffre && y.gen = Chiffre && x.digit = y.digit) then
      true
  else 
      false;;

  (* Définir un type pour un jeu de 54 cartes standard, et des 
  fonctions de traduction entre les deux types de cartes lorsque c’est possible *)
  (*TODO*)

(* Exercice 15 - Travailler avec des listes et des fonctions récursives *)
(*----------------------------------------------------------------------*)

(* On définit au préalable un type liste *)
type listent = Nil | Cons of int * listent;;

(* Exemple d'utilisation *)
let rec longueur l = 
    match l with
        | Nil -> 0
        | Cons(x, s) -> 1 + longueur s

(* Calcul de la somme d'une liste d'entier *)
let rec somme liste =
  match liste with 
      | Nil -> 0 
      | Cons(x, s) -> x + somme s;;

(* Déterminer si l'ensemble des entiers d'une liste sont positifs *)
let rec pos liste =
  match liste with
      | Nil -> true 
      | Cons(x, s) -> if x > 0 then pos s else false;;

(* Ajout d'un élément en fin de liste *)
let rec ajout liste item =
  match liste with 
      | Nil -> Cons(item, Nil) 
      | Cons(x, s) -> Cons(x, ajout s item);;

(* Concaténation de deux listes *)
let rec concat liste1 liste2 = 
  match liste1 with 
      | Nil -> liste2 
      | Cons(x, s) -> Cons(x, concat s liste2);;

(* Exercice 16 - Encore du Uno *)
(*-----------------------------*)

(* Définir une liste de carte (main de carte) *)
type listecarte = Nil | Cons of carte * listecarte;;

(* Calculer la valeur d'une main de carte *)
let main_v liste = 
  match liste with 
      | Nil -> 0 
      | Cons(x,s) -> valeur x + main_v s;;

(* Déterminer les cartes pouvant être jouées sur une carte donnée *)
(* TODO *)

(* Déterminer si les cartes d'une main peuvent être jouées à la suite
dans l'ordre de la main *)
(* TODO *)