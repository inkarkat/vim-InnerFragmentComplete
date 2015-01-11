" Test repeat of inner CamelCase completion.

runtime plugin/CamelCaseComplete.vim
call vimtest#SkipAndQuitIf(! exists('g:loaded_CamelCaseComplete'), "Need installed CamelCaseComplete plugin")

source ../helpers/insert.vim
view InnerFragmentComplete.txt
new

call SetCompletion("\<C-x>i")

call InsertRepeat('TCN', 0, 0, 0, 0, 0, 0)
call InsertRepeat('myTCN', 0, 0, 0, 0, 0, 0)

call InsertRepeat('TC', 0, 0)
call InsertRepeat('TC', 0, 0, 0)

call InsertRepeat('my_uc', 0, 0)
call InsertRepeat('my_uc', 0, 0, 0)

call InsertRepeat('ptc', 0, 0)

call vimtest#SaveOut()
call vimtest#Quit()