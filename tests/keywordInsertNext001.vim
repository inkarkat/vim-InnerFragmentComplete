" Test insertion of next inner keyword.

let g:CompleteHelper_IsDefaultToBackwardSearch = 0
source ../helpers/insert.vim
view InnerFragmentComplete.txt
new

call SetCompletion("\<C-x>i")

call Insert(' That', 0)
call Insert(' (That', 0)
call Insert(' myThat', 0)
call Insert(' my_That', 0)
call Insert(' alsoWithThat', 0)
normal! o
call Insert(' that', 0)
call Insert(' (that', 0)
call Insert(' mythat', 0)
call Insert(' my_that', 0)
call Insert(' alsoWiththat', 0)
normal! o
setlocal iskeyword+=:
call Insert(' :Fi', 1)
call Insert(' :fi', 1)
call Insert(' g:fi', 0)

call vimtest#SaveOut()
call vimtest#Quit()
