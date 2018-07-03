<?php
$delete = exec("rm /library/calibre/users.sqlite");
$copy = exec("cp /home/fzt-iiab/users.sqlite /library/calibre/");
$reload = exec("sudo /home/fzt-iiab/./rp.sh");
print "$delete";
print "$copy";
print "$reload";
	echo "<a href= /home/>Regreso a menu principal</a>";
?>

