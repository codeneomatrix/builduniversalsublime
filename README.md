# builduniversalsublime

Esta es una version ALPHA 1.0, por lo que es posible que existan bugs.

La ejecucion de este archivo solo funciona en linux, por el momento.
Descarga el archivo builduniversal.sh y guardalo en alguna ubicacion de tu PC.

### Configurando sublime text 
--------------------
En sublime ve a: Tools > Build System > New Build System... Se creara una nueva pestaña en donde colocaras lo siguiente: 
```sh
{
    "cmd": ["ubicaciondelarchivo/builduniversal.sh ${file} ${file_base_name}"],
    "shell": true
}
```
y guardalo con el nombre que gustes

### Configurando builduniversal.sh
--------------------
Primero verifica que el archivo tenga permiso de ejecucion.
y configura las primeras lineas si es nesesario
```sh
tipo="gnome"        # manejador de la venta se puede cambiar por : kde, pantheon, etc
ensamblador="NASM"  # ensamblador a usar se puede modificar a: SINSO para ejecutar codigo de funciona sin S.O.
navegador="firefox" # navegador por defecto se puede cambiar por: opera, chrome, etc
bits="32"           # modo de compilacion de ensamblador se puede modifar a 64
debug="false"       # modo de debug de ensamblador se puede modificar a true 
```
- En tipo se especifica el manejador de ventanas de la consola este puede ser: gnome, kde, pantheon, etc 
- en ensamblado se especifica el programa que usaras para ensamblar tus programas .asm que puede ser NASM o SINSO el cual es para la ejecucion sin sistema operativo empleando QUEMU, si no ejecutaras .asm no te preocupes en configurar esta parte
- En navegador coloca el programa que emplearas por defecto para ejecutar .html y .js , si no correras archivos de este tipo no te preocupes en configurarlo
- En debug es para activar el modo debuger al ensamblar archivos .asm, si no correras estos archivos tampoco te preocupes por modificarlo

### Version
ALPHA 1.0.0

License
----

MIT


# builduniversalsublime

Esta es una version ALPHA 1.0, por lo que es posible que existan bugs.

La ejecucion de este archivo solo funciona en linux, por el momento.
Descarga el archivo builduniversal.sh y guardalo en alguna ubicacion de tu PC.

### Configurando sublime text 
--------------------
En sublime ve a: Tools > Build System > New Build System... Se creara una nueva pestaña en donde colocaras lo siguiente: 
```sh
{
    "cmd": ["ubicaciondelarchivo/builduniversal.sh ${file} ${file_base_name}"],
    "shell": true
}
```
y guardalo con el nombre que gustes

### Configurando builduniversal.sh
--------------------
Primero verifica que el archivo tenga permiso de ejecucion.
y configura las primeras lineas si es nesesario
```sh
tipo="gnome"        # manejador de la venta se puede cambiar por : kde, pantheon, etc
ensamblador="NASM"  # ensamblador a usar se puede modificar a: SINSO para ejecutar codigo de funciona sin S.O.
navegador="firefox" # navegador por defecto se puede cambiar por: opera, chrome, etc
bits="32"           # modo de compilacion de ensamblador se puede modifar a 64
debug="false"       # modo de debug de ensamblador se puede modificar a true 
```
- En tipo se especifica el manejador de ventanas de la consola este puede ser: gnome, kde, pantheon, etc 
- en ensamblado se especifica el programa que usaras para ensamblar tus programas .asm que puede ser NASM o SINSO el cual es para la ejecucion sin sistema operativo empleando QUEMU, si no ejecutaras .asm no te preocupes en configurar esta parte
- En navegador coloca el programa que emplearas por defecto para ejecutar .html y .js , si no correras archivos de este tipo no te preocupes en configurarlo
- En debug es para activar el modo debuger al ensamblar archivos .asm, si no correras estos archivos tampoco te preocupes por modificarlo

### Version
ALPHA 1.0.0

License
----

MIT


