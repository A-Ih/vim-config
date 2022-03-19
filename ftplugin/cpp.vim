""""""""""""""
"  Mappings  "
""""""""""""""

"compile current source under g++ and launch it on all .in files
nnoremap <buffer><F7> :!python3 ~/scripts/test.py %<CR>
" TODO: don't make the python compile the code. I might just need to launch
" tests separately

set path+=/usr/include/c++/11

"""""""""""""""
"  Vim-CMake  "
"""""""""""""""
"c++ make build of cmake project
" :h cmake-plug-mappings
nmap ,cg <Plug>(CMakeGenerate)
nmap ,cb <Plug>(CMakeBuild)
nmap ,cc <Plug>(CMakeClean)
nmap ,cs <Plug>(CMakeSwitch)
nmap ,cq <Plug>(CMakeClose)

" :h cmake-configuration
let g:cmake_default_config = 'cmake-build-debug'
let g:cmake_build_dir_location = '.'
" LOOK AT ME: you may change whatever you want (depending on your project needs)
let g:cmake_generate_options = ['-G Ninja', '-DCMAKE_EXPORT_COMPILE_COMMANDS=ON', '-DCMAKE_CXX_COMPILER=g++-11']
let g:cmake_link_compile_commands = 1
let g:cmake_root_markers = ['.git', '.svn', '.clang-format', '.clang-tidy', '.ccls', '.root']

autocmd! User CMakeBuildSucceeded CMakeClose
