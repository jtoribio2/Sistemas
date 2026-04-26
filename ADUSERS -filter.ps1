#dina las propietats del usuari que li marquem aquet cas espinate
Get-ADUser -Identity espinete

#para enseñar porpiedades que no te muestra pero que quieres saber
Get-ADUser -Identity espinete -Properties displayname,initials

#Ahora vamos hacer que me muestre los usuaris que cumplen los requisitos que le pedimos 

# con el asterisco nos muestra todos
Get-ADUser -Filter *

#aqui buscamos usuarios que tengan el surname pi exactamente sin keysensitive
Get-ADUser -Filter {surname -eq "PI"}

#aqui usamos el ne que es notequal y buscamos usuarios que estan desactivados
Get-ADUser -Filter {enabled -ne $true}

#el like nos deja buscar usuarios con condiciones por ejemplo este es que acaben por "A"
Get-ADUser -Filter {surname -like "*a"}

Get-ADUser -Filter * -SearchBase "OU=sesamo,DC=rpla,DC=cat"

#buscamos usuarios que no acaben en .com hay que añadirle la proiedad emailadres para que me aparezca 
Get-ADUser -Filter {emailaddress -notlike "*.com"} -Properties emailaddress

#gt nos da codigos postales que sean mas grande extrictamente pero compara STRINGS es decir que si mira el primer numero despues el siguiente el 82 no te saldria
Get-ADUser -Filter {postalcode -gt "17000"} -Properties postalcode

#usuarios que su ciudad sea estrictament blanes o que empiecen por lloret usando el or podemos concatenar
Get-ADUser -Filter{city -eq "Blanes" -or city -like "lloret*"} -Properties city

#Usuarios que su cidudad empiece por a o por b y que su nombre no empiece por r
Get-ADUser -Filter {(city -like "A*" -or city -like "B*") -and (samaccountname -notlike "r*")} -Properties city

#-le menor o igual que, -it menor a, -ge mas grande o igual que, -gt major que

#con la siguiente comanda podemos buscar dentro de una UO el searchscope te dice si quiere dentro solo de esa cadena y 2 tambien sale con subcarpetas 
Get-ADUser -Filter * -SearchBase "OU=sesamo,DC=jtoribio,DC=cat" -SearchScope 1

#este hace lo ismo pero busca dentro de las subcarpetas tambien 
Get-ADUser -Filter * -SearchBase "OU=sesamo,DC=jtoribio,DC=cat" -SearchScope 2

#podemos concatenar instrucciones para obtener objetos y modificarlos por ejemplo aqui enseñamos todos los grupos y le metemos en la descripicon grup de domini
Get-ADGroup -filter * | Set-ADGroup -Description "grup de domini"

#otro ejemplo mas pero esta vez de canviar todas las UO
Get-ADOrganizationalUnit -filter * -Properties Protectedfromaccidentaldeletion | Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $True

#Con la comanda select-object podemos especificar que propiedades queremos que muestre, las separamos con coma si queremos que aparezca mas de una, AQUI YA NO SE PUEDE PONER MAS "|" porque se convierte en un texto excepto el Sort-Object
Get-ADUser -Filter * | Select-Object -Property distinguishedname,name

#Con kla comanda Sort-object podemos mostrar los objetos ordenados por la popiedad que le pongamos, por ejemplo aqui lo hordenamos por su nombre, podemos añadir mas si ponemos una coma
Get-ADUser -Filter * | Sort-Object -Property name 

#muestra los usuarios que tienen un correo y muestra su cadena ldap y sus correos ordenados por su cadena ldap
Get-ADUser -Filter {EmailAddress -like "*"} -Properties emailaddress | Select-Object -Property distinguishedname,EmailAddress | Sort-Object -Property distinguishedname

#El parametro unique hacemos que no aparezcan los repetidos 
Get-ADUser -filter {city -like "*"} -Properties city | Select-Object -Property city -Unique


