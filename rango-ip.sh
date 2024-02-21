#!/bin/bash

#Pida dos IP de entrada y luego una IP y comprobar si está en el rango
validacion=true


#Mínimo del rango
octeto1_1=`echo $1 | cut -d"." -f1`
octeto2_1=`echo $1 | cut -d"." -f2`
octeto3_1=`echo $1 | cut -d"." -f3`
octeto4_1=`echo $1 | cut -d"." -f4`

#Máximo del rango
octeto1_2=`echo $2 | cut -d"." -f1`
octeto2_2=`echo $2 | cut -d"." -f2`
octeto3_2=`echo $2 | cut -d"." -f3`
octeto4_2=`echo $2 | cut -d"." -f4`


while true
do

	read -p "IP:  (0.0.0.0)Salir: " ip
	if [ $ip == "0.0.0.0" ]
	then
		salida=false
		break
	fi
	#IP dada por el usuario
	octeto1_ip=`echo $ip | cut -d"." -f1`
	octeto2_ip=`echo $ip | cut -d"." -f2`
	octeto3_ip=`echo $ip | cut -d"." -f3`
	octeto4_ip=`echo $ip | cut -d"." -f4`


	#Gestionar IPs por clases

	if [ $octeto1_ip -ge 0 ] && [ $octeto1_ip -le 127 ]
	then
		echo $ip >> CLASE_A.txt
	fi
	if [ $octeto1_ip -ge 128 ] && [ $octeto1_ip -le 191 ]
	then
		echo $ip >> CLASE_B.txt
	fi
	if [ $octeto1_ip -ge 192 ] && [ $octeto1_ip -le 223 ]
	then
		echo $ip >> CLASE_C.txt
	fi
	if [ $octeto1_ip -ge $octeto1_1 ] && [ $octeto1_ip -le $octeto1_2 ]
	then
		if [ $octeto2_ip -ge $octeto2_1 ] && [ $octeto2_ip -le $octeto2_2 ]
		then
			if [ $octeto3_ip -ge $octeto3_1 ] && [ $octeto3_ip -le $octeto3_2 ]
			then
				if [ $octeto4_ip -ge $octeto3_1 ] && [ $octeto4_ip -le $octeto4_2 ]
				then
					echo "Esta IP está en el rango"
				else
					echo "Esta IP no está en el rango"
				fi
			else
				echo "Esta IP no está en el rango"
			fi
		else
			echo "Esta IP no está en el rango"
		fi
	else
		echo "Esta IP no está en el rango"
	fi
done
