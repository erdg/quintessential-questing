### Characters ###
(class +Character +Entity)
   # Info
   (rel name (+Ref +String))
   (rel race (+Ref +String))
   (rel sex (+Ref +String)) 
   (rel age (+Number))
   (rel size (+Number))
   (rel txt (+Blob)) # Description

   # Attributes
   (rel agility (+Number))
   (rel strength (+Number))
   (rel speed (+Number))
   (rel zeal (+Number))
   (rel resolve (+Number))
   (rel wisdom (+Number))
   (rel leadership (+Number))

   (rel wpns (+List +Link) (+Weapon)) 
   (rel armor (+List +Link) (+Armor))

(dm url> (Tab) 
   (and (may Character) (list "qq/character.l" '*ID This)) )



### Weapons ###
(class +Weapon +Entity)
   (rel name (+Ref +String)) 
   (rel cls (+Ref +String)) # Class: Sword, Dagger, Axe...
   (rel type (+Ref +String)) # Slashing, Piercing, Crushing...
   (rel dmg (+Ref +Number)) # Damage Value 
   (rel ap (+Number)) # Armor Piercing
   (rel rng (+Number)) # Range/Reach
   (rel txt (+Blob)) # Description
   (rel img (+Blob)) # Image
   (rel character (+Link) (+Character))

(dm url> (Tab) 
   (and (may Weapon) (list "qq/weapon.l" '*ID This)) )



### Armor ###
(class +Armor +Entity)
   (rel name (+Ref +String))
   (rel slot (+Ref +String))
   (rel value  (+Number))
   (rel txt  (+Blob))
   (rel img  (+Blob))
   (rel character (+Link) (+Character))

(dm url> (Tab)
   (and (may Armor) (list "qq/armor.l" '*ID This)) )
