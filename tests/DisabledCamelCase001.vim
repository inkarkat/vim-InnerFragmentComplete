" Test completion of with disabled CamelCaseComplete plugin.

unlet! g:loaded_CamelCaseComplete

runtime tests/helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(6)
edit InnerFragmentComplete.txt

set completefunc=InnerFragmentComplete#InnerFragmentComplete

call IsMatchesInIsolatedLine('TCN', [], 'no keyword match for TCN')
call IsMatchesInIsolatedLine('Tcn', [], 'no keyword match for Tcn')
call IsMatchesInIsolatedLine('tcn', [], 'no keyword match for tcn')
call IsMatchesInIsolatedLine('ucn', [], 'no keyword match for ucn')

call IsMatchesInIsolatedLine('3', ['31337PathANDNameWITHOUTExtension11', '31337PathAndNameWithoutExtension11', '31337_path_and_name_without_extension_11', '31337_PATH_AND_NAME_WITHOUT_EXTENSION_11'], 'keyword strict matches for 3')
call IsMatchesInIsolatedLine('31', ['31337PathANDNameWITHOUTExtension11', '31337PathAndNameWithoutExtension11', '31337_path_and_name_without_extension_11', '31337_PATH_AND_NAME_WITHOUT_EXTENSION_11'], 'keyword strict matches for 31')

call vimtest#Quit()
