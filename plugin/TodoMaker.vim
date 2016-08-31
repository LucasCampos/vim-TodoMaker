" TODOMaker - Make TODO lists from tags
" Copyright © 2016 LQCC <rmk236@gmail.com>
" Version 0.0.1
" Distributed under terms of the MIT license.

if !has('python')
	finish
endif
 
if !exists("g:TODO_key")
    let g:TODO_key = "#TODO"
    let g:TODO_PATH = system("pwd")
endif

function! MakeTODO()
python << EOF
try:
    import vim

    def SetTODOFile(tasks):
        filename = ".TODO"
        vim.command(":split " + filename)
        vim.command(":bw" + filename)
        vim.command(":split " + filename)

        vim.current.buffer[:] = None
        vim.current.buffer.append("TODO List")
        vim.current.buffer.append(tasks)
        del vim.current.buffer[0]
        
        vim.command(":w")
        vim.current.window.height=5

    def GetTasks(key, buffer):

        tasks = []
        for lineNumber, line in enumerate(buffer):
            idx = line.find(key)
            if (idx >= 0):
                task = "--" + line[idx+len(key):]
                task += " (at " + buffer.name + ":"
                task += str(lineNumber) + ")"
                tasks.append(task)

        return tasks

    key = vim.eval("g:TODO_key")

    tasks = GetTasks(key, vim.current.buffer)
    SetTODOFile(tasks)


except ImportError, e:
    print "Markdown package not installed, please run: pip install markdown"
EOF
endfunc
 
command! MakeTODO call MakeTODO()
