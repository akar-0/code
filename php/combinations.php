function perm($a) {
  if (is_string($a)) $a=str_split($a);
  if(count($a)==1) return $a;
  $o=[];
  foreach($a as $key => $item){
      foreach(perm(array_diff_key($a, array($key => $item))) as $p){
          $o[]=$item.$p;
      }
  }
  return $o;
}
