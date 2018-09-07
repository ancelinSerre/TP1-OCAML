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

