# Creacio de un usuari
New-ADUser -Name user1 #El parametro user1 es el nombre del objeto usuario.

#Creacio de un usuario con el nombre de inicio de sesion y el nombre de inicio de sesion anterior a windows 2000
New-ADUser -Name user2 `
           -SamAccountName user2 `
           -UserPrincipalName user2@jtoribio.cat

#Creacio de un usuario con todo lo anterior pero habilitado
New-ADUser -Name user3 `
           -SamAccountName user3 `
           -UserPrincipalName user3@jtoribio.cat `
           -Enabled $true #este paramatro es un boleano y hay que añadirle el true para añadir true o false hay que poner $ primero
           #dona error por que no le hemos especificado contraseña

#Lo creamos con pero sin contraseña
New-ADUser -Name user3 `
           -SamAccountName user3 `
           -UserPrincipalName user3@jtoribio.cat `
           -Enabled $true `
           -PasswordNotRequired $true # hace que no tenga contraseña

#Ahora lo creamos pero con contraseña especificada
New-ADUser -Name user4 `
           -SamAccountName user4 `
           -UserPrincipalName user4@jtoribio.cat `
           -Enabled $true `
           -AccountPassword (Read-Host -AsSecureString "introdueix password") #Estacomanda entra una contraseña al usuario, Read-Host la entra por teclado, assecurestring lo tranforma en contraseña

#Ahora para crear un usuario con un password introducido en el codigo y que no lo pida por teclado
New-ADUser -Name user5 `
           -SamAccountName user5 `
           -UserPrincipalName user5@jtoribio.cat `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) #esta comanda añade el password añadido al usuario

#Ahora vamos a poner los parametros para aladirle nombre de pila apellidos nombre de usuario iniciales
New-ADUser -Name user6 `
           -SamAccountName user6 `
           -UserPrincipalName user6@jtoribio.cat `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Manolo `
           -Surname Escobar `
           -DisplayName "Manolo Escobar" `
           -Initials ME

#Para crear un Usuario dentro de una unidad organizativa ya creada
New-ADUser -Name user7 `
           -SamAccountName user7 `
           -UserPrincipalName user7@jtoribio.cat `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Antonio `
           -Surname Flores `
           -DisplayName "Antonio Flores" `
           -Initials AF `
           -Path "OU=UNITAT1,DC=jtoribio,DC=cat"

#Vamos a crear un usuario que no pueda cambiar su password
New-ADUser -Name user8 `
           -SamAccountName user8 `
           -UserPrincipalName user8@jtoribio.cat `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Juanita `
           -Surname Reina `
           -DisplayName "Juanita Reina" `
           -Initials JR `
           -Path "OU=UNITAT1,DC=jtoribio,DC=cat" `
           -CannotChangePassword $true

#Un usuari que ha de cambiar el password en la primera sesio
New-ADUser -Name user9 `
           -SamAccountName user9 `
           -UserPrincipalName user9@jtoribio.cat `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Paco `
           -Surname "de Lucia" `
           -DisplayName "Paco de Lucia" `
           -Initials PL `
           -Path "OU=UNITAT1,DC=jtoribio,DC=cat" `
           -ChangePasswordAtLogon $true

#Un usuario que su contraseña nunca expire
New-ADUser -Name user10 `
           -SamAccountName user10 `
           -UserPrincipalName user10@jtoribio.cat `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Manolo `
           -Surname "Caracol" `
           -DisplayName "Manolo Caracol" `
           -Initials MC `
           -Path "OU=UNITAT1,DC=jtoribio,DC=cat" `
           -PasswordNeverExpires $true

#Creamos un Usuario que tenga un correo electronico
New-ADUser -Name user11 `
           -SamAccountName user11 `
           -UserPrincipalName user11@jtoribio.cat `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Rocio `
           -Surname "Jurado" `
           -DisplayName "Rocio Jurado" `
           -Initials RJ `
           -Path "OU=UNITAT1,DC=jtoribio,DC=cat" `
           -ChangePasswordAtLogon $true `
           -EmailAddress rjurado@pepe.yoquese.net
           
           