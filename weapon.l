(must "Weapon" Weapon)

(menu ,"Weapon"
   (idForm ,"Weapon" '(choose-weapon) 'name '+Weapon T '(may Delete) '((: name))
      (<hr>)
      (<grid> 2
         ,"Name" (gui '(+E/R +TextField) '(name : home obj) 30)

         ,"Class"
         (gui '(+E/R +TextField) '(cls : home obj) 
            '("Sword" "Dagger" "Axe" "Polearm" "Ranged" "Club") )

         ,"Type"
         (gui 'type '(+E/R +TextField) '(type : home obj)
            '("Slashing" "Crushing" "Piercing") ) 

         ,"Damage" (gui 'dmg '(+E/R +NumField) '(dmg : home obj) 8)
         ,"Armor Piercing" (gui 'ap '(+E/R +NumField) '(ap : home obj) 8)
         ,"Range" (gui 'rng '(+E/R +NumField) '(rng : home obj) 8)

         ,"Description" (gui 'txt '(+BlobField) '(txt : home obj) 30 6)

         ,"Image" 
         (prog
            (gui '(+Able +UpField) '(not (: home obj img)) 30)
            (gui '(+Drop +Button) '(field -1)
               '(if (: home obj img) ,"Uninstall" ,"Install")
               '(cond 
                  ((: home obj img)
                     (ask ,"Uninstall Image?"
                        (put!> (: home top 1 obj) 'img NIL) ) )
                  ((: drop) (blob! (: home obj) 'img @)) ) ) ) )

      (<spread> NIL (editButton T))
      (gui '(+Upd +Img)
         '(and (: home obj img) (allow (blob (: home obj) 'img)))
         ,"Image" ) ) )
