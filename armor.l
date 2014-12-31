(must "Armor" Armor)

(menu ,"Armor" 
   (idForm ,"Armor" '(choose-armor) 'name '+Armor T '(may Delete) '((: name))
      (<hr>)
      (<grid> 2
         ,"Name" (gui 'name '(+E/R +TextField) '(name : home obj) 30)
         ,"Slot" 
         (gui 'slot '(+E/R +TextField) '(slot : home obj) 
            '("Head" "Torso" "Arms" "Hands" "Legs" "Feet") )
         ,"Value" (gui 'value '(+E/R +NumField) '(value : home obj) 8)
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
