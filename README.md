# tutorial_bash_script_lunux
Tutorial practica sobre los comandos y creación bash script de linux [https://linuxconfig.org/bash-scripting-tutorial-for-beginners]

###Que es Shell
Lo más probable es que en este momento esté sentado frente a su computadora, tenga una ventana de terminal abierta y se 
pregunte: "¿Qué debo hacer con esta cosa?"

Bueno, la ventana de terminal frente a usted contiene shell , y shell le permite mediante el uso de comandos para 
interactuar con su computadora, por lo tanto, recuperar o almacenar datos, procesar información y otras tareas simples o incluso extremadamente complejas.

##Primier script
    nano task.sh
    #una vez abierto el editor ingresar
    date # fecha calendario del sistema
    pwd # path de la carpeta donde estamos parado
    whoami # usuario que esta logiado al linux
    
luego de crear el archivo debemos darle permiso de ejecutable con el comando

    chmod +x task.sh

Para ejecutar el script

    ./task.sh
Otra manera de correr un bash script es escribiendo 

    bash task.sh
    
##Path elativo vs absoluto
Un nombre de ruta absoluto es uno que comienza con el /carácter, que significa la raíz del árbol del sistema de archivos. Por lo tanto, otra forma de ir a su directorio de inicio es:
    $ pwd / usr / local / bin 
na ruta relativa es aquella que comienza con el nombre de un directorio conectado al directorio actual. Por ejemplo, si está en el /usrdirectorio, escribir solo cd bin(sin preceder "bin" con "/")  


##Redirecciones de entrada, salida y error

La diferencia entre la salida stdout y stderr es un concepto esencial ya que nos permite una amenaza,
es decir, redirigir cada salida por separado. La >notación se usa para redirigir stdout a un archivo,
 mientras que la 2>notación se usa para redirigirstderr y &>se usa para redirigir tanto stdout 
 como stderr . El catcomando se usa para mostrar un contenido de cualquier archivo dado. 
 Considere un siguiente ejemplo

    linuxconfig.org:~$ ls foobar barfoo                                                                       
    ls: cannot access 'barfoo': No such file or directory                                                     
    foobar                                                                                                    
    linuxconfig.org:~$ ls foobar barfoo > stdout.txt                                                          
    ls: cannot access 'barfoo': No such file or directory                                                     
    linuxconfig.org:~$ ls foobar barfoo 2> stderr.txt                                                         
    foobar                                                                                                    
    linuxconfig.org:~$ ls foobar barfoo &> stdoutandstderr.txt                                                
    linuxconfig.org:~$ cat stdout.txt                                                                         
    foobar                                                                                                    
    linuxconfig.org:~$ cat stderr.txt                                                                         
    ls: cannot access 'barfoo': No such file or directory                                                     
    linuxconfig.org:~$ cat stdoutandstderr.txt                                                                
    ls: cannot access 'barfoo': No such file or directory                                                     
    foobar                                                                                                    
      


##Comparaciones numéricas y de cadenas
En esta sección, vamos a aprender algunos conceptos básicos de las comparaciones de shell de bash numérico y de cadena. Usando comparaciones, podemos comparar cadenas (palabras, oraciones) o números enteros sin procesar o como variables. La siguiente tabla enumera operadores de comparación rudimentarios para números y cadenas:

<table class="uk-table uk-table-striped uk-table-condensed"><caption><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Bash Shell Numérico y comparaciones de cadenas</font></font></caption> <thead> <tr> <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Descripción</font></font></th> <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Comparación numérica</font></font></th> <th><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Comparación de cadenas</font></font></th> </tr> </thead><tfoot> <tr> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Ejemplo de comparación de shell: </font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">[100 -eq 50]; </font><font style="vertical-align: inherit;">echo $?</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">["GNU" = "UNIX"]; </font><font style="vertical-align: inherit;">echo $?</font></font></td> </tr> </tfoot> <tbody> <tr> <td class="uk-text-primary uk-text-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">menos que</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">-lt</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">&lt;</font></font></td> </tr> <tr> <td class="uk-text-primary uk-text-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">mas grande que</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">-gt</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">&gt;</font></font></td> </tr> <tr> <td class="uk-text-primary uk-text-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">igual</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">-eq</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">=</font></font></td> </tr> <tr> <td class="uk-text-primary uk-text-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">no es igual</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">-Nebraska</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">! =</font></font></td> </tr> <tr><td class="uk-text-primary uk-text-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">menor o igual</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">-le</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">N / A</font></font></td> </tr>  <tr><td class="uk-text-primary uk-text-bold"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">mayor o igual</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">-ge</font></font></td> <td><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">N / A</font></font></td> </tr> </tbody> </table>

#### Ejemplo de comparaciones

    a=1
    b=2
    # a menor que b
    [ $a -lt $b ]; echo $?
    # b mayor que a
    [ $b -gt $a ]; echo $?
    # a igual que b
    b=1
    [ $a -eq $b ]; echo $?
    # a menor o igual que b
    [ $a -le ]: echo $?
    # b mayor o igual que a
    b=2
    [ $b -ge $a ]; echo $?
    # a no es igual que b
    [ $a -ne $b ]; echo $?

###condicional if / else
  
  #!/bin/bash

    num_a=400
    num_b=200
    
    if [ $num_a -lt $num_b ]; then
        echo "$num_a is less than $num_b!"
    else
        echo "$num_a is greater than $num_b!"
    fi  

para comprimir un archivo o diretorio ejemplo

    user=$(whoami)
    input=/home/${user}/trabajos/tutorial_bash_script_lunux
    ouput=/tmp/${user}_home_$(date +%Y-%m-%d_%H%M%S).tar.gz
    
    tar -czf $ouput $input 2> /dev/null
    
## For Loop
Para recorrrer una lista de elementos usaremos el ciclo for que es similar al for de python, su sintaxis y ejemplo

    for i in 1 2 3; do
        echo $i
    done
    
El comando wc sirve para hacer un conteo de bytes, caracteres, lineas y palabras de un archivo(s). 
Y si se pide información de varios archivos da además un total de los parámetros.
ejemplo del uso comando wc [ https://travesuras.wordpress.com/2013/02/04/20130204-1/]
 
Usaremos un ciclo for para recorrer cada linea del archivo items.txt, contara los caracteres de las 
palabras en cada linea

    # un ciclo for en una linea recordar que cada comando se debe finalizar con ";"
    for i in $( cat items.txt); do  echo -n $i | wc -c; done
    
    # tambien 
    for i in %( cat > items.txt); do
        echo -n $i | wc -c
    done
    
Escrimimos el mismo for anterior pero estaves recorremos el directorio actual que lo obtenemos con pwd
y ls para mostrar todos los archivos ls pwd
    # estamos en el directorio actual con el comando ls pwd

    for i in $( ls $pwd );
    do
         echo -n  " $i is " ; echo $i | wc -c
    done
