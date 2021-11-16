#! /bin/sh

# Script revolves staywoke_en.txt motd's
# For pt just edit "*_en.txt" to "*_pt.txt"

# Eliminates blank lines
awk NF staywoke_en.txt > .motd_hold
cat .motd_hold > staywoke_en.txt

# Counts number of lines
motd_count=`wc -l < staywoke_en.txt`

# Pops first line
motd_head=`head -1 staywoke_en.txt`

# Outputs first line to file motd_misc
echo $motd_head > motd_misc

# Writes every other line to file .motd_hold
tail -$(($motd_count - 1)) staywoke_en.txt > .motd_hold

# Appends that first line to last line in .motd_hold
echo $motd_head >> .motd_hold

# Updates staywoke file
cat .motd_hold > staywoke_en.txt

# Clears .motd_hold
echo "" > .motd_hold
