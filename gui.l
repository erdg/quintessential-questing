(de menu (Ttl . Prg)
   (action 
      (html 0 Ttl *Css NIL
         (<layout> 
            ((180 0 'menu)
               (<div> @
                  (expires)
                  (<menu>
                     (,"Home" "!work")
                     (,"logout" (and *Login "!stop"))
                     (NIL (<hr>))
                     (T ,"Data"
                        (,"Quests" (and (may Quest) "qq/quest.l"))
                        (,"Characters" (and (may Character) "qq/character.l"))
                        (,"Skills" (and (may Skill) "qq/skill.l"))
                        (,"Weapons" (and (may Weapon) "qq/weapon.l"))
                        (,"Armor" (and (may Armor) "qq/armor.l")) )
                     (T ,"System"
                        (,"Role Administration" (and (may RoleAdmin) "qq/role.l"))
                        (,"User Administration" (and (may UserAdmin) "qq/user.l")) ) ) )
               ((NIL NIL 'main)
                  (<div> @ (run Prg 1)) ) ) ) ) ) ) 


(de work ()
   (setq *Url "!work")
   (and (app) (setq *Menu 3))
   (menu "Quintessential Questing"
      (<img> "@qq/qqlogo.png")
      (----)
      (loginForm) ) )

(de stop ()
   (logout)
   (work) )



# Search Dialogs

(de choose-character (Dst)
   (diaform '(Dst)
      (<grid> 2
         ,"Name" (gui 'name '(+Var +TextField) 'character-name* 20)
         ,"Race" (gui 'race '(+Var +TextField) 'character-race* '("Human" "Elf" "Orc"))
         (searchButton '(init> (: home query))) )
      (gui 'query '(+QueryChart) (cho)
         '(goal
            (quote
               @Name character-name*
               @Race character-race*
               (select (@@)
                  ( (name +Character @Name)
                    (race +Character @Race) )
                  (tolr @Name @@ name)
                  (tolr @Race @@ race) ) ) )
         3
         '((This) (list This (: name) (: race))) ) 
      (<table> 'chart (choTtl ,"Characters" 'name '+Character)
         (quote
            (btn)
            (NIL ,"Name")
            (NIL ,"Race") )
         (do (cho)
            (<row> (alternating)
               (gui 1 '(+DstButton) Dst)
               (gui 2 '(+ObjView +TextField) '(: name))
               (gui 3 '(+ObjView +TextField) '(: race)) ) ) )
      (<spread>
         (scroll (cho))
         (newButton T Dst '(+Character)
            'name character-name*
            'race character-race* )
         (cancelButton) ) ) )



(de choose-weapon (Dst)
   (diaform '(Dst)
      (<grid> 2
         ,"Name" (gui 'name '(+Var +TextField) 'weapon-name* 20)
         (searchButton '(init> (: home query)))
         (resetButton '(name query)) )
      (gui 'query '(+QueryChart) (cho)
         '(goal
            (quote
               @Name weapon-name*
               (select (@@)
                  ((name +Weapon @Name))
                  (tolr @Name @@ name) ) ) )
         2
         '((This) (list This (: name))) )
      (<table> 'chart (choTtl ,"Weapons" 'name '+Weapon)
         '( (btn)
            (NIL ,"Name") )
         (do (cho)
            (<row> (alternating)
               (gui 1 '(+DstButton) Dst)
               (gui 2 '(+ObjView +TextField) '(: name)) ) ) )
      (<spread>
         (scroll (cho))
         (newButton T Dst '(+Weapon)
            'name weapon-name* )
         (cancelButton) ) ) )



(de choose-armor (Dst)
   (diaform '(Dst)
      (<grid> 2
         ,"Name" (gui 'name '(+Var +TextField) 'armor-name* 20)
         ,"Slot" 
         (gui 'slot '(+Var +TextField) 'armor-slot* 
            '("Head" "Torso" "Arms" "Hands" "Legs" "Feet") )
         (searchButton '(init> (: home query)))
         (resetButton '(name slot query)) )
      (gui 'query '(+QueryChart) (cho)
         '(goal
            (quote
               @Name armor-name*
               @Slot armor-slot*
               (select (@@)
                  ((name +Armor @Name)
                   (slot +Armor @Slot))
                  (tolr @Name @@ name)
                  (tolr @Slot @@ slot) ) ) )
         3
         '((This) (list This (: name) (: slot))) )
      (<table> 'chart (choTtl ,"Armor" 'name '+Armor)
         '( (btn)
            (NIL ,"Name")
            (NIL ,"Slot") )
         (do (cho)
            (<row> (alternating)
               (gui 1 '(+DstButton) Dst)
               (gui 2 '(+ObjView +TextField) '(: name))
               (gui 3 '(+TextField)) ) ) )
      (<spread>
         (scroll (cho))
         (newButton T Dst '(+Armor))
         (cancelButton) ) ) )



(de choose-quest (Dst)
   (diaform '(Dst)
      (<grid> 2
         ,"Name" (gui 'name '(+Var +TextField) 'quest-name* 30)
         (searchButton '(init> (: home query))) )
      (gui 'query '(+QueryChart) (cho) 
         '(goal
            (quote
               @Name quest-name*
               (select (@@)
                  ((name +Quest @Name))
                  (tolr @Name @@ name) ) ) )
         2
         '((This) (list This (: name))) )
      (<table> 'chart (choTtl ,"Quests" 'name '+Quest)
         '( (btn)
            (NIL ,"Name") )
         (do (cho)
            (<row> (alternating)
               (gui 1 '(+DstButton) Dst)
               (gui 2 '(+ObjView +TextField) '(: name)) ) ) )
      (<spread>
         (scroll (cho))
         (newButton T Dst '(+Quest))
         (cancelButton) ) ) )



(de choose-skill (Dst)
   (diaform '(Dst)
      (<grid> 2
         ,"Name" (gui 'name '(+Var +TextField) 'skill-name* 30)
         (searchButton '(init> (: home query))) )
      (gui 'query '(+QueryChart) (cho) 
         '(goal
            (quote
               @Name skill-name*
               (select (@@)
                  ((name +Skill @Name))
                  (tolr @Name @@ name) ) ) )
         2
         '((This) (list This (: name))) )
      (<table> 'chart (choTtl ,"Skills" 'name '+Skill)
         '( (btn)
            (NIL ,"Name") )
         (do (cho)
            (<row> (alternating)
               (gui 1 '(+DstButton) Dst)
               (gui 2 '(+ObjView +TextField) '(: name)) ) ) )
      (<spread>
         (scroll (cho))
         (newButton T Dst '(+Skill))
         (cancelButton) ) ) )
