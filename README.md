INNER FRAGMENT COMPLETE
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

The built-in insert mode completion i\_CTRL-N searches for entire keywords.
Often, variable names share many identical fragments, but if you want to
complete from fragments inside of variables (e.g. "KeyValue" from
"SpecialKeyValue"), it won't work, because the usual completions only offer
whole keyword matches.

### SEE ALSO

- The anchoring to individual fragment characters is re-used from
  CamelCaseComplete ([vimscript #3915](http://www.vim.org/scripts/script.php?script_id=3915)), but applied here only to fragments
  inside CamelCaseWords or underscore\_words, not whole words.
- BidiComplete ([vimscript #4658](http://www.vim.org/scripts/script.php?script_id=4658)) can complete inner (or leftmost) fragments
  when there's already a completion base after the cursor.
- Check out the CompleteHelper.vim plugin page ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)) for a full
  list of insert mode completions powered by it.

USAGE
------------------------------------------------------------------------------

    In insert mode, invoke the inner fragment completion via CTRL-X i
    You can then search forward and backward via CTRL-N / CTRL-P, as usual.

    CTRL-X i                Find matches for inner fragments. It first searches
                            inside CamelCaseWords and underscore_words, either for
                            matches of the keyword characters before the cursor at
                            the inner fragment start, or for fragments whose
                            individual words begin with the typed letters in front
                            of the cursor. (The latter requires the optional
                            CamelCaseComplete.vim plugin, and then works like
                            with the strict i_CTRL-X_CTRL-C completion.)
                            The completion base starts with the first uppercase
                            character before the cursor (so "myCust" would find
                            fragments starting with "Cust", e.g. in
                            "SpecialCustomer"), or the keywords (excluding the
                            underscore character, to be able to trigger completion
                            inside an underscore_word) before the cursor. If the
                            first keyword character is lowercase, the inner
                            CamelCase matches will be converted to start
                            lowercase, too.
                            If there is a fragment before the completion base
                            (e.g. "My" in "MyCust", or "end_" in "end_foo") the
                            completion not only offers matching inner fragments,
                            but also the complete word match, in order to complete
                            prefixed new words with existing full words.
                            For CamelCaseWord fragments, matches at the start of a
                            CamelCaseWord are also valid, as long as it's not the
                            entire CamelCaseWord that is matched (e.g. "CC"
                            matches "CamelCase" in "CamelCaseWord").

                            If that doesn't find any matches, a fallback search
                            will pick up base matches anywhere inside a word (e.g.
                            "comp" will match "compress" inside "decompress").

### EXAMPLE

The text contains "CamelCaseWords". To write "PascalCaseWords", start either
with "PascalCaseW" (unique text match), "PascalC" (several text matches), or
"PascalCW" (unique fragment match).

The text contains "ConfigurationItem". To write "SystemConfigurationItem",
start with "SystemCo" (full text match) or "SystemCI" (full fragment match).

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-InnerFragmentComplete
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim InnerFragmentComplete*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the ingo-library.vim plugin ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)), version 1.010 or
  higher.
- Requires the CompleteHelper.vim ([vimscript #3914](http://www.vim.org/scripts/script.php?script_id=3914)) plugin, version 1.32 or
  higher.
- CamelCaseComplete.vim ([vimscript #3915](http://www.vim.org/scripts/script.php?script_id=3915)) plugin, version 1.01 or higher
  (optional).

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

By default, the 'complete' option controls which buffers will be scanned for
completion candidates. You can override that either for the entire plugin, or
only for particular buffers; see CompleteHelper\_complete for supported
values.

    let g:InnerFragmentComplete_complete = '.,w,b,u'

If you want to use a different mapping, map your keys to the
&lt;Plug&gt;(InnerFragmentComplete) mapping target _before_ sourcing the script
(e.g. in your vimrc):

    imap <C-x>i  <Plug>(InnerFragmentComplete)

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-InnerFragmentComplete/issues or email (address
below).

HISTORY
------------------------------------------------------------------------------

##### 1.11    RELEASEME
- Remove default g:InnerFragmentComplete\_complete configuration and default to
  'complete' option value instead.

##### 1.10    04-Apr-2014
- ENH: When the completion base is prefixed by a fragment (e.g. "my" in
  "myFoo"), also offer full keyword / CamelCaseWord matches, not just inner
  fragments, as the default completion / CamelCaseComplete would not use that
  base, yet it is helpful when completing "myFooBar" from "FooBar".
- ENH: Also match from the start of a CamelCaseWord without a base prefix. But
  then, there must be additional (unmatched) fragments after the match to
  avoid overlap with the CamelCaseComplete completion.

##### 1.00    19-Dec-2013
- First published version.

##### 0.01    01-Oct-2013
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2013-2022 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
