# TP1 - Programmation Fonctionnelle
Auteurs : Baptiste Bouvier et Ancelin Serre \
Date : 07/09/2018 \
Polytech INFO4

## Exercice 1
Voir sujet de TP, il s'agissait d'exécuter des commandes simples en OCaml.

## Exercice 2
Evaluer chacune des expressions suivantes, observer les messages d'erreur et expliquer chacun d'entre eux. \
\
Premier extrait de code :
```
let pi_sur_4 = 3.14 / 4.
```

On obtient le message d'erreur suivant : \
`Error: This expression has type float but an expression was expected of type` \
\
Cela s'explique par le fait que l'on a oublié le `.` juste après le symbole de division. On a `symbole /` on aurait du avoir `symbole /.` Dans notre cas on fait une division entière en donnant des réels ce qui ne peut donc pas fonctionner !  \
\
Deuxième extrait de code :

```
let dans_l_ordre = 1 < 2 < 3
```
On obtient le message d'erreur suivant : \
`Error: This expression has type int but an expression was expected of type bool` \
\
Cela s'explique par le fait que OCaml calcule en premier `1 < 2` ce qui renvoie `false`. On essaye ensuite de calculer `false < 3` ce qui ne peut donc pas fonctionner car on compare un `bool` avec un `int`. \
\
Troisième extrait de code :
```
let positif = let a = 42 in if a >= 0 then true
```
On obtient le message d'erreur suivant : \
`Error: This variant expression is expected to have type unit, the constructor true does not belong to type unit` \
\
Cela s'explique par le fait qu'il manque un `else` à notre `if`. \
\
Quatrième extrait de code :
```
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

```
#type semaine = Lundi | Mardi | Mercredi | Jeudi | Vendredi | Samedi | Dimanche ;;
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
```
#type point2D = { mutable x : int; mutable y : int};;
type point2D = { mutable x : int; mutable y : int}
```
3) Définir un identifiant de type **point2D** qui représente l'origine de repère
```
#let origine = {2, 4};;
val origine : point2D = {2, 4}
```
4) Définir un type **segment** (à l'aide du précédent).
```
#type segment = {point1 : point2D; point2 : point2D};;
#type segment = {point1 : point2D; point2 : point2D; }
```
5) Définir un type somme **figure** pour représenter les figures géométriques carré, rectangle et cercle.
```
#type figure = Carre of segment * segment * segment * segment
| Rectangle of segment * segment * segment * segment
| Cercle of point2D
```

## Exercice 4
```
#type couleur = Vert | Rouge | Bleu | Jaune | Noir
#type chiffre = x : int in if x >= 0 && x < 9 x else 0
#type genre = Chiffre | Piege | Joker
#type carte = genre * couleur * chiffre
```
Pour le jeu de Uno, on propose la hiérarchie de types suivante :
- Piege et 0 -> passe ton tour
- Piege et 1 -> changement de sens
- Piege et 2 -> Plus 2
- Joker et 0 -> changement de couleur (couleur Noire obligatoire)
- Joker et 1 -> plus 4 (couleur Noire obligatoire)

## Exercice 5
1) Faire une fonction qui calcule le cube d'un réel.
```
let cube = fun x -> x *. x *. x;;
```
2) Faire une fonction qui calcule si un entier est positif.
```
let positif = fun x -> if x > 0 then true else false;;
```
3) Faire une fonction qui calcule si un entier est pair.
```
let pair = fun x -> if x mod 2 == 0 then true else false;;
```
4) Faire une fonction qui calcule le signe d'un entier.
```
let signe = fun x -> if x > 0 then 1 else if x < 0 then (-1) else 0;;
```

## Exercice 6
1) Produit de 3 entiers sous la forme d'une fonction curryfiée.
```
let f1 = fun x -> fun y -> fun z -> x * y * z;;
```
2) Somme de 3 entiers sous la forme d'une fonction curryfiée.
```
let f2 = fun x -> fun y -> fun z -> x + y + z;;
```

## Exercice 7
1) Fonction qui determine si un triplet de valeur forme un triplet pythagoricien.
```
let pytha = fun x -> fun y -> fun z ->
if(x*x)+(y*y)=(z*z) || (y*y)+(z*z)=(x*x) || (x*x)+(z*z)=(y*y) then true else false;;
```
2) Fonction qui determine si 2 entiers sont de même signe.
```
let meme_signe = fun x -> fun y -> if( x > 0 && y > 0)  || (x<0 && y<0) then true else false;;
```

## Exercice 8
- Dans l'exercice 6, les fonctions rédigées correspondent à des **fonctions mathématiques** réalisant des calculs sur des entiers et renvoyant une valeur.
- Dans l'exercice 7, les fonctions correspondent cette fois à des **prédicats** : on effectue de nouveau des calculs avec des entiers mais on s'intéresse cette fois non plus au résultats de ces derniers mais aux valeurs particulières obtenues cela dans l'objectif de renvoyer un booléen.

1) Fonction ayant le type `int -> int -> int`
```
let fonc = fun x -> fun y -> x + y;;
```
2) Fonction ayant le type `int -> int -> bool`
```
let fonc = fun x -> fun y -> if x > 0 && y > 0 then true else false;;
```

## Exercice 9
Fonction calculant le minimum entre **deux entiers**.
```
let min2entiers = fun x -> fun y -> if x <= y then x else y;;
```
## Exercice 10
Fonction calculant le minimum entre **trois entiers**.
```
let min3entiers = fun x -> fun y -> fun z -> if min2entiers x y <= z then min2entiers x y else z;;
```

## Exercice 11
