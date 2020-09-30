if [ -n "$1" ]; then

if [ "$1" = "on" ]; then
    sed -i "s/ autoindex off/ autoindex on/" /etc/nginx/sites-available/localhost
    echo "Autoindex enabled"
    service nginx reload
elif [ "$1" = "off" ]; then
    sed -i "s/ autoindex on/ autoindex off/" /etc/nginx/sites-available/localhost
    echo "Autoindex disabled"
    service nginx reload
else
    echo "Autoindex script requires a parameter [on/off] to enable or disable autoindex.
Please, try again with a valid parameter."
fi

else
echo "Autoindex script requires a parameter [on/off] to enable or disable autoindex.
Please, try again with a parameter."
fi

# To check if it really worked
# grep -w autoindex /etc/nginx/sites-available/localhost