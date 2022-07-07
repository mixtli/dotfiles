function FoldText()
    let line = getline(v:foldstart)
    let numOfLines = v:foldend - v:foldstart
    let fillCount = winwidth('%') - len(line) - len(numOfLines) - 14
    return line . '  ' . repeat('.', fillCount) . ' (' . numOfLines . ' L)'
endfunction
set foldtext=FoldText()
set fillchars=fold:\  " removes trailing dots. Mind that there is a whitespace after the \!
