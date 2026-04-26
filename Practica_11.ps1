#creacio de grups

New-ADGroup -Name Professor  `            -GroupScope DomainLocal `            -Path "OU=unitat1,DC=jtoribio,DC=cat"New-ADGroup -Name Alumne  `            -GroupScope DomainLocal `            -Path "OU=unitat1,DC=jtoribio,DC=cat"New-ADUser -Name slopez `
           -SamAccountName slopez `
           -Enabled $false `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Juan `
           -Surname "Lopez" `
           -DisplayName "Juan Lopez" `
           -Initials JL `
           -Path "OU=UNITAT1,DC=jtoribio,DC=cat" 

New-ADUser -Name bboniato `
           -SamAccountName bboniato `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -PasswordNeverExpires $true `
           -GivenName Benito `
           -Surname "Boniato" `
           -DisplayName "Benito Boniato" `
           -Initials BB `
           -Path "OU=UNITAT1,DC=jtoribio,DC=cat" 

New-ADUser -Name rtechos `
           -SamAccountName rtechos `
           -Enabled $true `
           -PasswordNotRequired $true `
           -CannotChangePassword $true `
           -GivenName Rompe `
           -Surname "Techos" `
           -DisplayName "Rompe Techos" `
           -Initials RT `
           -Path "OU=UNITAT1,DC=jtoribio,DC=cat"

New-ADUser -Name pgotera `
           -SamAccountName pgotera `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Pepe `
           -Surname "Gotera" `
           -DisplayName "Pepe Gotera" `
           -Initials PG `
           -Path "OU=UNITAT1,DC=jtoribio,DC=cat" `
           -LogonWorkstations "T1" 

New-ADUser -Name fpi `
           -SamAccountName fpi `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Filemon `
           -Surname "Pi" `
           -DisplayName "Filemon Pi" `
           -Initials FP `
           -Path "OU=UNITAT1,DC=jtoribio,DC=cat" `
           -ChangePasswordAtLogon $true

Add-ADGroupMember -Identity Professor `                  -Members slopez,rtechos,pgotera,fpi

Add-ADGroupMember -Identity Alumne `                  -Members rtechos,bboniato

Add-ADGroupMember -Identity "Admins. del dominio" `                  -Members fpi

#EL paramatre minimi per crear un usuari es "New-ADUser -Name -Enable $true -PasswordNotRequired $true"


New-ADOrganizationalUnit -Name Carrer `
                         -path "DC=jtoribio,DC=cat" `
                         -ProtectedFromAccidentalDeletion $true

New-ADOrganizationalUnit -Name EpiHouse `
                         -path "DC=jtoribio,DC=cat" `
                         -ProtectedFromAccidentalDeletion $true

New-ADOrganizationalUnit -Name Sesamo `
                         -path "DC=jtoribio,DC=cat" `
                         -ProtectedFromAccidentalDeletion $true

New-ADUser -Name Espinete `
           -SamAccountName Espinete `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Espi `
           -Surname "nete" `
           -DisplayName "EspiNete" `
           -Initials EN `
           -Path "OU=carrer,DC=jtoribio,DC=cat" 

New-ADUser -Name Epi `
           -SamAccountName Epi `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName epi `
           -Surname "dural" `
           -DisplayName "EpiDural" `
           -Initials ED `
           -Path "OU=epihouse,DC=jtoribio,DC=cat" 

New-ADUser -Name Blas `
           -SamAccountName Blas `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Blas `
           -Surname "Femio" `
           -DisplayName "Blasflemio" `
           -Initials BF `
           -Path "OU=epihouse,DC=jtoribio,DC=cat" 

New-ADUser -Name caponata `
           -SamAccountName caponata `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Capo `
           -Surname "Nata" `
           -DisplayName "caponata" `
           -Initials CN `
           -Path "OU=carrer,DC=jtoribio,DC=cat" 

New-ADUser -Name gustavo `
           -SamAccountName gustavo `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName gustavo `
           -Surname "llicao" `
           -DisplayName "gustavo gicao" `
           -Initials GL `
           -Path "OU=sesamo,DC=jtoribio,DC=cat" 

New-ADUser -Name Triki `
           -SamAccountName Triki `
           -Enabled $true `
           -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force) `
           -GivenName Triki `
           -Surname "Nosis" `
           -DisplayName "Triki Nosis" `
           -Initials TN `
           -Path "OU=sesamo,DC=jtoribio,DC=cat" 

New-ADGroup -Name pelut  `            -GroupScope DomainLocal `            -Path "OU=sesamo,DC=jtoribio,DC=cat"

New-ADGroup -Name alt  `            -GroupScope DomainLocal `            -Path "OU=sesamo,DC=jtoribio,DC=cat"

New-ADGroup -Name pelat  `            -GroupScope DomainLocal `            -Path "OU=sesamo,DC=jtoribio,DC=cat"

Add-ADGroupMember -Identity pelut `                  -Members espinete,caponata, triki

Add-ADGroupMember -Identity alt `                  -Members espinete,caponata

Add-ADGroupMember -Identity pelat `                  -Members epi,blas,gustavo

#exdercici 6

Set-ADUser -Identity slopez `
           -City Barcelona `
           -PostalCode 08002 `
           -Organization organ `
           -Company "Llauna films" `
           -Department Compatibilitat `
           -Office 4a `
           -EmailAddress slopez@llauna.cat

Set-ADUser -Identity bboniato `
           -City Soria `
           -PostalCode 42002 `
           -Country ES `
           -EmailAddress bboniato@soria.que.hermosa.es

Set-ADUser -Identity rtechos `
           -City "Blanes" `
           -State Girona `
           -StreetAddress "Avinguda de los pollos, número 2" `
           -PostalCode 17300 `
           -EmailAddress vigilante.de.la.playa@blanes.com

Set-ADUser -Identity pgotera `
           -City Palafolls `
           -PostalCode 08389 `
           -Company "Chapuzas a domicilio,SL" `
           -Office Central `
           -MobilePhone 666.777.888 `
           -EmailAddress pepe@chapuzas_q3.net

Set-ADUser -Identity fpi `
           -City Blanes `
           -PostalCode 17300 `
           -Company T.I.A `
           -OfficePhone 972350909 `
           -Department Compatibilitat `
           -Office 4a `
           -EmailAddress fpi@tia.org

#exercici 4 mover usuarios de grupo
New-ADOrganizationalUnit -Name barri `
                         -path "OU=sesamo,DC=jtoribio,DC=cat" `
                         -ProtectedFromAccidentalDeletion $true

Move-ADObject -Identity "CN=alt,OU=sesamo,DC=jtoribio,DC=cat" `
              -TargetPath "OU=barri,OU=sesamo,DC=jtoribio,DC=cat"

Move-ADObject -Identity "CN=pelat,OU=sesamo,DC=jtoribio,DC=cat" `
              -TargetPath "OU=barri,OU=sesamo,DC=jtoribio,DC=cat"

Move-ADObject -Identity "CN=pelut,OU=sesamo,DC=jtoribio,DC=cat" `
              -TargetPath "OU=barri,OU=sesamo,DC=jtoribio,DC=cat"

#Pregunta 5 vamos a mover una UO de un lado a otro
Set-ADOrganizationalUnit -Identity "OU=carrer,OU=sesamo,DC=jtoribio,DC=cat" `
                         -ProtectedFromAccidentalDeletion $false #aqui quitamos el protect para poder moverla

Move-ADObject -Identity "OU=carrer,OU=sesamo,DC=jtoribio,DC=cat" `
              -TargetPath "OU=barri,OU=sesamo,DC=jtoribio,DC=cat" `

Set-ADOrganizationalUnit -Identity "OU=carrer,OU=barri,OU=sesamo,DC=jtoribio,DC=cat" `
                         -ProtectedFromAccidentalDeletion $true #se lo volvemos a poner con la nueva direccion

Set-ADOrganizationalUnit -Identity "OU=EpiHouse,DC=jtoribio,DC=cat" `
                         -ProtectedFromAccidentalDeletion $false 

Move-ADObject -Identity "OU=EpiHouse,DC=jtoribio,DC=cat" `
              -TargetPath "OU=barri,OU=sesamo,DC=jtoribio,DC=cat" `

Set-ADOrganizationalUnit -Identity "OU=EpiHouse,OU=barri,OU=sesamo,DC=jtoribio,DC=cat" `
                         -ProtectedFromAccidentalDeletion $true 


#Pregunta 8 poner descrpicion a un grupo

Set-ADGroup -identity Alumne `
            -Description "Grups de sesamo"
            
Set-ADGroup -identity Professor `
            -Description "Grups de sesamo"

#Pregunta 9 hacer que un usuario expire
Set-ADUser -Identity bboniato `
           -AccountExpirationDate "31-12-2025" #Esta es una opcion

Set-ADAccountExpiration -Identity bboniato `
                        -DateTime "2026/12/31" #otra manera

Set-ADAccountExpiration -Identity bboniato `
                        -DateTime $null #para poner que no expire

#Pregunta 7

Set-ADAccountPassword -Identity pgotera `
                      -NewPassword (ConvertTo-SecureString "Ch@puz@$" -AsPlainText -Force)

#pregunta 10

Get-ADUser -Filter {name -like "e*"}

#pregunta 12

Get-ADUser -Filter * -SearchBase "OU=sesamo,DC=jtoribio,DC=cat" -SearchScope 2

#pregunta 13 
Get-ADUser -Filter * -SearchBase "OU=sesamo,DC=jtoribio,DC=cat" -SearchScope 1


#pregunta 11
Get-ADComputer -Filter * | Select-Object -property distinguishedname  

#Pregunta 14
Get-ADUser -Filter {EmailAddress -like "*"} -Properties emailaddress | Select-Object -Property distinguishedname,EmailAddress | Sort-Object -Property distinguishedname

#pregunta 15
Get-ADUser -filter {city -like "*"} -Properties city | Select-Object -Property city -Unique

#pregunta 16 
Get-ADUser -Filter {SamAccountName -like "*a*" } | Remove-ADPrincipalGroupMembership -MemberOf pelat -Confirm:$false
#Borra todos los usuarios que su nombre contiene a en su nombre del del grupo pelat

Remove-ADGroupMember -Identity pelat -Members (Get-ADUser -Filter {SamAccountName -like "*a*" } ) -Confirm:$false
#Es lo mismo pero del reves

$usuaris = Get-ADUser -Filter {SamAccountName -like "*a*" }
Remove-ADGroupMember -Identity pelat -Members $usuaris -Confirm:$false
#lo mismo pero con variables

#pregunta 18
Get-ADUser -Filter {UserPrincipalName -notlike "*@jtoribio.cat"} | Select-Object -Property Name,SamAccountName,UserPrincipalName

#pregunta 19
Get-ADGroupMember -Identity alumne | Set-ADUser -AccountExpirationDate "31-05-2026"

#pregunta 20
Get-ADGroupMember -Identity alumne | Set-ADUser -Enabled:$false

#pregunta 21
New-ADGroup -name Blanes `
            -GroupScope DomainLocal

Get-ADUser -Filter {city -like "blanes"} -Properties city | Add-ADPrincipalGroupMembership -MemberOf blanes


#pregunta 22
Get-ADOrganizationalUnit -filter * -SearchBase "OU=sesamo,DC=jtoribio,DC=cat" -SearchScope subtree | Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $false

Set-ADOrganizationalUnit -Identity "OU=sesamo,DC=jtoribio,DC=cat" `
                         -ProtectedFromAccidentalDeletion $false

Remove-ADOrganizationalUnit -Identity "OU=sesamo,DC=jtoribio,DC=cat" `
                            -Recursive `
                            -Confirm:$false # el rescursive hace que se pueda borrar todo con esto no hace falta hacer la comanda get





           



