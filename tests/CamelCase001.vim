" Test completion of inner CamelCase fragments.

runtime plugin/CamelCaseComplete.vim
call vimtest#SkipAndQuitIf(! exists('g:loaded_CamelCaseComplete'), "Need installed CamelCaseComplete plugin")

source ../helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(24)
edit InnerFragmentComplete.txt

set completefunc=InnerFragmentComplete#InnerFragmentComplete

call IsMatchesInIsolatedLine('TCN', ['ThatCrazyName'], 'single CamelCase strict match for TCN')
call IsMatchesInIsolatedLine('Tcn', ['ThatCrazyName'], 'single CamelCase strict match for Tcn')
call IsMatchesInIsolatedLine('tcn', ['this_crazy_name'], 'single CamelCase strict match for tcn')
call IsMatchesInIsolatedLine('ucn', ['underscore_code_name'], 'single CamelCase strict match for ucn')
call IsMatchesInIsolatedLine('UCN', [], 'no matches for UCN')
call IsMatchesInIsolatedLine('CN', ['CODE_NAME', 'CODE_NEGATIVE', 'CRAZY_NAME', 'CodeName', 'CodeNegative', 'Code_Name', 'CrazyName', 'Crazy_Name'], 'CamelCase strict matches for CN')
call IsMatchesInIsolatedLine('Cn', ['CodeName', 'CodeNegative', 'CrazyName', 'Cop_non'], 'CamelCase strict matches for Cn')

call IsMatchesInIsolatedLine('pan', ['path_and_name'], 'single CamelCase strict match for pan')
call IsMatchesInIsolatedLine('PAN', ['PATH_AND_NAME', 'PathANDName', 'PathAndName'], 'CamelCase strict matches for PAN')
call IsMatchesInIsolatedLine('Pan', ['PathANDName', 'PathAndName'], 'CamelCase strict matches for Pan')

call IsMatchesInIsolatedLine('ni', ['nonIndent', 'non_indent'], 'CamelCase strict matches for ni')

call IsMatchesInIsolatedLine('3', ['31337', '31337PathANDNameWITHOUTExtension11', '31337PathAndNameWithoutExtension11', '31337_path_and_name_without_extension_11', '31337_PATH_AND_NAME_WITHOUT_EXTENSION_11'], 'both strict matches for 3')
call IsMatchesInIsolatedLine('31', ['31337', '31337PathANDNameWITHOUTExtension11', '31337PathAndNameWithoutExtension11', '31337_path_and_name_without_extension_11', '31337_PATH_AND_NAME_WITHOUT_EXTENSION_11'], 'both strict matches for 31')
call IsMatchesInIsolatedLine('32', [], 'no matches for 32')
call IsMatchesInIsolatedLine('3p', ['31337_path'], 'CamelCase strict matches for 3p')
call IsMatchesInIsolatedLine('3pa', ['31337_path_and'], 'CamelCase strict matches for 3pa')
call IsMatchesInIsolatedLine('3pan', ['31337_path_and_name'], 'CamelCase strict matches for 3pan')

call IsMatchesInIsolatedLine('S3', ['Script31337'], 'CamelCase strict match for S3')
call IsMatchesInIsolatedLine('S4', [], 'no matches for S4')
call IsMatchesInIsolatedLine('S3P', ['Script31337Path'], 'CamelCase strict match for S3P')

setlocal iskeyword+=:
call IsMatchesInIsolatedLine(':ICC', [':IndentConsistencyCop'], 'CamelCase strict match for :ICC')
call IsMatchesInIsolatedLine(':Fmicw', [':FindMatchesInCurrentWindow'], 'CamelCase strict match for :Fmicw')
call IsMatchesInIsolatedLine(':fd', [':fileDelete'], 'CamelCase strict match for :fd')
call IsMatchesInIsolatedLine('fd', ['fileData', 'fileDelete'], 'CamelCase strict matches for fd')

call vimtest#Quit()
