#! /bin/sh

# Script revolves staywoke_en.txt motd's
# For pt just edit "*_en.txt" to "*_pt.txt"

motd_count=`wc -l < staywoke_en.txt`

motd_head=`head -1 staywoke_en.txt`
echo $motd_head > motd_misc
tail -$(($motd_count - 1)) staywoke_en.txt > .motd_hold
echo $motd_head >> .motd_hold

cat .motd_hold > staywoke_en.txt
echo "" > .motd_hold
