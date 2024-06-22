#!/bin/bash

lists=($(curl -sk https://v.firebog.net/hosts/lists.php?type=tick))
tmpfile="/tmp/$(head /dev/urandom | LC_ALL=C tr -dc A-Za-z0-9 | head -c 40 ; echo '')"
filepath="${PWD}/docker-scripts/etc-pihole"
customlist="${filepath}/custom.list"
outfile="./pihole-update.out"

echo -e "\n  #### Creating tmpfile: $tmpfile"

for list in ${lists[@]}; do
    echo -e "\n  #### Adding $list --"
    curl -sk $list |grep -v "#" | grep -v -e '^$' |grep -v "localhost" | sed -r "s/0.0.0.0 |127.0.0.1 //" >> $tmpfile
done

echo -e "\n  #### Creating $customlist"
echo "" > ${customlist}
cat ${tmpfile} |uniq | sed -e 's/^/0.0.0.0 /' >> ${customlist}

if [[ -z $(grep "file://etc/pihole/custom.list" adlists.list) ]]; then
    echo -e "\n  #### Adding $customlist to adlists.list"
    echo "file://etc/pihole/custom.list" >> adlists.list
    echo -e "\n  #### $(date +%Y-%m-%d)" >> ${outfile}
    echo -e "\n  Adding custom.list to adlists.list" >> ${outfile}
fi

echo -e "\n  #### Removing tmpfile: $tmpfile"
rm ${tmpfile}

echo -e "\n  #### Git update"
git pull && git commit -a -m "auto update $date" && git push
