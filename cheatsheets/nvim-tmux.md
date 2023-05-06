# Them keybinds

#### Got most of the binds from [him](https://youtube.com/playlist?list=PLm323Lc7iSW_wuxqmKx_xxNtJC_hJbQ7R) 
#### and his [config files](https://github.com/ThePrimeagen/init.lua)

## VIM / NVIM base modal motions & keybinds

- ### NORMAL:

    - Ctrl + a = Iterate the number under the cursor

	- Ctrl + d = Goes half a page down / forward | Baja media página
	
	- Ctrl + u = Goes half a page up | Sube media página
	 
	- Ctrl + f = Goes a full page down / forward | Baja una página entera
	
	- Ctrl + b = Goes a full page up / backward | Baja una página entera


	- x = The better way to delete characters
	
    - = = Indents the current line correctly

    - =ap = Indents the whole paragraph & surrounding whitespace

    - \> = Can be combined with a selection or motion to indent x number of lines
    
    - \< = Can be combined with a selection or motion to backwards-indent lines

	- b & w = Jump backwards and forwards to the next word / different format of text (no need for space)
	
	- W = Jump to the next space-separated text
	
	- e = Go to the ending of a word 
	
	- gg = Go to the first line
	
	- G = Go to the last line
	
	- \<number>gg / \<number>G = Go to line \<number>
	
	- p = Pastes either the last thing yanked or deleted


	- d$ = deletes from the cursor to the end of the line - 
	
	- 0 = deletes from the beginning of the line to the cursor
	
	- $ = Go to the end of the line
	
	- _ = Go to the start of the line
	
	- 0 = Go to the beginning character of the line


- #### MOTION COMBINATIONS
	- f\<char\> = Goes forward to the specified character in the line
		- Can be combined with x to eliminate certain characters
			 
	- t\<char\> = Jumps to right before the specified character in the line (e.g. > )
		- Used with t\<char\> or f\<char\>
			- , = Go to the previous instance (but right before it)
			- ; = Go to the next instance (but right before it)
			
	- F\<char\> = Goes backwards to the specified character in the line (e.g. <) 
		
	- T\<char\> = Jumps to right after the previous specified character in the line (e.g. = ) 
		- T\<char\> is a mirror of t\<char\>, same with f \& F
		- Used with T\<char\> or F\<char\>

- ##### Both t / T \& f / F can be used with d, c, y, v (visual mode) \& p

	- df\<char\> deletes From the cursor to the next specified character in the line 
	- dF\<char\> deletes From the cursor to the previous specified character in the line
	- dt\<char\> deletes from the cursor To right before the next specified character in the line
	- dT\<char\> deletes from the cursor To right after the previous specified character in the line 
	
	- vf\<char\> selects From the cursor to the next specified character in the line 
	- vF\<char\> selects From the cursor to the previous specified character in the line
	- vt\<char\> selects from the cursor To right before the next specified character in the line
	- vT\<char\> selects from the cursor To right after the previous specified character in the line 
	
	
	- yf\<char\> yanks From the cursor to the next specified character in the line 
	- yF\<char\> yanks From the cursor to the previous specified character in the line
	- yt\<char\> yanks from the cursor To right before the next specified character in the line
	- yT\<char\> yanks from the cursor To right after the previous specified character in the line 
	
	
	- cf\<char\> changes From the cursor to the next specified character in the line 
	- cF\<char\> changes From the cursor to the previous specified character in the line
	- ct\<char\> changes from the cursor To right before the next specified character in the line
	- cT\<char\> changes from the cursor To right after the previous specified character in the line 
	
	
	- pf\<char\> pastes From the cursor to the next specified character in the line 
	- pF\<char\> pastes From the cursor to the previous specified character in the line
	- pt\<char\> pastes from the cursor To right before the next specified character in the line
	- pT\<char\> pastes from the cursor To right after the previous specified character in the line


### INSERT:

- i = Enter insert mode right on the cursor
	- I = Enter insert mode, but position the cursor at the beginning of the line
- a = Enter insert mode, but right after the cursor
	- A = Enter insert mode, but right over the end of the line
- o = Enter insert mode, but in a new line below the one we're in
	- O = Enter insert mode, but in a new line above the one we're in
 

### VISUAL:

- % = Used like, for example, Vf(%, it selects from the { to its matching }
    - It allows you to jump between sets of characters ( {}, (), ' ', etc. )

- V = Selects current line (can overwrite it by pasting it)
- VD = Visually delete a whole line, technically faster than double tapping "d"
- VY = Faster way to do the same as 'yy'

- vi<delimiter> = Selects everything in between the delimiters ( {}, [], (), etc)
- va<delimiter> = Selects everything (like vi) in and around (including the delimiters)
- ya<delimiter> = Yanks with the same selection as va would do
- viw = Selects in visual mode the whole word, doesn't care about positioning
- viW = Same as viw but selects all text until there are whitespaces
- o = Transfers your cursor to the top or bottom of the current visual selection 
- vap & dap = They select / delete paragraphs AND the contiguous whitespace
- vip & dip = They select / delete only the insides of the paragraphs



## NVIM: Custom keybinds with space as leader & modal keybinds for easy motions

##### All related configs on [here](https://github.com/mrs4ndman/setup)

- #### (assuming Space is leader in neovim)
	
	- Leader + Leader = Source current file
	- Leader + b = Base binding for--
	    - Leader + b + n = Next buffer
	    - Leader + b + p = Previous buffer
	    - Leader + b + c = Buffer close / delete from list
	
	- Leader + e = Ex (Nvim Integrated Explorer)
	- Leader + s = Substitutor for current word
	- Leader + x = Make the current file executable (chmod +x)

 
## Modal custom keybinds (not global)

- ### NORMAL:
	
	- J = append line below to current one
	- Q = Manually unbound in config (do not need it)
	
	- Ctrl + q = :q! \<CR>
	- Ctrl + w = :w \<CR>

 
- ### INSERT:
	
	- Ctrl + c = Escape (i know, right?)

- ### VISUAL:
	
	- J \& K: Move selection completely up or down inside the buffer


- ### Cokeline plugin [ .config/nvim/after/plugin/cokeline.lua ]
	
	- Leader + c + n = Focus on next buffer in the cokeline
	 
	- Leader + c + p = Focus on previous buffer in the cokeline
	 
	- Leader + c + s + n = Switch current buffer with the next buffer in the cokeline
	 
	- Leader + c + s + p = Switch current buffer with the previous buffer in the cokeline
	 
	- Leader + c + c = Pick (based on a letter index) which of the session buffers to close
	 
	- Leader + c + \<Number> = Focus / change to the buffer with the buffer numbered \<Number>
	 
	- Leader + c + s + \<Number> = Switch the current buffer with the buffer numbered \<Number>


- ### Fugitive plugin [ .config/nvim/after/plugin/fugitive.lua ]
	
	- Leader + g + s = Fugitive git status
	- Leader + g + d = Fugitive git diff


- ### Harpoon plugin [ .config/nvim/after/plugin/harpoon.lua ]
	
    - Leader + h = harpoon main screen / plugin
    - Leader + a = harpoon mark keybinding

	- Leader + 1 = harpoon file 1
	- Leader + 2 = harpoon file 2
	- Leader + 3 = harpoon file 3
	- Leader + 4 = harpoon file 4
	- Leader + 5 = harpoon file 5
	- Leader + 6 = harpoon file 6
	- Leader + 7 = harpoon file 7
	- Leader + 8 = harpoon file 8
	- Leader + 9 = harpoon file 9
	- Leader + 10 = harpoon file 10
	
	- Leader + t + 1 = harpoon terminal 1
	- Leader + t + 2 = harpoon terminal 2
	- Leader + t + 3 = harpoon terminal 3
	- Leader + t + 4 = Harpoon terminal 4


- ### LSP keybinds
	
    - gd = Go to definition
    - K = Hover
    - [d / ]d = Go to next and previous diagnostic hunks
    - Ctrl + o = Bring up signature help
	- Ctrl + p = Previous LSP suggestion / item
	- Ctrl + n = Next LSP suggestion / item
	- Ctrl + y = Confirm selected suggestion / item
	- Ctrl + Space = Complete suggestion ??
    - Leader + vca = Choose and execute available code actions
    - Leader + vd = Open diagnostics in a floating window
    - Leader + vrn = Rename references to the symbol under the cursor 
    - Leader + vrr = View references
    - Leader + vws = View LSP workspace symbol


- ### Packer plugin manager
	  
	- Leader + p + s = Packer Sync

 
- ### Ranger / rnvimr plugin
	
	- Leader + r = Ranger with rnvimr plugin inside Neovim


- ### Surround plugin

    - c + s + current surrounding + new surrounding = Change current for new surrounding signs / marks
    - c + s + t = go back to previuos pair
    - d + s + current surrounding = Delete current surrounding delimiters / signs / marks
    - y + s + iw motion + surrounding = Add another surrounding inside the current one
    - y + s + s + b or ) = Wrap the entire line in parentheses
    - V + S + 'XML tag / surrounding' = this can surround the entire current line in the surroundig / XML tag

    - Only the opening brackets used with surround pad the surrounded text with a space
    - To surround without padding, use the closing brackets

[Hello] world!


- ### Overlength plugin

    - Leader + ol = Toggle overlength highlighting on / off

- ### Telescope plugin & extensions
	
    - Leader + t + t = Telescope plugin main screen
	- Leader + t + g = Live grep the file, telescope plugin
	- Leader + t + h = History of recently opened files, works with hidden folder files
	- Leader + t + r = Repo list, repo telescope plugin
    - Inside of fuzzy finding window (works both in normal and insert modes) :
        - Ctrl + n = Next selection
        - Ctrl + p = Previous selection
        - Ctrl + c = Close window and return to working buffer
        - Ctrl + q = Send to quick-fix list
        - Ctrl + i = Select more in horizontal (??)
        - Ctrl + x = Select more in vertical (??)



- ### Trouble plugin
	
	- Leader + x + q = Trouble toggle quick-fix
	- Leader + x + w = Trouble workspace diagnostics 
	- Leader + x + x = Trouble full toggle
	- Leader + x + d = Trouble document diagnostics
	- Leader + x + l = Trouble location list

 
- ### Undotree plugin
	
	- Leader + u = Toggle Undo tree (pops window on the side)


- ### Zenmode plugin
	
	- Leader + zz = Zen mode
	- Leader + zZ = Zen mode without numbers and wrap


- ### Unbound
	
	- Leader + I = Nothing
	- Leader + O = Nothing
	- Leader + D = Nothing
	- Leader + F = Nothing
    - Leader + P = Nothing
	- Leader + J = Nothing
	- Leader + K = Nothing
	- Leader + L = Nothing
	- Leader + Ñ (or whatever is here in english) = Nothing
	- Leader + Z = Nothing
	- Leader + X = Nothing
	- Leader + V = Nothing
	- Leader + N = Nothing 
	- Leader + M = Nothing



- ### TMUX: Default keybinds
	
	- (assuming Ctrl + s as prefix / leader for Tmux)
	
	- #### Leader + ? = List all key bindings
	 
	- ### Most used:
	
	- ##### Layouts:
		- Leader + ( Alt + 1 ) = Even-horizontal layout
		- Leader + ( Alt + 2 ) = Even-vertical layout
		- Leader + ( Alt + 3 ) = Main horizontal layout
		- Leader + ( Alt + 4 ) = Main vertical layout
		- Leader + ( Alt + 5 ) = Tiled layout
	
	- Leader + ( Ctrl + Up / Down / Left / Right ) = Resize the current pane in 1-cell steps
	- Leader + ( Alt + Up / Down / Left / Right ) = Resize the current pane in 5-cell steps
	
	
	- ##### Panes:
		- Leader + [Ctrl + o] = Rotates the panes in the current window forwards 
		- Leader + q = Identify panes with numbers & show their indexes
		- Leader + % = Horizontally splits the current pane into left and right panes
		- Leader + " = Vertically splits the current pane into top and bottom panes
		- Leader + x = Kills the current pane
		- Leader + o = Select the next pane in the current window
		- Leader + ; = Move to the previously active pane
		- Leader + { / } = Swaps the current pane with the previous / next one
		- Leader + m / M = Mark current pane / Clear the marked pane


	- ##### Windows:
		- Leader + c = Create a new window
		- Leader + p = Previous window
		- Leader + n = Next window
		- Leader + [ 0 - 9 ] = Select windows 0 to 9
		- Leader + w = Opens window / pane selector dropdown menu
		- Leader + ! = Breaks into another window the current pane
		- Leader + & = Kill the current window
		- Leader + i = Current window info
		- Leader + f = Text search in open windows


	- ##### Config & features
		- Leader + [Ctrl + s] = Sends prefix to the application
		- Leader + t = CLI-rendered clock
		- Leader + z = Toggles zoom / focus mode
		- Leader + r = Reload tmux.conf
		- Leader + : = Enter the tmux command prompt
		- Leader + [Ctrl + z] = Suspends the tmux client


	- ##### Sessions & clients
		- Leader + $ = Rename the current session
		- Leader + d / D = Detach the current client / Choose a client to detach
		- Leader + s = Select a new session for the attached client interactively
		- Leader + ( / ) = Switch the attached client to the previous or next session


	- ##### Paste buffers
		- Leader + # = List all paste buffers
		- Leader + "=" = Choose which buffer to paste interactively from a list 
		- Leader + - = Delete the most recent copied buffer of text
