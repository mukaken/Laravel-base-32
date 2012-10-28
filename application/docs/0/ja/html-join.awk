/^<p><a name.+<\/a><\/p>$/ {
  sub("<p><a", "<a", $0)
  sub("</a></p>", "</a>", $0)
}

LN==1 {
  buff = $0
  next
}

! /^<\/pre>$/ {
  print buff
  buff = $0
  next
}

/^<\/pre>$/ {
  print buff "</pre>"
  buff = ""
  next
}

END {
  print buff
}