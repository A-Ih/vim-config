" For reference check:
" :h ale-cpp-options
" :h ale-cpp-clangformat
" :h ale-cpp-clangtidy
" :h ale-cpp-cpplint
" TODO: :h ale-completion
let s:llclang="/home/ahmad/programs/clang+llvm-13.0.0-x86_64-linux-gnu-ubuntu-16.04"
let s:clangd=s:llclang . "/bin/clangd"
let s:clangtidy=s:llclang . "/bin/clang-tidy"
let s:clangformat=s:llclang . "/bin/clang-format"

let b:ale_cpp_clangd_linters_ignore=['cc', 'ccls', 'clangcheck', 'clazy', 'cppcheck', 'cpplint', 'cquery', 'cspell', 'flawfinder']

"""""""""""""""""
"  Executables  "
"""""""""""""""""

let g:ale_cpp_clangd_executable=s:clangd

let g:ale_cpp_clangtidy_executable=s:clangtidy

let g:ale_c_clangformat_executable=s:clangformat

"""""""""""""
"  Options  "
"""""""""""""

let b:ale_cpp_clangd_options='--background-index -j=2 --header-insertion=never --completion-style=detailed'

" might come in handy
let s:build_dirs = ['cmake-build-debug', 'cmake-build-release', 'build']

let b:ale_fixers = ['clang-format', 'remove_trailing_lines', 'trim_whitespace'] " There might be misspelled words, have to check
let b:ale_linters = ['clangd', 'clangtidy']
" if there's no local file, we will use google's
" this is basically fallback style if there's no .clang-format: see
" ale-cpp-options
let g:ale_c_clangformat_style_option = '{BasedOnStyle: Google}'
" for checks go to: https://clang.llvm.org/extra/clang-tidy/

" let g:ale_sign_highlight_linenrs = 1

set omnifunc=ale#completion#OmniFunc

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


""""""""""""""""
"  Appearence  "
""""""""""""""""

" set colorcolumn=81
" highlight ColorColumn ctermbg=lightgrey
