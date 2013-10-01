" Test completion of inner keyword.

source ../helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(10)
edit InnerFragmentComplete.txt

set completefunc=InnerFragmentComplete#InnerFragmentComplete

call IsMatchesInIsolatedLine('That', ['ThatCrazyName'], 'single keyword strict match for That')
call IsMatchesInIsolatedLine('that', ['thatCrazyName'], 'single keyword strict match for that')
call IsMatchesInIsolatedLine('camel', ['camelCodeName'], 'single keyword strict match for camel')
call IsMatchesInIsolatedLine('Under', ['Underscore_code_name', 'Underscore_Code_Name', 'Underscore_CODE_NAME'], 'keyword strict matches for under')
call IsMatchesInIsolatedLine('Another', ['AnotherCodeName', 'Another_code_name'], 'inner keyword strict matches for Another')
call IsMatchesInIsolatedLine('another', ['anotherCodeName', 'another_code_name'], 'inner keyword strict matches for another')

call IsMatchesInIsolatedLine('nd', [], 'no keyword match for nd')
call IsMatchesInIsolatedLine('name', ['nameWITHOUTExtension11', 'nameWithoutExtension11', 'name_without_extension_11'], 'keyword strict matches for name')

call IsMatchesInIsolatedLine('In', ['InCurrentWindow', 'InOtherWindows', 'IndentPattern', 'Indent_pattern'], 'keyword strict matches for In')
setlocal iskeyword+=:
call IsMatchesInIsolatedLine(':In', [':IndentConsistencyCop_highlighting', ':IndentConsistencyCop_nonIndentPattern', ':IndentConsistencyCop_non_indent_pattern'], 'keyword strict matches for :In')

call vimtest#Quit()
