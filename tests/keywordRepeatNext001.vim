" Test repeat of next inner keyword completion.

let g:CompleteHelper_IsDefaultToBackwardSearch = 0
runtime tests/helpers/insert.vim
view InnerFragmentComplete.txt
new

call SetCompletion("\<C-x>i")
call SetCompleteExpr('InnerFragmentComplete#Expr')

call InsertRepeat('That', 0, 0, 0, 0, 0, 0)
call InsertRepeat('myThat', 0, 0, 0, 0, 0, 0)
call InsertRepeat('a_under', 6, 0, 0, 0, 0)
call InsertRepeat('prefixed', 0, 0)

call vimtest#SaveOut()
call vimtest#Quit()
