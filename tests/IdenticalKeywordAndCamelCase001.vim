" Test completion of inner keywords and CamelCase fragments when both exist.

source ../helpers/completetest.vim
call vimtest#StartTap()
call vimtap#Plan(4)

call setline(1, 'set MyScript31337PathAndNameWithoutExtension11=%~dpn0')
call setline(2, 'set WhyPancakeNames=%~dpn0')
call setline(3, 'set ThisContainedOrNoneTrackWord=%~dpn0')
call setline(4, 'set MY_FOO_ORDER_ORIGINAL_DOC=%~dpn0')

set completefunc=InnerFragmentComplete#InnerFragmentComplete

call IsMatchesInIsolatedLine('3', ['31337'], 'CamelCase strict matches for 3')
call IsMatchesInIsolatedLine('Pan', ['PancakeNames', 'PathAndName'], 'both strict matches for Pan')

" Expected, but does not work, because the larger (keyword) match wins over the
" shorter (CamelCase) match at the same position:
"call IsMatchesInIsolatedLine('Cont', ['ContainedOrNoneTrack', 'ContainedOrNoneTrackWord'], 'both strict matches for Cont')
call IsMatchesInIsolatedLine('Cont', ['ContainedOrNoneTrackWord'], 'larger strict keyword match wins for Cont')
" Feasible workaround: Capitalize another fragment anchor.
call IsMatchesInIsolatedLine('COnt', ['ContainedOrNoneTrack'], 'selected strict CamelCase match for COnt')

"call IsMatchesInIsolatedLine('FOO', ['FOO_ORDER_ORIGINAL', 'FOO_ORDER_ORIGINAL_DOC'], 'both strict matches for FOO')
call IsMatchesInIsolatedLine('FOO', ['FOO_ORDER_ORIGINAL_DOC'], 'larger strict keyword match for FOO')

call vimtest#Quit()
