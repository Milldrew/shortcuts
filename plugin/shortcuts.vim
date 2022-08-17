function! CreateCommands(dirPath, prefix) abort 
  call chdir(a:dirPath)
  let l:files = readdir(a:dirPath)
  let l:fullDirPaths = []
  for file in files
    if isdirectory(file)
      call add(l:fullDirPaths, [a:dirPath.'/'.file, file]) 
    endif
  endfor
  

  if len(fullDirPaths) > 0
    for dirPathWithName in fullDirPaths
      let l:dirPathCommand = dirPathWithName[0]
      let l:name  = dirPathWithName[1]
      let l:count = 0
      let l:suffix = ''
      for char in split(l:name, '\zs')
        echo char
        let l:suffix .= char
        let l:count += 1
        if l:count ==# 3
          break
        endif
      endfor
      let l:commandName= 'A' . l:suffix
      let l:commandName= substitute(l:commandName,'-','d','g')
      let isNameConflict =  has_key(s:commandNames, l:commandName)

      echo s:commandNames
      echo isNameConflict

      if (!isNameConflict)
        echo 'hi'
      echo l:dirPathCommand
      echo l:commandName
        exec 'command! '.l:commandName.' :e '.l:dirPathCommand
      else
        let s:conflict_count += 1
        let l:command_suffix = string(s:conflict_count)
        let l:commandName= l:commandName.l:command_suffix
      echo l:dirPathCommand
      echo l:commandName
        exec 'command! '.l:commandName.' :e '.l:dirPathCommand
      endif
      let s:commandNames[l:commandName] = 1

      call CreateCommands(l:dirPathCommand, a:prefix)
    endfor
  endif
echom s:commandNames  
endfunction
"check if an env variable exists
"
let s:alphabet = [
      \ 'A',
      \ 'B',
      \ 'C',
      \ 'D',
      \ 'E',
      \ 'F',
      \ 'G',
      \ 'H',
      \ 'I',
      \ 'J',
      \ 'K',
      \ 'L',
      \ 'M',
      \ 'N',
      \ 'O',
      \ 'P',
      \ 'Q',
      \ 'R',
      \ 'S',
      \ 'T',
      \ 'U',
      \ 'V',
      \ 'W',
      \ 'X',
      \ 'Y',
      \ 'Z',
      \ ]
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

let s:count = 0
let s:setPaths = []
for path in s:allPaths
  if (path !=# "")

    call add(s:setPaths, [path, s:alphabet[s:count]])
  endif
  let s:count += 1
endfor
echo s:setPaths

for path in s:setPaths
  let s:conflict_count = 0
  let s:commandNames = {}
echo path

call CreateCommands(path[0], path[1])
endfor
