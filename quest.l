(must "Quest" Quest)

(menu ,"Quest"
   (idForm ,"Quest" '(choose-quest) 'name '+Quest T '(may Delete) '((: name))
      (<hr>)
      (<grid> 2
         ,"Name" (gui 'name '(+E/R +TextField) '(name : home obj) 30) )
      (gui 'characters '(+E/R +Chart) '(characters : home obj) 3
         '((This) (list Nil This))
         cadr)
      (<table> NIL "Characters"
         '((btn) (NIL ,"Name") NIL)
         (do 8
            (<row> NIL
               (choose-character 1)
               (gui 2 '(+ObjView +TextField) '(: name))
               (gui 3 '(+DelRowButton)) ) )
         (<row> NIL NIL (scroll 1)) )
      (<hr>)
      (<spread> NIL (editButton T)) ) )
   
