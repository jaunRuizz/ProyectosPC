#                        //*****************************************************************************}
#                        //                                                                             }
#                        //                  Sticky Password Autofill Engine                            }
#                        //                  Chromium Log                                               }
#                        //                                                                             }
#                        //                  Copyright (C) 2021 Team 063 Software a.s.                 }
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
$menu = Get-Content "C:\Users\mcdan\Desktop\Menu-Opciones.txt"
foreach($i in $menu){Write-Output $i }
}


# Esta funcion es para autenticarnos en la cuenta de Microsoft Teams que deseamos Admistrar
function Autenticar(){
# Ingresa las credenciales tu cuenta teams correo UANL y contraseña 
 $userCredential = Get-Credential
 Connect-MicrosoftTeams -Credential $userCredential
 }
 
 
 # Esta funcion sirve para ver la lista de todos los equipos a los que perteneces si estan o no archivados 
 function Ver_Equipos(){      
    ## Aqui ingresamos el correo universitario con el que esta vinculada la cuenta de Teams
 $usuario= Read-host  "Ingresa tu correo universitario"
 Get-Team  -user $usuario -Archived $False > C:\Users\mcdan\Desktop\Tarea2\scripts\Evidencia.txt
}


# Esta Funcion nos ayuda a crear equipos dentro de la plataforma Microsoft Teams
## Se le pasan los parametros de nombre del equipo , la visibilidad y una descripcion sobre el equipo 
function Crear_Equipo(){
$Name_Equipo=Read-host "Ingresa el nombre del equipo"
$Visibilidad =Read-Host "ingresa si es privado o publico "
$NickName =Read-Host "Ingresa el nickname del equipo "
$Descripcion=Read-Host "ingresa una descripcion sobre el equipo "

New-Team -DisplayName $Name_Equipo -Visibility $Visibilidad -MailNickName $NickName -Description $Descripcion 
}


# Esta funcion nos apoyara a Eliminar Equipos de la plataforma 
#Son equipos de los cuales tu eres propietario ten mucho cuidado al eliminar equipos que creaste 
function Delete_Equipo(){
$Id = read-host "Ingresa tu id copialo de la linea anterior "
$op=read-host "Seguro que deseas eliminar el equipo"
if ($op -eq "y"){
Remove-Team -GroupId $Id
}else{
Write-Host Operacion cancelada con exito
}
}


# Esta funcion nos va listar en linea de comandos los equipos solamente filtrando el Group ID y el Name del Team
function Lista_ID(){
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


# En este apartado usamos un switch Para desplegar el menu de opciones 
function script(){
Menu
$opc = Read-Host  Elige una opcion
while ($opc -lt 7){
switch ($opc){
    0 {
    Autenticar
    Menu
 
    break
    } 1 {
    Ver_Equipos
    Menu
   
    break
    } 2 {
    Crear_Equipo
    Menu
    } 3 {
    Lista_ID
    Delete_Equipo
    Menu
    } default {
    write-Host "Error 502 (Opcion no valida)" 
}
}
$opc = Read-Host  Elige una opcion
}
}


script

/**
 * ------------------------------------------------------------------------
 * Este script Fue Elaborado Por Luevano Ruiz Juan Daniel
 * ------------------------------------------------------------------------
 */