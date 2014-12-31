### roles ###
(obj ((+Role) nm "Administration") perm `*Perms)
(obj ((+Role) nm "Player") perm (Character Weapon Delete))
(commit)

### users ###
(obj ((+User) nm "admin") pw `(passwd "admin") role `(db 'nm '+Role "Administration"))
(obj ((+User) nm "erik") pw `(passwd "erik") role `(db 'nm '+Role "Player"))
(commit)

### characters ###
(obj ((+Character) name "Erik the Elf"))

(commit)

### weapons ###
(obj ((+Weapon) name "Katana"))

(obj ((+Weapon) name "Tiny Dagger"))

(commit)
