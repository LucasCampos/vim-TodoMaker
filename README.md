# vim-TodoMaker
A vim plugin create TODO lists from tags.

This plugin exports the `MakeTODO` command, which searches the file for a line containing `#TODO`. Everything after this tag is considered a new task. It overwrites the `.TODO` file with the tasks encountered and opens a new split windows.

The value of the tag can be changed with the `g:TODO_key` variable. For instance, if you want to use `new_task` as key, add this line to your `.vimrc` or `init.vim`.

```vim
let g:TODO_key = "new_task"
```

#Installing

It is recommended to use a package manager. For instance, if you use Vundle, just the following line to your `.vimrc` or `init.vim`.

```vim
Plugin 'LucasCampos/vim-TodoMaker'
```
