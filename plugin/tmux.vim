let s:save_cpo = &cpo
set cpo&vim

" 新しい tmux window を開いて選択中のディレクトリに cd
let s:tmux_window = {
      \ 'description' : 'open by new tmux window',
      \ 'is_selectable' : 1,
      \ }
function! s:tmux_window.func(candidates)"{{{
  for l:candidate in a:candidates
    let l:dir = isdirectory(l:candidate.word) ? l:candidate.word : fnamemodify(l:candidate.word, ':p:h')
    call system("tmux new-window 'cd " . l:dir . " ; `echo $SHELL`'")
  endfor
endfunction"}}}
call unite#custom_action('file,directory', 'tmux_window', s:tmux_window)
unlet s:tmux_window

" 新しい tmux pane を開いて選択中のディレクトリに cd
let s:tmux_split = {
      \ 'description' : 'open by new tmux pane (horizontal split)',
      \ 'is_selectable' : 1,
      \ }
function! s:tmux_split.func(candidates)"{{{
  for l:candidate in a:candidates
    let l:dir = isdirectory(l:candidate.word) ? l:candidate.word : fnamemodify(l:candidate.word, ':p:h')
    call system("tmux split-window 'cd " . l:dir . " ; `echo $SHELL`'")
  endfor
endfunction"}}}
call unite#custom_action('file,directory', 'tmux_split', s:tmux_split)
unlet s:tmux_split

let &cpo = s:save_cpo
unlet s:save_cpo
