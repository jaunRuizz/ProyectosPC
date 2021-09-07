#                        //*****************************************************************************}
#                        //                                                                             }
#                        //       Sticky Password Autofill Engine                                       }
#                        //       Chromium Log                                                          }
#                        //                                                                             }
#                        //       Copyright (C) 2021 Lamantine Software a.s.                            }
#                        //                                                                             }
#                        //*****************************************************************************}
#
#
#//<!--               Para mas informacion sobre los modulos utilizados en Este script visita las siguientes URL           -->
#//<!-- https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_split?view=powershell-7.1 -->
#//<!--                        https://www.powershellgallery.com/packages?q=microsoft+teams                                -->
#//<!--                        https://docs.microsoft.com/en-us/MicrosoftTeams/teams-powershell-overview                   -->
#//<!--                   Para mas informacion sobre los modulos utilizados en Este script visita las siguientes URL       -->


# Esta funcion nos imprime el menu en la linea de comandps las opciones las extrae de un documento txt
function Menu(){
$menu = Get-Content "C:\Users\mcdan\Desktop\Tarea2\Scripts\Menu-Opciones.txt"
foreach($i in $menu){Write-Output $i } 
}


# Esta funcion es para autenticarnos en la cuenta de Microsoft Teams que deseamos Admistrar
function Autenticar(){
# Ingresa las credenciales tu cuenta teams correo UANL y contraseña
$user = read-host ingresa tu usuario
 $userCredential = Get-Credential -Verbose $user
 try{
 Connect-MicrosoftTeams -Credential $userCredential -ErrorAction "ignore"
 write-host Autenticacion con exito 
 }catch{
    #$_.Exception.Message
    write-host Esto es un error cool
 }
  
 }

 # Esta funcion sirve para ver la lista de todos los equipos a los que perteneces si estan o no archivados
 function Ver_Equipos(){
    ## Aqui ingresamos el correo universitario con el que esta vinculada la cuenta de Teams
 $usuario= Read-host  "Ingresa tu correo universitario"
 try{
 Get-Team  -user $usuario  > C:\Users\mcdan\Desktop\Tarea2\scripts\Evidencia.txt -ErrorAction "ignore"
 write-host Se genero reporte con exito
 }catch{
  write-host ingresaste un correo invalido intenta de nuevo 
 }
}


# Esta Funcion nos ayuda a crear equipos dentro de la plataforma Microsoft Teams
## Se le pasan los parametros de nombre del equipo , la visibilidad y una descripcion sobre el equipo
function Crear_Equipo(){
$Name_Equipo=Read-host "Ingresa el nombre del equipo" 
$Visibilidad =Read-Host "ingresa si es privado o publico "
$NickName =Read-Host "Ingresa el nickname del equipo " 
$Descripcion=Read-Host "ingresa una descripcion sobre el equipo " 
write-host Creando equipo esto podria tardar unos segundos 
New-Team -DisplayName $Name_Equipo -Visibility $sibilViidad -MailNickName $NickName -Description $Descripcion -ErrorAction "ignore"
write-host Se creo equipo con exito 

}


# Esta funcion nos apoyara a Eliminar Equipos de la plataforma
#Son equipos de los cuales tu eres propietario ten mucho cuidado al eliminar equipos que creaste
function Delete_Equipo(){
$Id = read-host "Ingresa tu id copialo de la linea anterior "
$op=read-host "Seguro que deseas eliminar el equipo [y]si [n]No"
if ($op -eq "y"){
Remove-Team -GroupId $Id
write-host Equipo eliminado con exito
}else{
Write-Host Operacion cancelada con exito
}
}


# Esta funcion nos va listar en linea de comandos los equipos solamente filtrando el Group ID y el Name del Team
function Lista_ID(){
write-host Actualizando Lista de equipos Esto tardara unos segundos
Get-Team  -user daniel.luevanoui@uanl.edu.mx  > C:\Users\mcdan\Desktop\Tarea2\scripts\Evidencia.txt
$Coco = Get-Content "C:\Users\mcdan\Desktop\Tarea2\scripts\Evidencia.txt"
$conte=0
foreach($i in $Coco){
$conte++
}
$Cont=1
$contador=3
while($contador -lt $conte-2){
("$cont"+"-->")+$Coco[$contador].split(" ")[0]+" "+" "+$Coco[$contador].split(" ")[1]+" "+$Coco[$Contador].split(" ")[2]+" "+$Coco[$Contador].split(" ")[3]
$contador++
$cont++
 }
}
# Esta funcion sirve para agregar un usuario a un equipo de teams desde una lista en un txt o manualmente
function Agregar_Usuario(){
$Id = read-host "imgresa el id del grupo "
$correo = read-host "ingresa el correo del usuario"
Add-TeamUser -GroupId $Id -User $Correo
write-host Se agrego usuario con exito 
}

# Funcion para eliminar un usuario de un equipo
function Eliminar-User(){
$Id = read-host "imgresa el id del grupo "
$correo = read-host "ingresa el correo del usuario"
$op = read-host "Estas Seguro que Deseas Eliminar un integrante del equipo actual [y]si [n]No"
if ($op -eq "y"){
Remove-TeamUser -GroupId $Id -User $Correo
write-host Usuario eliminado con exito 
}

}

function Agregar_Pic(){
$Id =read-host "Ingresa el id del equipo"
$img=read-host Ingresa la ruta donde tienes tu imagen
write-host Cambiando imagen 
Set-TeamPicture -GroupId $Id -ImagePath $img
write-host Imagen aztuaizada con exito 
}

function Generar_Reporte(){
$usuario= Read-host  "Ingresa tu correo universitario"
Get-Team  -user $usuario  > C:\Users\mcdan\Desktop\Tarea2\scripts\Reporte.txt
$GroupId=Get-content "C:\Users\mcdan\Desktop\Tarea2\scripts\Evidencia.txt"
$conte=0
foreach($i in $GroupId){
$conte++
}
$cont=3
$contador=0
$c=1
while($cont -lt $conte-2){
Get-Teamuser -GroupId $GroupId[$cont].split(" ")[0] > C:\Users\mcdan\Desktop\Tarea2\Reporte-MicrosoftTeams\crreos"$c".txt
$cont++
$contador++
$c++
}


#$s=Get-content "C:\Users\mcdan\Desktop\Tarea2\Reporte-MicrosoftTeams\correos.txt"



}
# En este apartado usamos un switch Para desplegar el menu de opciones




#/**
#* ------------------------------------------------------------------------
#* Este script Fue Elaborado Por Luevano Ruiz Juan Daniel
#* ------------------------------------------------------------------------
#*/
Export-ModuleMember Menu  Agregar_Pic Eliminar-User  Agregar_Usuario Lista_ID Delete_Equipo Crear_Equipo Ver_Equipos Autenticar Generar_Reporte