ITS=$HOME/src/its2
HARSCN=$ITS/tools/dasm/harscntopbm

rm -f _temp_/harscn.*
itstar xf $ITS/x.dump
$HARSCN -Wits _temp_/harscn.* | pnmsplit - letter%d.pbm
for i in letter?.pbm; do
    pnmflip -r90 $i | pnmtopng > `basename $i .pbm`.png
done

