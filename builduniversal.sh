#!/bin/bash
#--------------------------------------------------------------------------------------------------------



tipo="gnome"        # manejador de la venta se puede cambiar por : kde, pantheon, etc
ensamblador="NASM"  # ensamblador a usar se puede modificar a: SINSO para ejecutar codigo de funciona sin S.O.
navegador="firefox" # navegador por defecto se puede cambiar por: opera, chrome, etc
bits="32"           # modo de compilacion de ensamblador se puede modifar a 64
debug="false"       # modo de debug de ensamblador se puede modificar a true





#--------------------------------------------------------------------------------------------------------






comando="echo \"archivo no identificado\""
ubi=$1
nombre=$2

echo $ubi
#echo $nombre

nombrear="ninguno"
extencion="ninguno"
extencion=${ubi#*.}
echo $extencion
#nombre=${ubi##*/}
#echo $nombre

UB=${ubi%.*}
#echo $UB

archivo=$( file -b $ubi )
archivo=${archivo%,*}
archivo=$(echo $archivo | awk '{print tolower($0)}')
#echo $archivo


ejecuta() {

 $tipo-terminal -e "/bin/bash -c '$comando; echo; read -p 'Pulse_intro_pasa_salir...'; exit; exec /bin/bash';"

exit $?
}


pextencion(){
   ##---------------------------------------------------------------------------------------------------
## IDENTIFICACION POR EXTENCION
##---------------------------------------------------------------------------------------------------

if [[ $comando =~ "identificado" ]]
then

   if [ $extencion = "js"  ]
   then
    echo "javascritp"
    echo "<!DOCTYPE HTML><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width"><title></title></head>  <body>   <script src="$ubi"></script>  </body>    </html>" > $UB.html
    comando="$navegador $UB.html"
    ejecuta
   fi

   if [ $extencion = "rb"  ]
   then
    echo "este es un ruby"
    comando="ruby $ubi"
    ejecuta
   fi

   if [ $extencion = "py"  ]
   then
    comando="python $ubi"
    ejecuta
   fi

   if [ $extencion = "pl"  ]
   then
    comando="perl $ubi"
    ejecuta
   fi

   if [ $extencion = "jl"  ]
   then
    comando="julia $ubi"
    ejecuta
   fi

   if [ $extencion = "java"  ]
   then
      echo "Esto es java"
      comando="javac $ubi; java $nombre"
      ejecuta
   fi

   if [ $extencion = "cpp" ] || [ $extencion = "c"  ]
   then
      echo "Esto es c"
      comando=" gcc "$ubi" -o $nombre -lm; ./$nombre"
      ejecuta
   fi

   if [ $extencion = "sh"  ]
   then
      echo "Este es un bash"
      comando="sh $ubi"
      ejecuta
   fi

   if [ $extencion = "clj"  ]
   then
      del=$(whereis .lein)
      del=${del#*:}

      if [ ! -f $del/profiles.clj ];
      then
      echo " ejecuta estas instrucciones en una terminal: sudo su; echo "{:user {:plugins [[lein-exec "0.3.5"]]}}" > $del/profiles.clj;"
      fi

      echo "Esto es un clojure"
      comando="lein exec $ubi"
      ejecuta
   fi

   if [ $extencion = "asm"  ]
then


 if [ $ensamblador = "NASM" ]
 then

   if [ $bits = "32" ] && [ $debug = "false" ]
   then
   echo "ensamblador 32 bits"
   comando="sudo nasm -f elf  $ubi; ld -m elf_i386 -s -o $nombre $nombre.o;sudo ./$nombre"
   ejecuta
   fi

   if [ $bits = "64" ] && [ $debug = "false" ]
   then
   echo "ensamblador 64 bits"
   comando="sudo nasm -f elf64  $ubi; ld -m elf_x86_64 -s -o $nombre $nombre.o;sudo ./$nombre"
   ejecuta
   fi

   if [ $bits = "32" ] && [ $debug = "true" ]
   then
   echo "ensamblador 32 bits [DEBUG]"
   comando="sudo nasm -f elf  $ubi; ld -m elf_i386 -s -o $nombre $nombre.o;sudo strace ./$nombre; size $nombre; objdump -x $nombre;objdump -D $nombre"
   ejecuta
   fi

   if [ $bits = "64" ] && [ $debug = "true" ]
   then
   echo "ensamblador 64 bits [DEBUG]"
   comando="sudo nasm -f elf64  $ubi; ld -m elf_x86_64 -s -o $nombre $nombre.o;sudo strace ./$nombre; size $nombre; objdump -x $nombre;objdump -D $nombre"
   ejecuta
   fi

fi

   #if [ $ensamblador = "TASM" ]
   #comando="$1"
   #ejecuta
   #fi

   if [ $ensamblador = "SINSO" ]
   then
   echo "ensamblador 32 sin S.O"
   comando="sudo  nasm -f bin $ubi -o $nombre.bin;  dd if=/dev/zero of=$nombre.iso count=2880; dd if=$nombre.bin of=$nombre.iso conv=notrunc; sudo qemu-system-i386 $nombre.iso"
   ejecuta
   fi

fi

fi

}


if [[ $archivo =~ "ascii" ]]
then
   echo "Este es un ascii"
   pextencion
fi


if [[ $archivo =~ "perl" ]]
then
   echo "Este es un perl"
#perl $1

#if [ $? -eq 0 ]
#then
    comando="perl $1"
    ejecuta
#fi

fi

if [[ $archivo =~ "python" ]]
then
   echo "Este es un python"

comando="python $1"
ejecuta

fi

if [[ $archivo =~ "c source" ]]
then
   echo "Este es c"

   gcc "$1" 2> /dev/null

   if [ $? -eq 0 ]
then
    comando=" gcc "$1" -o $2 -lm; ./$2 "
    ejecuta
fi

fi

if [[ $archivo =~ "c++ source" ]]
then
   echo "Este es c++"

   g++ "$1" 2> /dev/null

   if [ $? -eq 0 ]
then
    comando=" g++ "$1" -o $2; ./$2"
    ejecuta
fi

fi

if [[ $archivo =~ "html" ]]
then
   #echo "Este es un html"
comando="$navegador $1"
ejecuta
fi

if [[ $archivo =~ "javascritp" ]]
then
   echo "javascritp"
    echo "<!DOCTYPE HTML><html><head><meta charset="utf-8"><meta name="viewport" content="width=device-width"><title></title></head><body><p><script src="$1"></script></p></body></html>" > $UB.html
    comando="$navegador $UB.html"
    ejecuta
fi

if [[ $archivo =~ "shell" ]]
then
   #echo "Este es un bash"
comando="sh $1"
ejecuta
fi

if [[ $archivo =~ "go" ]]
then
   #echo "Este es un go"
comando="go $1"
ejecuta
fi


if [[ $archivo =~ "java" ]]
then
   #echo "Este es un java"
comando="javac $1; java $2"
ejecuta
fi

if [[ $archivo =~ "ruby" ]]
then
   #echo "Este es un ruby"
comando="ruby $1"
ejecuta
fi

if [[ $archivo =~ "julia" ]]
then
   #echo "Esto es julia"
comando="julia $1"
ejecuta
fi

if [[ $archivo =~ "lein" ]] #mejor si la extencion es  .clj
then

del=$(whereis .lein)
del=${del#*:}

if [ ! -f $del/profiles.clj ];
then
echo " ejecuta estas instrucciones en una terminal: sudo su; echo "{:user {:plugins [[lein-exec "0.3.5"]]}}" > $del/profiles.clj;"
fi

echo "Esto es un clojure"
comando="lein exec  $1"
ejecuta
fi



 pextencion
