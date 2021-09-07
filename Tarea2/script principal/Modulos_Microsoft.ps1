import-module C:\Users\mcdan\Desktop\Tarea2\Scripts\Administracion-MicrosoftTeams-V_0.ps1

Menu
$opc = Read-Host  Elige una opcion
while ($opc -lt 9){
switch ($opc){
    0 {
    Autenticar
    

    break
    } 1 {
    Ver_Equipos
    break
    } 2 {
    Crear_Equipo
    break
    } 3 {
    Lista_ID
    Delete_Equipo
    break
    } 4 {
    Lista_ID
    Agregar_Usuario
    break
    } 5 {
    Lista_ID
    Eliminar-User
    break
    } 6 {
    Lista_ID
    Agregar_Pic
    break
    } 7 {
    Generar_Reporte
    break
    } 8 {
    Disconnect-MicrosoftTeams -Confirm

    break
    } default {
    write-Host "Error 502 (Opcion no valida)"
}
}

Menu
$opc = Read-Host  Elige una opcion
}

