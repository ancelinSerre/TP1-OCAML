# TP1 - Programmation Fonctionnelle
**Auteurs** : Baptiste Bouvier et Ancelin Serre \
**Date** : 07/09/2018 \
**Polytech INFO4**

**Site du TP :** [lien vers le TP1](http://www-verimag.imag.fr/~wack/APF/Poly-TP-18-19.pdf) \
**Cours utiles pour ce TP:**
- [Cours 1](http://www-verimag.imag.fr/~wack/APF/Cours01.pdf)
- [Cours 2](http://www-verimag.imag.fr/~wack/APF/Cours02.pdf)
  
*Note: un fichier OCaml (.ml) est présent dans le dépôt afin de jouer nos bouts de codes plus rapidement.*

-----
## Exercice 1
Voir sujet de TP, il s'agissait d'exécuter des commandes simples en OCaml.

## Exercice 2
Evaluer chacune des expressions suivantes, observer les messages d'erreur et expliquer chacun d'entre eux. \
\
Premier extrait de code :
```ocaml
let pi_sur_4 = 3.14 / 4;;
```

On obtient le message d'erreur suivant : \
`Error: This expression has type float but an expression was expected of type` \
\
Cela s'explique par le fait que l'on a oublié le `.` juste après le symbole de division. On a `symbole /` on aurait du avoir `symbole /.` Dans notre cas on fait une division entière en donnant des réels ce qui ne peut donc pas fonctionner !  \
\
Deuxième extrait de code :

```ocaml
let dans_l_ordre = 1 < 2 < 3
```
On obtient le message d'erreur suivant : \
`Error: This expression has type int but an expression was expected of type bool` \
\
Cela s'explique par le fait que OCaml calcule en premier `1 < 2` ce qui renvoie `false`. On essaye ensuite de calculer `false < 3` ce qui ne peut donc pas fonctionner car on compare un `bool` avec un `int`. \
\
Troisième extrait de code :
```ocaml
let positif = let a = 42 in if a >= 0 then true
```
On obtient le message d'erreur suivant : \
`Error: This variant expression is expected to have type unit, the constructor true does not belong to type unit` \
\
Cela s'explique par le fait qu'il manque un `else` à notre `if`. \
\
Quatrième extrait de code :
```ocaml
let double_absolu = let x = -2.7 in (if (x < 0) then x else -x) *. 2
```
On obtient le message d'erreur suivant : \
\
Plusieurs erreurs dans ce extrait:
- il faut remplacer `0` par `0.0`
- il faut remplacer `-x` par `-.x` car on traite des floats
- il faut enfin remplacer `2` par `2.0`

## Exercice 3

1) Définir un type **semaine** dont les éléments permettent de représenter chaque jour de la semaine.

```ocaml
type semaine = Lundi | Mardi | Mercredi | Jeudi | Vendredi | Samedi | Dimanche ;;
type semaine =
        Lundi
    |   Mardi
    |   Mercredi
    |   Jeudi
    |   Vendredi
    |   Samedi
    |   Dimanche
```
2) Définir un type **point2D** qui permet de représenter les points du plan.
```ocaml
type point2D = { mutable x : int; mutable y : int};;
```
3) Définir un identifiant de type **point2D** qui représente l'origine de repère
```ocaml
let origine  = { x=2, y=4};;
```
4) Définir un type **segment** (à l'aide du précédent).
```ocaml
type segment = { p1 : point2D; p2 : point2D};;
```
5) Définir un type somme **figure** pour représenter les figures géométriques carré, rectangle et cercle.
```ocaml
type figure  = 
| Carre of segment * segment * segment * segment
| Rectangle of segment * segment * segment * segment
| Cercle of point2D;;
```

## Exercice 4
Développement d'un jeu **Uno** pour illustrer les types composés.
```ocaml
type couleur = Vert | Rouge | Bleu | Jaune | Noir;;
type genre = Chiffre | Piege | Joker;;
type carte = {g : genre; color : couleur ; c : int};;
```
Pour le jeu de Uno, on propose la hiérarchie de types suivante :
- Piege et 0 -> passe ton tour
- Piege et 1 -> changement de sens
- Piege et 2 -> Plus 2
- Joker et 0 -> changement de couleur (couleur Noire obligatoire)
- Joker et 1 -> plus 4 (couleur Noire obligatoire)

## Exercice 5
1) Faire une fonction qui calcule le cube d'un réel.
```ocaml
let cube x = x *. x *. x;;
```
2) Faire une fonction qui calcule si un entier est positif.
```ocaml
let positif x = if x > 0 then true else false;;
```
3) Faire une fonction qui calcule si un entier est pair.
```ocaml
let pair x = if x mod 2 == 0 then true else false;;
```
4) Faire une fonction qui calcule le signe d'un entier.
```ocaml
let signe x = if x > 0 then 1 else if x < 0 then (-1) else 0;;
```

## Exercice 6
1) Produit de 3 entiers sous la forme d'une fonction curryfiée.
```ocaml
let f1 = fun x -> fun y -> fun z -> x * y * z;;
```
2) Somme de 3 entiers sous la forme d'une fonction curryfiée.
```ocaml
let f2 = fun x -> fun y -> fun z -> x + y + z;;
```

## Exercice 7
1) Fonction qui determine si un triplet de valeur forme un triplet pythagoricien.
```ocaml
let pytha x y z = 
  if(x*x)+(y*y)=(z*z) || (y*y)+(z*z)=(x*x) || (x*x)+(z*z)=(y*y) then 
    true 
  else 
    false;;
```
2) Fonction qui determine si 2 entiers sont de même signe.
```ocaml
let meme_signe x y = 
    if( x > 0 && y > 0) || (x<0 && y<0) then 
        true
    else 
        false;;
```

## Exercice 8
- Dans l'exercice 6, les fonctions rédigées correspondent à des **fonctions mathématiques** réalisant des calculs sur des entiers et renvoyant une valeur.
- Dans l'exercice 7, les fonctions correspondent cette fois à des **prédicats** : on effectue de nouveau des calculs avec des entiers mais on s'intéresse cette fois non plus au résultats de ces derniers mais aux valeurs particulières obtenues cela dans l'objectif de renvoyer un booléen.

1) Fonction ayant le type `int -> int -> int`
```ocaml
let fonc x y = x + y;;
```
2) Fonction ayant le type `int -> int -> bool`
```ocaml
let fonc x y = if x > 0 && y > 0 then true else false;;
```

## Exercice 9
Fonction calculant le minimum entre **deux entiers**.
```ocaml
let min2entiers x y = if x <= y then x else y;;
```
## Exercice 10
Fonction calculant le minimum entre **trois entiers**.
```ocaml
let min3entiers x y z = if min2entiers x y <= z then min2entiers x y else z;;
```

## Exercice 11
1) Fonction renvoyant le **milieu d'un segment** (`point2D`)
```ocaml
let milieu seg = {x = (seg.p1.x + seg.p2.x) / 2 ; y = (seg.p1.y + seg.p2.y) / 2};;
```
2) Fonction déterminant si un **point appartient ou non à un segment**
```ocaml
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
```

## Exercice 12
Ecrire une fonction qui teste si un jour de la semaine est un jour du week-end.
```ocaml
let weeknd x = if x = Samedi || x = Dimanche then true else false;;
```

## Exercice 13
Ecrire une fonction qui calcule l'aire d'une figure. \
\
Premièrement, on a besoin d'une fonction calculant la **distance entre deux points** :
```ocaml
let distance p1 p2 =
  let x1 = (float p2.x -. float p1.x) ** 2. in
  let y1 = (float p2.y -. float p1.y) ** 2. in 
  sqrt (x1 +. y1);;
```
On peut remarquer ici que l'on a été obligé de **caster les coordonnées des points p1 et p2** en nombres réels flottants du fait que les [fonctions mathématiques d'OCaml](https://fr.wikiversity.org/wiki/Premiers_pas_en_OCaml/Op%C3%A9rations_arithm%C3%A9tiques) telles que les fonctions racine et puissance travaillent uniquement avec des `float` \
\
Maintenant que l'on dispose de cette fonction, on peut développer la fonction `aire` :
```ocaml
let aire (f : figure) = 
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
```
Dans cette fonction, on peut voir que l'on traite des objets de type `figure` qui comprend
rappelons le les types suivants : 

> *Type figure comprenant les types `Carre`, `Rectangle` et `Cercle`.*
> ```ocaml
> type figure  = 
> | Carre of segment * segment * segment * segment
> | Rectangle of segment * segment * segment * segment
> | Cercle of point2D;;
> ```
> *Rappel : Le type `segment` contient deux `point2D`*


De ce fait, pour pouvoir appliquer la formule d'aire propre à la figure donnée, on utilise ici le **pattern-matching** ce que l'on peut observer via l'utilisation de la structure `match f with`. Cela correspond en quelque sorte à un **switch** sur le type d'un objet.

## Exercice 14
1) Calculer la valeur d'une carte.
```ocaml
let valeur x = if x.g = Chiffre then x.c else if x.g = Piege then 20 else 50;;
```

2) Determiner si le joueur suivant peut jouer ou non.
```ocaml
let peut_jouer x = if x.g = Chiffre || (x.g = Joker && x.c =0) then true else false;; 
```

3)
```ocaml
let peut_pose_carte x y = if x.color = y.color || (x.g = Chiffre && y.g = Chiffre && x.c = y.c) then true else false;;
```

## Exercice 15
[liste d'entiers OCAML](http://www.cs.cornell.edu/courses/cs3110/2008fa/lectures/lec04.html)
1) Calcul de la somme d'une liste d'entier.
```ocaml
let rec somme = fun l -> match l with | Nil -> 0 | Cons(x,s) -> x + somme s;;
```

2) Determine si l'ensemble des entiers d'une liste sont positifs.
```ocaml
let rec pos = fun l -> match l with | Nil -> true | Cons(x,s) -> if x > 0 then pos s else false;;
```

3) Ajout d'un élément en fin de liste.
```ocaml
let rec ajout = fun l -> fun i -> match l with | Nil -> Cons(i,Nil) | Cons(x, s) -> Cons(x, ajout s i);;
```

4) Concaténation de deux listes
```ocaml
let rec concat = fun l -> fun l2 -> match l with | Nil -> l2 | Cons(x,s) -> Cons(x,concat s l2);;
```

## Exercice 16

1) Definir une liste de carte ( main de carte).
```ocaml
type listecarte = Nil | Cons of carte * listecarte;;
```

2) Calculer la valeur d'une main de carte
```ocaml
let main_v = fun l -> match l with | Nil -> 0 | Cons(x,s) -> valeur x + main_v s;;
```

3) Determiner les cartes pouvant être jouées sur une carte donnée.
```ocaml

```

4) Determiné si les cartes d'une main peuvent être jouées à la suite dans l'ordre de la main.