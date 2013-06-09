## unite.vim から tmux を操作するプラグイン

### 1. 概要
unite.vim で選択中のファイル、ディレクトリを tmux の別ウィンドウ、別ペインで開くプラグインです

具体的には unite kind 'file, directory' に対して以下の２つのアクションを追加します

* tmux_window
 * 選択中のファイル、ディレクトリを tmux の新規ウィンドウで開きます
* tmux_split
 * 選択中のファイル、ディレクトリを tmux の新規ペインで開きます

```vimrc
お好みでマッピングして下さい (例)
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " <leader>c で選択中のファイル、ディレクトリを tmux の新規ウィンドウで開く
    nmap <leader>c :call unite#mappings#do_action('tmux_window')<CR>
    " <leader>s で選択中のファイル、ディレクトリを tmux の新規ペインで開く
    nmap <leader>s :call unite#mappings#do_action('tmux_split')<CR>
endfunction
```
