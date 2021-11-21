" Test insertion of next inner CamelCase fragments.

runtime plugin/CamelCaseComplete.vim
call vimtest#SkipAndQuitIf(! exists('g:loaded_CamelCaseComplete'), "Need installed CamelCaseComplete plugin")

let g:CompleteHelper_IsDefaultToBackwardSearch = 0
runtime tests/helpers/insert.vim
view InnerFragmentComplete.txt
new

call SetCompletion("\<C-x>i")

call Insert(' TCN', 0)
call Insert(' (TCN', 0)
call Insert(' myTCN', 0)
call Insert(' my_TCN', 0)
call Insert(' alsoWithTCN', 0)
normal! o
call Insert(' tcn', 0)
call Insert(' (tcn', 0)
call Insert(' mytcn', 0)
call Insert(' my_tcn', 0)
call Insert(' alsoWithtcn', 0)
normal! o
call Insert(' textPan', 1)
call Insert(' BIN_PAN', 3)
normal! o
setlocal iskeyword+=:
call Insert(' :Fmicw', 0)
call Insert(' :fc', 0)
call Insert(' g:fc', 0)

call vimtest#SaveOut()
call vimtest#Quit()
