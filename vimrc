 "wuxt's vimrc

 set nocompatible               " be iMproved
 filetype off                   " required!

 " KEY BINDINGS: {{{1
 " Set mapleader
 let mapleader=","
 
 "开启语法高亮
 "syntax on
 ""依文件类型设置自动缩进
 filetype indent plugin on
  
 "显示当前的行号列号：
 "set ruler
 ""在状态栏显示正在输入的命令
 set showcmd
  
 "显示行号：
 set number

 set foldenable      " 允许折叠  
 set foldmethod=marker   " {折叠
 "默认情况下不折叠
 set foldlevel=99 

 "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
 set completeopt+=longest
 " 
 " "离开插入模式后自动关闭预览窗口
 autocmd InsertLeave * if pumvisible() == 0|pclose|endif
 "  
 "  "回车即选中当前项
 inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
 "   
 "   "上下左右键的行为
 inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
 inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
 inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
 inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


 " 编译后，如有错误则打开quickfix窗口。（光标仍停留在源码窗口）
 " "
 " " 注意：需要开启netsting autocmd
 autocmd QuickFixCmdPost [^l]* nested cwindow
 autocmd QuickFixCmdPost    l* nested lwindow


 syntax on " syntax highlighting
 set autoindent " auto indent
 set smartindent " smart indent
 set cindent " use C style indent
 set cinoptions=:0 " C style indent options
 set nobackup " don't backup file
 set backupcopy=yes " overwrite the original file
 set autoread " auto read when file is modified outsite
 set autowrite " auto write when switch to other buffer
 set hidden " you can switch to other buffer when buffer is modified
 set expandtab " use spaces to instead <Tab>
 set tabstop=4 " number of spaces to <Tab>
 set softtabstop=4 " number of spaces to delete <Tab>
 set shiftwidth=4 " number of spaces when use "<<" and ">>" commands
 set textwidth=80 " max chars in one line
 " Bell settings
 set noerrorbells " no error bell
 set novisualbell " no visual bell
 set t_vb= " no terminal bell
 " Misc settings
 set history=100
 set helpheight=10 " height of help window
 set helplang=cn " use chinese help language if exists
 set wildignore=*.bak,*.o,*.e,*~ " ignore file intentions when grep
 set wildmenu " command line used
 set wildmode=list:longest,full " command line used


 if has("cscope")
     set csprg=/usr/bin/cscope              "指定用来执行 cscope 的命令
     set csto=1                             "先搜索tags标签文件，再搜索cscope数据库
     set cst                                "使用|:cstag|(:cs find g)，而不是缺省的:tag
     set nocsverb                           "不显示添加数据库是否成功
     " add any database in current directory
     if filereadable("cscope.out")
         cs add cscope.out
         "添加cscope数据库
     elseif filereadable("../cscope.out")
         cs add ../cscope.out
     elseif filereadable("../../cscope.out")
         cs add ../../cscope.out
     elseif filereadable("../../../cscope.out")
         cs add ../../../cscope.out
     endif
     set csverb
     "显示添加成功与否
 endif
    



 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 Bundle 'tpope/vim-rails.git'
 " vim-scripts repos
 Bundle 'L9'
 Bundle 'FuzzyFinder'
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 " ...

 Bundle 'Tagbar'
 Bundle 'The-NERD-tree'
 Bundle 'fugitive.vim'
 "Bundle 'Powerline'
 Bundle 'matchit.zip'
 Bundle 'ZenCoding.vim'
 Bundle 'autoload_cscope.vim'
 "Bundle 'SelectBuf'
 Bundle 'bufexplorer.zip'
 Bundle 'The-NERD-Commenter'
 Bundle 'DoxygenToolkit.vim'
 Bundle 'a.vim'
 Bundle 'neocomplcache'
 Bundle 'OmniCppComplete'
 Bundle 'javascript.vim'
 Bundle 'jsbeautify'
 Bundle 'xml.vim'
 Bundle 'python.vim'
 Bundle 'css.vim'
 Bundle 'JSON.vim'
 Bundle 'Markdown'
 
 filetype plugin indent on     " required!
 
 "nmap <F4> :TagbarToggle<CR>
 nmap <slient> <leader>l :TagbarToggle<cr>
  
 " NERD_tree.vim - File tree explorer {{{2
 " <F3> - open and close NERDTree window
 let g:NERDTreeWinPos = "left"
 let g:NERDTreeWinSize = 34
 let g:NERDTreeShowLineNumbers = 1
 let g:NERDTreeQuitOnOpen = 1
 "nmap <F3> :NERDTreeToggle<cr>
 nmap <slient> <leader>n :NERDTreeToggle<cr>

 "close auto_load mapping
 let g:autocscope_menus=0


 "Doxygentoolkit
 let g:DoxygenToolkit_authorName="Ark" 
 let g:DoxygenToolkit_licenseTag="MIT"

 let g:neocomplcache_enable_at_startup = 1

 " cscope - code browse {{{2
 nmap <silent> <leader>ss :exe 'cs find s ' . expand("<cword>")<cr>
 nmap <silent> <leader>sg :exe 'cs find g ' . expand("<cword>")<cr>
 nmap <silent> <leader>sc :exe 'cs find c ' . expand("<cword>")<cr>
 nmap <silent> <leader>st :exe 'cs find t ' . expand("<cword>")<cr>
 nmap <silent> <leader>se :exe 'cs find e ' . expand("<cword>")<cr>
 nmap <silent> <leader>sf :exe 'cs find f ' . expand("<cfile>")<cr>
 nmap <silent> <leader>si :exe 'cs find i ' . expand("<cfile>")<cr>
 nmap <silent> <leader>sd :exe 'cs find d ' . expand("<cword>")<cr>
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
