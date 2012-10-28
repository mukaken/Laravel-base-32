NR == 1 {
  file = substr(FILENAME, 3, length(FILENAME)-5)
  file = gensub("/", "-", "g", file)
  print "{ #" file " }"
}


/<a name=".+"/ {
  file = substr(FILENAME, 3, length(FILENAME)-5)
  file = gensub("/", "-", "g", file)
  print "{ #" file "-" substr($0, 10, length($0)-15) " }"
  next
}

# 行中に [...](#...)があれば処理
/\[.+\]\(#[^\)]+\)/ {
  while(match($0, /\]\(#/) != 0) {
    file = substr(FILENAME, 3, length(FILENAME)-5)
    file = gensub("/", "-", "g", file)
    match($0, /#([^\)]+)\)/, matched)
    part = "$$$" file "-" matched[1]
    $0 = gensub(/#[^\)]+/, part, "1", $0)
  }
}

# 行中に[...](/docs/...)か(docs/...)があれば処理
/\[.+\]\(\/?docs\/[^\)]+\)/ {
  while(match($0, /\(\/?docs\// ) != 0) {
    match($0, /\(\/?docs\/([^\)]+)\)/, matched)
    part = gensub("/", "-", "1", matched[1])
    part = "$$$" gensub("#", "-", "1", part)
    $0 = gensub(/\/?docs\/[^\)]+/, part, "1", $0)
  }
}

{
  $0 = gensub(/\$\$\$/, "#", "g", $0)
  print $0
}