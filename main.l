(allowed ("qq/")
   "!work" "!stop" "@lib.css" "!psh" "@qq/qqlogo.png" )

(load 
   "@lib/http.l"
   "@lib/xhtml.l"
   "@lib/form.l"
   "@lib/adm.l" )

(setq 
   *Css "@lib.css"
   *Salt (16 . "$6$@1$") )

(load 
   "qq/er.l"
   "qq/gui.l" )

(permission
   Character ,"Character"
   Weapon ,"Weapon" 
   Armor ,"Armor"
   RoleAdmin ,"Role Administration"
   UserAdmin ,"User Administration"
   Password ,"Password"
   Delete ,"Delete" )


# entry point
(de main ()
   (pool "qq/qq.db")
   (unless (seq *DB)
      (load "qq/init.l") ) )

(de go ()
   (pw 12)
   (task (port 4040) # setup query server in background
      (let? Sock (accept @)
         (unless (fork) # child process
            (in Sock
               (while (rd)
                  (sync)
                  (tell)
                  (out Sock
                     (pr (eval @)) ) ) )
            (bye) )
         (close Sock) ) )
   (forked)
   (rollback)
   (server 8080 "!work") )
            
