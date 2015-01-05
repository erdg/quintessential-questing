(must "Skill" Skill)

(menu ,"Skill"
   (idForm ,"Skill" '(choose-skill) 'name '+Skill T '(may Delete) '((: name))
      (<hr>)
      (<grid> 2
         ,"Name" (gui 'name '(+E/R +TextField) '(name : home obj) 30)
         ,"Description" (gui 'txt '(+BlobField) '(txt : home obj) 30 6) )
      (<spread> NIL (editButton T)) ) )
      
