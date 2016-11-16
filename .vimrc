" OpenSSL encrypted files.
" PBKDF v1.5 (salted) aes-256-cbc encrypted file.  (File magic "Salted__")
augroup enc
autocmd!
autocmd  BufReadPre,FileReadPre     *.enc set binary
autocmd  BufReadPre,FileReadPre     *.enc set history=0 cmdheight=3 viminfo=
autocmd  BufReadPre,FileReadPre     *.enc set noswapfile nowritebackup
"
autocmd  BufReadPost,FileReadPost   *.enc set shell=/bin/sh shellredir=>
autocmd  BufReadPost,FileReadPost   *.enc '[,']!openssl aes-256-cbc -d -salt
autocmd  BufReadPost,FileReadPost   *.enc set nobinary cmdheight& shell&
autocmd  BufReadPost,FileReadPost   *.enc let b:encflag=1
autocmd  BufReadPost,FileReadPost   *.enc exe "doau BufReadPost ".expand("%:r")
autocmd  BufReadPost,FileReadPost   *.enc redraw!
"
autocmd  BufWritePre,FileWritePre   *.enc mark z
autocmd  BufWritePre,FileWritePre   *.enc set binary cmdheight=3 shell=/bin/sh
autocmd  BufWritePre,FileWritePre   *.enc '[,']!openssl aes-256-cbc -salt
"
autocmd  BufWritePost,FileWritePost *.enc undo
autocmd  BufWritePost,FileWritePost *.enc set nobinary cmdheight& shell&
autocmd  BufWritePost,FileWritePost *.enc 'z
augroup END
