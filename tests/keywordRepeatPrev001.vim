" Test repeat of previous inner keyword completion.

let g:CompleteHelper_IsDefaultToBackwardSearch = 1
source ../helpers/insert.vim
view InnerFragmentComplete.txt
new

call SetCompletion("\<C-x>i")

call InsertRepeat('That', 0, 0, 0, 0, 0, 0)
call InsertRepeat('myThat', 0, 0, 0, 0, 0, 0)
call InsertRepeat('a_under', 3, 0, 0, 0, 0)
call InsertRepeat('prefixed', 0, 0)

call vimtest#SaveOut()
call vimtest#Quit()
