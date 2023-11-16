#!/bin/bash

function main_menu() {
    clear
    echo "--------------------------------------------"
    echo "        Inicio - Centro de Computo              "
    echo "--------------------------------------------"
    echo "1. Gestion Usuarios"
    echo "2. Auditoria Logs"
    echo "3. Resplado Manuales"
    echo "4. Respaldo Automaticos"
    echo "5. Reglas de Firewall"
    echo "6. Instalar MySQL"
    echo "7. Instalar GIT"
    echo "0. Exit"
    echo "--------------------------------------------"
    read -p "Seleccione una opcion: " opcion

    case $opcion in
        1)
            gestion_usuarios
            ;;
        2)
            logs
            ;;
        3)
            echo "Falta Implementar"
            sleep 2
            ;;
        4)
            echo "Falta Implementar"
            sleep 2
            ;;
        5)
            firewall
            ;;
        6)
            mysql
            ;;
        7)
            git
            ;;
        0)
            echo "Saliendo del Centro de Computo..."
            exit 0
            ;;
        *)
            echo "Opcion invalida"
            sleep 2
            ;;
    esac
}

function gestion_usuarios() {
    clear
    echo "------------------------------------------------"
    echo "    Gestion de Usuarios - Centro de computo     "
    echo "------------------------------------------------"
    echo "1. Listar Usuarios"
    echo "2. Agregar Usuario"
    echo "3. Eliminar Usuario"
    echo "0. Volver"
    echo "------------------------------------------------"
    read -p "Seleccione una opcion: " subopcion

    case $subopcion in
        1)
            clear
            echo "------------------------------------------------"
            echo "      Listar Usuarios - Centro de computo     "
            echo "------------------------------------------------"
            getent passwd | cut -d: -f1
            echo "Presiona Enter para continuar..."
            read
            gestion_usuarios
            ;;
        2)
            clear
            echo "------------------------------------------------"
            echo "      Agregar Usuario - Centro de computo     "
            echo "------------------------------------------------"
            read -p "Ingresa Nombre de Usuario: " usuario
            read -p "Ingresa Contraseña de Usuario: " password
            read -p "Ingresa Grupo de Usuario: " grupo
            sudo useradd -m -p $password -g $grupo $usuario
            echo "Agregado Correctamente...."
            echo "Presiona Enter para continuar..."
            read
            gestion_usuarios
            ;;
        3)
            clear
            echo "------------------------------------------------"
            echo "      Eliminar Usuario - Centro de computo     "
            echo "------------------------------------------------"
            read -p "Ingresa Nombre de Usuario: " username
            if id "$username" &>/dev/null; then
                sudo userdel -r "$username"
                echo "El usuario $username ha sido eliminado."
            else
                echo "El usuario $username no existe en el sistema."
            fi
            echo "Presiona Enter para continuar..."
            read
            gestion_usuarios
            ;;
        0)
            main_menu
            ;;
        *)
            echo "Opcion invalida"
            sleep 2
            ;;
    esac
}


function logs() {
    clear
    echo "------------------------------------------------"
    echo "      Auditoria Logs - Centro de computo     "
    echo "------------------------------------------------"
    echo "1. Logs de Sistema"
    echo "2. Usuarios Conectados"
    echo "3. Ultimas Conexiones Realizadas"
    echo "0. Volver"
    echo "------------------------------------------------"
    read -p "Seleccione una opcion: " subopcion

    case $subopcion in
        1)
            clear
            echo "------------------------------------------------"
            echo "      Logs de Sistema - Centro de computo     "
            echo "------------------------------------------------"
            if check_ubuntu; then
                tail /var/log/syslog
            elif check_centos; then
                tail /var/log/messages
            else
                echo "Este Script solo es compatible con CentOS o Ubuntu"
            fi
            echo "Presiona Enter para continuar..."
            read
            logs
            ;;
        2)
            clear
            echo "------------------------------------------------"
            echo "      Usuarios Conectados - Centro de computo     "
            echo "------------------------------------------------"
            who
            echo "Presiona Enter para continuar..."
            read
            logs
            ;;
        3)
            clear
            echo "------------------------------------------------"
            echo "      Ultimas Conexiones - Centro de computo     "
            echo "------------------------------------------------"
            last
            echo "Presiona Enter para continuar..."
            read
            logs
            ;;
        0)
            main_menu
            ;;
        *)
            echo "Opcion invalida"
            sleep 2
            logs
            ;;
    esac
}


function firewall() {
    clear
    echo "------------------------------------------------"
    echo "      Firewall - Centro de computo     "
    echo "------------------------------------------------"
    read -p "Desea aplicar las reglas de firewall? (s, n)" op
    case $op in
        "s")
            iptables -A INPUT -p tcp -dport 22 -m state -state NEW -m recent -rcheck -seconds 60 -hitcount 4 -name ssh -rsource -j DROP
            echo "Reglas de Firewall aplicadas..."
            echo "Presiona Enter para continuar..."
            read
            main_menu
            ;;
        "n")
            main_menu
            ;;
        *)
            echo "Opcion invalida"
            sleep 2
            firewall
            ;;
    esac

}


function mysql() {
    clear
    echo "------------------------------------------------"
    echo "      Instalar MySQL - Centro de computo     "
    echo "------------------------------------------------"
    read -p "Desea instalar mysql? (s, n)" op
   # Verificar si el sistema es basado en Debian/Ubuntu o en Red Hat/CentOS
    if [ -f "/etc/debian_version" ]; then
        sudo apt-get update
        sudo apt-get install -y mysql-server
        sudo systemctl enable mysql
        sudo systemctl start mysql
    elif [ -f "/etc/redhat-release" ]; then
        sudo yum install -y mysql-server
        sudo systemctl enable mysqld
        sudo systemctl start mysqld
    else
        echo "Este script solo es compatible con sistemas basados en Debian/Ubuntu o en Red Hat/CentOS."
        echo "Presiona Enter para continuar..."
        read
        main_menu
    fi

    echo "MySQL ha sido instalado y está en ejecución."
    echo "Presiona Enter para continuar..."
    read
    main_menu

}


function git() {
    clear
    echo "------------------------------------------------"
    echo "      Instalar GIT - Centro de computo     "
    echo "------------------------------------------------"
    read -p "Desea instalar GIT? (s, n)" op
   # Verificar si el sistema es basado en Debian/Ubuntu o en Red Hat/CentOS
    if [ -f "/etc/debian_version" ]; then
        sudo apt-get update
        sudo apt-get install -y git
    elif [ -f "/etc/redhat-release" ]; then
        sudo yum install -y git
    else
        echo "Este script solo es compatible con sistemas basados en Debian/Ubuntu o en Red Hat/CentOS."
        echo "Presiona Enter para continuar..."
        read
        main_menu
    fi

    echo "GIT ha sido instalado correctamente."
    echo "Presiona Enter para continuar..."
    read
    main_menu

}




# Función para verificar si estoy en Ubuntu
check_ubuntu() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" == "ubuntu" ]; then
            return 0
        fi
    fi
    return 1
}

# Función para verificar si estoy en CentOS
check_centos() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ "$ID" == "centos" ]; then
            return 0
        fi
    fi
    return 1
}

while true; do
    main_menu
done