"check if an env variable exists
"
let s:allPaths = [
      \ $A,
      \ $B,
      \ $C,
      \ $D,
      \ $E,
      \ $F,
      \ $G,
      \ $H,
      \ $I,
      \ $J,
      \ $K,
      \ $L,
      \ $M,
      \ $N,
      \ $O,
      \ $P,
      \ $Q,
      \ $R,
      \ $S,
      \ $T,
      \ $U,
      \ $V,
      \ $W,
      \ $X,
      \ $Y,
      \ $Z,
      \ ]

let setPaths = []
for path in s:allPaths
echo path
  if (path !=# "")
    call add(setPaths, path)
  endif
endfor
  echo 'hi'
echo setPaths


