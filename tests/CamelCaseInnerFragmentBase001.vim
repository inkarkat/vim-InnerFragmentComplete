" Test completion of full keyword with innerFragment base.

runtime plugin/CamelCaseComplete.vim
call vimtest#SkipAndQuitIf(! exists('g:loaded_CamelCaseComplete'), "Need installed CamelCaseComplete plugin")

source ../helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(11)
edit InnerFragmentComplete.txt

set completefunc=InnerFragmentComplete#InnerFragmentComplete

call IsMatchesInIsolatedLine('ICCh', [], 'no matches for ICCh without prefix')
call IsMatchesInIsolatedLine('ICC', ['IndentConsistencyCop'], 'partial from start match for ICC without prefix')
call IsMatchesInIsolatedLine('myICC', ['IndentConsistencyCop'], 'full match for ICC with my prefix')
call IsMatchesInIsolatedLine('TestICC', ['IndentConsistencyCop'], 'full match for ICC with Test prefix')

call IsMatchesInIsolatedLine('Fmicw', [], 'no matches for Fmicw without prefix')
call IsMatchesInIsolatedLine('Fmi', ['FindMatchesIn'], 'partial from start match for Fmi without prefix')
call IsMatchesInIsolatedLine('myFmi', ['FindMatchesIn'], 'full match for Fmi with my prefix')

call IsMatchesInIsolatedLine('CCN', ['CamelCodeName'], 'inner match for CCN without prefix')
call IsMatchesInIsolatedLine('MyCCN', ['CamelCodeName', 'CamelCodeNegative'], 'full and inner matches for CCN with My prefix')

call IsMatchesInIsolatedLine('ucn', ['underscore_code_name'], 'inner match for ucn without prefix')
call IsMatchesInIsolatedLine('my_ucn', ['underscore_code_name', 'underscore_code_negative'], 'full and inner matches for ucn with my_ prefix')

call vimtest#Quit()
