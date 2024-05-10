#!/bin/bash
#Author: Davide Rinarelli
#GPL

arr=($(nvidia-smi | sed '10!d'))

c1="#444444"
c2="#55aa55"
c3="#557755"
c4="#f5a70a"
c5="#ff5555"

num=${arr[12]::-1}
pcpu=${arr[12]}
if [ -z $num ]; then
    num="-"
elif [ $num -lt 10 ]; then
    usg="%{F$c1}▁%{F-}"
elif [ $num -lt 20 ]; then
    usg="%{F$c2}▂%{F-}"
elif [ $num -lt 35 ]; then
    usg="%{F$c3}▃%{F-}"
elif [ $num -lt 50 ]; then
    usg="%{F$c3}▄%{F-}"
elif [ $num -lt 65 ]; then
    usg="%{F$c4}▅%{F-}"
elif [ $num -lt 85 ]; then
    usg="%{F$c4}▇%{F-}"
else 
    usg="%{F$c5}█%{F-}"
fi  

vram=${arr[8]::-3}
tvram=${arr[10]::-3}
pvram=$((100 * $vram/$tvram))


bf0="#689d6a"
bf1="#fabd2f"
bf2="#fe8019"
bf3="#fb4934"
barfill="▐"
bar="▐"
bef="#444444"

if [ -z $pvram ]; then
    pvram="-"
fi 

#if [ -z $vram ]; then
#    vram="-"
#elif [ $((100 * $vram/$tvram)) -lt 10 ]; then
#    vram="%{F$c1}▁%{F-}"
#elif [ $((100 * $vram/$tvram)) -lt 20 ]; then
#    vram="%{F$c2}▂%{F-}"
#elif [ $((100 * $vram/$tvram)) -lt 35 ]; then
#    vram="%{F$c3}▃%{F-}"
#elif [ $((100 * $vram/$tvram)) -lt 50 ]; then
#    vram="%{F$c3}▄%{F-}"
#elif [ $((100 * $vram/$tvram)) -lt 70 ]; then
#    vram="%{F$c4}▅%{F-}"
#elif [ $((100 * $vram/$tvram)) -lt 90 ]; then
#    vram="%{F$c4}▇%{F-}"
#else 
#    vram="%{F$c5}█%{F-}"
#fi


if [ -z $vram ]; then
    vram="-"
elif [ $((100 * $vram/$tvram)) -lt 10 ]; then
    vram="%{F$bf0}$bar%{F-}%{F$bef}$bar$bar$bar$bar$bar$bar$bar%{F}"
elif [ $((100 * $vram/$tvram)) -lt 20 ]; then
    vram="%{F$bf0}$bar$bar%{F-}%{F$bef}$bar$bar$bar$bar$bar$bar%{F}"
elif [ $((100 * $vram/$tvram)) -lt 35 ]; then
    vram="%{F$bf0}$bar$bar%{F-}%{F$bf1}$bar%{F-}%{F$bef}$bar$bar$bar$bar$bar%{F}"
elif [ $((100 * $vram/$tvram)) -lt 50 ]; then
    vram="%{F$bf0}$bar$bar%{F-}%{F$bf1}$bar$bar%{F-}%{F$bef}$bar$bar$bar$bar%{F}"
elif [ $((100 * $vram/$tvram)) -lt 70 ]; then
    vram="%{F$bf0}$bar$bar%{F-}%{F$bf1}$bar$bar%{F-}%{F$bf2}$bar%{F-}%{F$bef}$bar$bar$bar%{F}"
elif [ $((100 * $vram/$tvram)) -lt 80 ]; then
    vram="%{F$bf0}$bar$bar%{F-}%{F$bf1}$bar$bar%{F-}%{F$bf2}$bar$bar%{F-}%{F$bef}$bar$bar%{F}"
elif [ $((100 * $vram/$tvram)) -lt 90 ]; then
    vram="%{F$bf0}$bar$bar%{F-}%{F$bf1}$bar$bar%{F-}%{F$bf2}$bar$bar%{F-}%{F$bf3}$bar%{F-}%{F$bef}$bar%{F}"
else 
    vram="%{F$bf0}$bar$bar%{F-}%{F$bf1}$bar$bar%{F-}%{F$bf2}$bar$bar%{F-}%{F$bf3}$bar$bar%{F-}"
fi  


tmp=${arr[2]::-1}
if [ -z $tmp ]; then
    tmp="-"
fi 

#$pvram"%"
echo $pcpu $usg "%{F#d79921}Vram%{F-}"$vram "|" $tmp"°C"

#echo "utilizzo ventola: " ${arr[1]}
#echo "temperatura gpu: " ${arr[2]::-1}"°C"
#echo "memoria usata: " ${arr[8]::-3} 
#echo "memoria totale: " ${arr[10]}
#echo "percentuale utilizzo: " ${arr[12]}
