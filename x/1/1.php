<?php

$sumnum = 0;
$num    = 1000;
for( $i=0; $i<$num; $i++ )
{
  if( $i % 3 == 0 || $i % 5 == 0 )
    $sumnum += $i;
}

echo $sumnum."\n";

?>
