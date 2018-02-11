" Test completion of inner keywords and CamelCase fragments when both exist.

runtime plugin/CamelCaseComplete.vim
call vimtest#SkipAndQuitIf(! exists('g:loaded_CamelCaseComplete'), "Need installed CamelCaseComplete plugin")

source ../helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(5)

call setline(1, 'set MyScript31337PathAndNameWithoutExtension11=%~dpn0')
call setline(2, 'set WhyPancakeNames=%~dpn0')
call setline(3, 'set ThisContainedOrNoneTrackWord=%~dpn0')
call setline(4, 'set MY_FOO_ORDER_ORIGINAL_DOC=%~dpn0')

set completefunc=InnerFragmentComplete#InnerFragmentComplete

call IsMatchesInIsolatedLine('3', ['31337', '31337PathAndNameWithoutExtension11'], 'both strict matches for 3')
call IsMatchesInIsolatedLine('Pan', ['PancakeNames', 'PathAndName'], 'both strict matches for Pan')

call IsMatchesInIsolatedLine('Cont', ['ContainedOrNoneTrack', 'ContainedOrNoneTrackWord'], 'both strict matches for Cont')
call IsMatchesInIsolatedLine('COnt', ['ContainedOrNoneTrack'], 'selected strict CamelCase match for COnt')

call IsMatchesInIsolatedLine('FOO', ['FOO_ORDER_ORIGINAL', 'FOO_ORDER_ORIGINAL_DOC'], 'both strict matches for FOO')

call vimtest#Quit()
