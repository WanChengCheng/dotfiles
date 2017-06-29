
" use ag in normal directories
call denite#custom#var('file_rec', 'command',
      \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" use git ls-files if we're in git repository
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files', '-co', '--exclude-standard'])

" sorter
call denite#custom#source(
      \ 'file_rec', 'sorters', ['sorter_sublime'])

" Use git list-files when in git repository
call denite#custom#alias('source', 'file_rec/git', 'file_rec')

" trigger Denite search, [open]
nmap <silent> [denite]open :<C-u>Denite
      \ `finddir('.git', ';') != '' ? 'file_rec/git' : 'file_rec'`<CR>

call denite#custom#option('default', 'prompt', '»')

" change the matched char highlight color
call denite#custom#option('default', 'highlight_mode_insert', 'WildMenu')

" select items insert mode
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

