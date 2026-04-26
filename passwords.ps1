#passwords

Set-ADAccountPassword -identity user8 `
                      -NewPassword (ConvertTo-SecureString "P@assword" -AsPlainText -Force)

#Funciona siempre pero es una tasca tipica de administrador
#se salta las directivas de contraseña 

Set-ADAccountPassword -Identity user8 `
                      -OldPassword (ConvertTo-SecureString "P@assword" -AsPlainText -Force) `
                      -NewPassword (ConvertTo-SecureString "P@assword2" -AsPlainText -Force)

Set-ADAccountPassword -Identity user8 `
                      -Reset # demana per teclat nou password, elimina el password anterior y deja uno nuevo




