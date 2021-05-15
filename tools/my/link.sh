#!/bin/bash

if [[ $1 == '' ]] 
then
echo -e "mention the pattron and file\n(domain,domain-path,path,files)"
elif [[ $2 == '' ]]
then

if [ $1 == "domain" ]
then 
<<<<<<< HEAD
grep -Eao "(https*://)?[a-zA-Z0-9-]{3,}\.[a-z]{2,3}[^a-zA-Z0-9]+" | sort -u
=======
grep -Eao "(https*://)?([a-zA-Z0-9\_\-]*\.*)([a-zA-Z0-9\_-]{2,}\.(([a-z]{4})|([a-z]{3})|([a-z]{2})))" | sort -u
>>>>>>> kl
elif [ $1 == "domain-path" ]
then
grep -Eao "(https*://)?[a-zA-Z0-9\.-]*[a-zA-Z0-9-]{3,}\.[a-zA-Z]{2,3}\/[^\'\"\<\>\;\,\ \: ]+" | sort -u
elif [ $1 == "path" ]
then
grep -Eao "/[^\<\>\;\,\ \: ]*" | grep -vE '^\W*[a-zA-Z0-9]{,1}\W*$' | sort -u
elif [ $1 == "files" ]
then
grep -Eao "[a-zA-Z0-9\_\/\.-]*\.(?:php|asp|aspx|jsp|json|action|html|js|txt|xml|config|conf)" | sort -u
fi

else

if [ $1 == "domain" ]
then 
<<<<<<< HEAD
cat $2 | grep -Eao "(https*://)?[a-zA-Z0-9-]{3,}+\.[a-z]{2,3}[^a-zA-Z0-9]+" | sort -u
=======
cat $2 | grep -Ewao "(https*://)?([a-zA-Z0-9\_\-]*\.*)([a-zA-Z0-9\_-]{2,}\.(([a-z]{4})|([a-z]{3})|([a-z]{2})))" | sort -u
>>>>>>> kl
elif [ $1 == "domain-path" ]
then
cat $2 | grep -Eao "(https*://)?[a-zA-Z0-9\.-]*[a-zA-Z0-9-]{3,}\.[a-zA-Z]{2,3}[^\'\"\<\>\;\,\ \: ]+" | sort -u
elif [ $1 == "path" ]
then
cat $2 | grep -Eao "/[^\<\>\;\,\ \: ]*" | grep -vE '^\W*[a-zA-Z0-9]{,1}\W*$' | sort -u
elif [ $1 == "files" ]
then
cat $2 | grep -Eao "[a-zA-Z0-9\_\/\.-]*\.(?:php|asp|aspx|jsp|json|action|html|js|txt|xml|config|conf)" | sort -u
fi

fi

