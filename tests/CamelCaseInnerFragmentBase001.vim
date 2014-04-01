" Test completion of full keyword with innerFragment base.

runtime plugin/CamelCaseComplete.vim
call vimtest#SkipAndQuitIf(! exists('g:loaded_CamelCaseComplete'), "Need installed CamelCaseComplete plugin")

source ../helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(7)
edit InnerFragmentComplete.txt

set completefunc=InnerFragmentComplete#InnerFragmentComplete

call IsMatchesInIsolatedLine('ICC', [], 'no matches for ICC without prefix')
call IsMatchesInIsolatedLine('myICC', ['IndentConsistencyCop'], 'full match for ICC with my prefix')
call IsMatchesInIsolatedLine('TestICC', ['IndentConsistencyCop'], 'full match for ICC with Test prefix')

call IsMatchesInIsolatedLine('Fmi', [], 'no matches for Fmi without prefix')
call IsMatchesInIsolatedLine('myFmi', ['FindMatchesIn'], 'full match for Fmi with my prefix')

call IsMatchesInIsolatedLine('CCN', ['CamelCodeName'], 'inner match for CCN without prefix')
call IsMatchesInIsolatedLine('MyCCN', ['CamelCodeName', 'CamelCodeNegative'], 'full and inner matches for CCN with My prefix')

call vimtest#Quit()
