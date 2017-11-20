set number relativenumber

" map jk to esc
inoremap jk <Esc>

" theme
" set termguicolors
colorscheme nord

" IndentLine

" vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set t_8f=[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=[48;2;%lu;%lu;%lum  " Ditto

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1


" flow
let g:javascript_plugin_flow = 1
let g:flow#autoclose = 1

"Use locally installed flow
let local_flow = finddir('node_modules', ';') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow = getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

" key mapping
nnoremap fgd :FlowJumpToDef<CR>

" vim-jsx
" enable jsx syntax in normal js file
let g:jsx_ext_required = 0

" necoghc
" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" ghc-mod
hi ghcmodType ctermbg=yellow
let g:ghcmod_type_highlight = 'ghcmodType'
nnoremap tt :GhcModType<CR>
nnoremap te :GhcModTypeClear<CR>
nnoremap ts :GhcModSplitFunCase<CR>
nnoremap tg :GhcModSigCodegen<CR>
nnoremap tw ::GhcModTypeInsert<CR>

" CtrlP mappings
nnoremap <Leader>bb :CtrlPBuffer<CR>
nnoremap <Leader>mm :CtrlPMRUFiles<CR>

" root marker
let g:ctrlp_root_markers = ['.ctrlp']

" Edit file shortcut section
" gitmessage
function! s:get_local_gitmessage_path()
  return findfile('.gitmessage', ';')
endfunction

command! Todo :exec "e " . s:get_local_gitmessage_path()

" vimrc
command! Evimrc :e ~/.vimrc.local
command! Evimplug :e ~/.vimrc.bundles.local

" deoplete
let g:deoplete#enable_at_startup = 1

" nerd tree
nnoremap <Leader>ft :NERDTreeToggle<CR>

" ale
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_column_always = 1
let g:ale_pattern_options = {
  \   '.*\.purs$': {'ale_enabled': 0},
  \}
let g:ale_emit_conflict_warnings = 0

" syntastic
let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': ['purescript'] }

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

