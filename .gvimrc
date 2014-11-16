:" Took out all gui tweaks from my .vimrc and placed them hear as per vim
" startup guidelines.

" For Windows gVim GUI initializations. Probably should put all gui stuff in a .gvimrc
au GUIEnter * simalt ~x     " Fullscreen at start
set guioptions-=m           " Remove menu bar
set guioptions-=T           " Toolbar
set guioptions-=r           " Remove right-hand scroll bar
set guioptions-=L           " Remove left-hand scroll bar
set guifont=Source_Code_Pro_Medium:h8:cANSI

" Sets bg color to terminal
hi Normal ctermbg=None
hi LineNr ctermbg=None 

" Windows gVim gui background color set + lineNrLineNr
hi Normal guibg=black
hi NonText guibg=black guifg=magenta
hi LineNr guibg=black guifg=#339E77

" Cursor stuff
hi Cursor guifg=white guibg=#851939
hi iCursor guifg=#FF9B29 guibg=#FF4D29
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=i:blinkwait10

" Numbers on the bold current
set cursorline
hi CursorLine cterm=Bold ctermbg=233 ctermfg=None guibg=#330618
hi CursorLineNr ctermfg=42 ctermbg=233 guibg=#330618 guifg=#B0F723
hi LineNr ctermfg=100

" Bottom bar with showcmd StatisLn
hi StatusLine ctermbg=DarkCyan ctermfg=178 guibg=#2A0E99 guifg=#B0F723

" Visual mode and all mode highlighting
hi Visual term=standout cterm=inverse gui=inverse

" Comments highlighting foreground
hi Comment ctermfg=42 cterm=italic gui=italic guifg=#636363

" Fullscreen and set gVim Window opacityin Windows (requires 64-bit .dll)
if has('gui_running') && has('libcall')
  let g:MyVimLib = $VIMRUNTIME.'/gvimfullscreen.dll'
  function! ToggleFullScreen()
    call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)
  endfunction

  " Map F11 to Fullscreen
  map <F11> <Esc>:call ToggleFullScreen()<CR>

  let g:VimAlpha = 240
  function! SetAlpha(alpha)
    let g:VimAlpha = g:VimAlpha + a:alpha
    if g:VimAlpha < 180
      let g:VimAlpha = 180
    endif
    if g:VimAlpha > 255
      let g:VimAlpha = 255
    endif
    call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
  endfunction

  "Shift+Y increase vim bg alpha
  nmap <s-y> <Esc>:call SetAlpha(3)<CR>
  "Shift+T lower opacity
  nmap <s-t> <Esc>:call SetAlpha(-3)<CR>

  " gVim window always on top or not
  let g:VimTopMost = 0
  function! SwitchVimTopMostMode()
    if g:VimTopMost == 0
      let g:VimTopMost = 1
    else
      let g:VimTopMost = 0
    endif
    call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
  endfunction

  " Shift+R
  nmap <s-r> <Esc>:call SwitchVimTopMostMode()<CR>
endif
