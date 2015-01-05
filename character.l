(must "Character" Character)

(menu ,"Character"
   (idForm ,"Character" '(choose-character) 'name '+Character T '(may Delete) '((: name))
      (<hr>)
      (<tab>
         ("Info"
            (<grid> 2
               ,"Name" (gui 'name '(+E/R +TextField) '(name : home obj) 30) 
               ,"Race" (gui 'race '(+E/R +TextField) '(race : home obj) '("Human" "Elf" "Orc"))
               ,"Sex"  (gui 'sex '(+E/R +TextField) '(sex : home obj) '("Male" "Female" "Other"))
               ,"Age"  (gui 'age '(+E/R +NumField) '(age : home obj) 8)

               ,"Story" (gui 'txt '(+BlobField) '(txt : home obj) 30 6) ) )
         ("Attributes"
            (<grid> 2
               ,"Agility"    (gui '(+E/R +NumField) '(agility : home obj) 8)
               ,"Strength"   (gui '(+E/R +NumField) '(strength : home obj) 8)
               ,"Speed"      (gui '(+E/R +NumField) '(speed : home obj) 8)
               ,"Zeal"       (gui '(+E/R +NumField) '(zeal : home obj) 8)
               ,"Resolve"    (gui '(+E/R +NumField) '(resolve : home obj) 8)
               ,"Wisdom"     (gui '(+E/R +NumField) '(wisdom : home obj) 8)
               ,"Leadership" (gui '(+E/R +NumField) '(leadership : home obj) 8) ) )

         ("Skills"
            (gui '(+E/R +Chart) '(skills : home obj) 4)
            (<table> NIL NIL
               '(NIL (NIL ,"Name") (NIL ,"Level") NIL)
               (do 8
                  (<row> NIL
                     (choose-skill 1)
                     (gui 2 '(+Obj +TextField) '(name +Skill) 20)
                     (gui 3 '(+NumField) 2)
                     (gui 4 '(+DelRowButton)) ) )
               (<row> NIL NIL (scroll 4)) ) )

         ("Gear"
            # Weapons
            (gui '(+E/R +Chart) '(wpns : home obj) 8
               '((This) (list NIL This (: cls) (: type) (: dmg) (: ap) (: rng)))
               cadr )
            (<table> NIL "Weapons"
               '((btn) (NIL ,"Name") (NIL ,"Class") (NIL ,"Type") (NIL ,"Dmg") (NIL ,"AP") (NIL ,"R") NIL)
               (do 4
                  (<row> NIL
                     (choose-weapon 1)
                     (gui 2 '(+ObjView +TextField) '(: name))
                     (gui 3 '(+Obj +TextField) '(cls +Weapon) 14)
                     (gui 4 '(+Obj +TextField) '(type +Weapon) 14)
                     (gui 5 '(+Obj +NumField) '(dmg +Weapon) 2)
                     (gui 6 '(+Obj +NumField) '(ap +Weapon) 2)
                     (gui 7 '(+Obj +NumField) '(rng +Weapon) 2)
                     (gui 8 '(+DelRowButton)) ) )
               (<row> NIL NIL (scroll 1)) )

            # Armor
            (gui '(+E/R +Chart) '(armor : home obj) 5
               '((This) (list NIL This (: slot) (: value)))
               cadr )
            (<table> NIL "Armor"
               '((btn) (NIL ,"Name") (NIL ,"Slot") (NIL ,"Val") NIL)
               (do 4
                  (<row> NIL
                     (choose-armor 1)
                     (gui 2 '(+ObjView +TextField) '(: name))
                     (gui 3 '(+Obj +TextField) '(slot +Armor) 14)
                     (gui 4 '(+Obj +NumField) '(value +Armor) 14)
                     (gui 5 '(+DelRowButton)) ) ) )
               (<row> NIL NIL (scroll 1)) ) )
      (<hr>)
      (<spread> NIL (editButton T)) ) )
