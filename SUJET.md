# Test technique

## Intro

Dans un monde dirigé par les oiseaux, tu n'as pas d'autre choix que de coder un module de traduction pour vous comprendre mutuellement.
Un oiseau arrive et t'interpelle avec le chant suivant :

```
poup uiui piop poup uiui piop iupo  ipip ioui  ipou uiui piop iiou iupi piou ppou piuu  iiou ioui ipou ioui piui ppou iupi  piou piuu piup iupi piou piop piui piou piop piup ioui iipu  poup uiui piiu piiu ioui piui piup  pipp piou ppou iupi ioui  ppip
```

## Level 1

Écrire un programme en Ruby permettant de convertir du français en chant d'oiseau et
vice-versa. Veillez à versionner vos travaux avec Git et vous assurer de la
fiabilité de la transcription des messages.

Voici une table de caractères de l'alphabet oiseau :

```
{
  "A"=>"piou",
  "B"=>"ioup",
  "C"=>"poup",
  "D"=>"iiou",
  "E"=>"ioui",
  "F"=>"pipp",
  "G"=>"ouip",
  "H"=>"poui",
  "I"=>"ppou",
  "J"=>"ipip",
  "K"=>"oupi",
  "L"=>"pouu",
  "M"=>"piiu",
  "N"=>"piui",
  "O"=>"uiui",
  "P"=>"opui",
  "Q"=>"pupu",
  "R"=>"iupi",
  "S"=>"piuu",
  "T"=>"piup",
  "U"=>"piop",
  "V"=>"ipou",
  "W"=>"oupu",
  "X"=>"uopu",
  "Y"=>"iupu",
  "Z"=>"iupp",
  "!"=>"iipu",
  ","=>"iupo",
  "."=>"ipuu",
  "?"=>"ppip"
}
```

## Level 2

Bravo, tu as maintenant un module de traduction entre oiseau et langage français.
Tu veux maintenant rendre son utilsation plus pratique et pour un maximum d'utilisateurs.
Il te faut donc créer une application Ruby on Rails permettant de poster des
messages avec un minimum de style pour que cela reste facile pour tes utilisateurs.

Les messages devront également comporter le nom de l'auteur, être persistés en
base de donnée (avec PostgreSQL) et s'afficher directement en langue oiseau
sur une vue.

Pour trier les messages, il devra être possible de leur associer des tags
(Urgent, Secret ou Rigolo).

L'application devra exposer les routes suivantes :

- /messages/
- /messages/:id
- /tags/:name/messages

## Conseils

Pensez à bien faire des commits Git et des commentaires si nécessaire.
