" Test completion of full keyword with innerFragment base.

source ../helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(7)
edit InnerFragmentComplete.txt

set completefunc=InnerFragmentComplete#InnerFragmentComplete

call IsMatchesInIsolatedLine('Fin', [], 'no matches for Fin without prefix')
call IsMatchesInIsolatedLine('myFin', ['FindMatchesInCurrentWindow', 'FindMatchesInOtherWindows'], 'full matches for Fin with my prefix')
call IsMatchesInIsolatedLine('TestFin', ['FindMatchesInCurrentWindow', 'FindMatchesInOtherWindows'], 'full matches for Fin with Test prefix')

call IsMatchesInIsolatedLine('Camel', ['CamelCodeName'], 'inner match for Camel without prefix')
call IsMatchesInIsolatedLine('MyCamel', ['CamelCase', 'CamelCodeName', 'CamelCodeNegative'], 'full and inner matches for Camel with My prefix')

call IsMatchesInIsolatedLine('underscore', ['underscore_CODE_NAME', 'underscore_Code_Name', 'underscore_code_name'], 'inner matches for underscore without prefix')
call IsMatchesInIsolatedLine('my_underscore', ['underscore_CODE_NAME', 'underscore_Code_Name', 'underscore_code_name', 'underscore_CODE_NEGATIVE', 'underscore_code_negative', 'underscore_notation'], 'full and inner matches for underscore with my_ prefix')

call vimtest#Quit()
