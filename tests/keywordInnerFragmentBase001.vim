" Test completion of full keyword with innerFragment base.

source ../helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(5)
edit InnerFragmentComplete.txt

set completefunc=InnerFragmentComplete#InnerFragmentComplete

call IsMatchesInIsolatedLine('Fin', [], 'no matches for Fin without prefix')
call IsMatchesInIsolatedLine('myFin', ['FindMatchesInCurrentWindow', 'FindMatchesInOtherWindows'], 'full matches for Fin with my prefix')
call IsMatchesInIsolatedLine('TestFin', ['FindMatchesInCurrentWindow', 'FindMatchesInOtherWindows'], 'full matches for Fin with Test prefix')

call IsMatchesInIsolatedLine('Camel', ['CamelCodeName'], 'inner match for Camel without prefix')
call IsMatchesInIsolatedLine('MyCamel', ['CamelCase', 'CamelCodeName', 'CamelCodeNegative'], 'full and inner matches for Camel with My prefix')

call vimtest#Quit()
