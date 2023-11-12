## Keybind table :)

- These keybinds are defined in the `.tmux.conf` file inside the tmux directory + the file `lua/core/keymaps.lua` in [this repo](https://github.com/mrs4ndman/nvim-conf)


| Program                    | Keybind / group                                                    | Function                                      |
|--------------------------- |------------------------------------------------------------------- |---------------------------------------------- |
| <center>tmux</center>      | <center><kbd>Ctrl</kbd> + <kbd>a</kbd></center>                    | tmux **prefix** leader                        |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>r</kbd></center>                  | Reload .tmux.conf settings file               |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>p</kbd></center>                  | Pop current tmux pane into its own window     |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>Ctrl + h</kbd></center>           | Resize current pane to the left               |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>Ctrl + j</kbd></center>           | Resize current pane downwards                 |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>Ctrl + k</kbd></center>           | Resize current pane upwards                   |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>Ctrl + l</kbd></center>           | Resize current pane to the right              |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>t</kbd></center>                  | Create another tmux window                    |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>Shift + t</kbd></center>          | Spawn simple tmux popup terminal              |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>Shift + v</kbd></center>          | Enter copy mode                               |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>Shift + n</kbd></center>          | Start up tmux-navigator on another window     |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>f</kbd></center>                  | Start up tmux-sessionizer on another window   |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>i</kbd></center>                  | Start up tmux-chtsh on another window         |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>g</kbd></center>                  | Start up lazygit on another window            |
| <center>tmux</center>      | <center><kbd>Prefix</kbd> + <kbd>x</kbd></center>                  | Kill current tmux pane                        |
| <center>tmux</center>      | <center><kbd>Alt</kbd></center>                                    | Main key for tmux keybinds                    |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>d</kbd></center>                     | Detach from current tmux session              |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>e</kbd></center>                     | Spawn a new tmux window with Neovim in it     |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>f</kbd></center>                     | Fire up tmux-navigator                        |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>f</kbd></center>                     | Fire up tmux-sessionizer                      |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>g</kbd></center>                     | Floating lazygit window                       |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>h</kbd></center>                     | Move to the Neovim / tmux window to the left  |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>j</kbd></center>                     | Move to the Neovim / tmux window below        |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>k</kbd></center>                     | Move to the Neovim / tmux window above        |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>l</kbd></center>                     | Move to the Neovim / tmux window to the right |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>n</kbd></center>                     | Swap current tmux window with the next one    |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>p</kbd></center>                     | Swap current tmux window with the previous    |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>q</kbd></center>                     | Display the native tmux session list          |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>r</kbd></center>                     | Reload the `.tmux.conf` file                  |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>s</kbd></center>                     | Split window horizontally into panes → 1_2    |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>t</kbd></center>                     | Spawn or attach to scratch terminal session   |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>v</kbd></center>                     | Split window vertically into panes → 1\|2     |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>w</kbd></center>                     | Fire up tmux-navigator                        |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>x</kbd></center>                     | Kill current tmux pane                        |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>h</kbd></center>  | Switch to previous tmux session               |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>j</kbd></center>  | Switch to previous tmux window                |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>k</kbd></center>  | Switch to next tmux window                    |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>l</kbd></center>  | Switch to next session                        |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>s</kbd></center>  | Attach to or create scratch MD file session   |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>t</kbd></center>  | Spawn bottom REPL terminal                    |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>x</kbd></center>  | Kill current tmux window                      |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>p</kbd></center>  | Swap to previous tmux window layout           |
| <center>tmux</center>      | <center><kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>n</kbd></center>  | Swap to next tmux window layout               |
| <center>Neovim</center>    | <center><kbd>Space</kbd></center>                                  | Leader key for keymaps in Neovim              |
| <center>Neovim</center>    | <center><kbd>ñ</kbd></center>                                      | Secondary leader for keymaps in Neovim        |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>lz</kbd></center>                 | Open Lazy's (plugin manager) window           |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>mp</kbd></center>                 | Open Mason's (util manager) window            |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>sb</kbd></center>                 | Search current buffer with telescope          |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>Leader</kbd></center>             | Source a Lua file in Neovim                   |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>Esc</kbd></center>                      | Dismiss notifications and clear search HL     |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>wh</kbd></center>                 | Horizontal split in Neovim                    |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>wv</kbd></center>                 | Vertical split in Neovim                      |
| <center>Neovim</center>    | <center><kbd>Alt</kbd> + <kbd>Left</kbd></center>                  | Mave vertical split smaller                   |
| <center>Neovim</center>    | <center><kbd>Alt</kbd> + <kbd>Right</kbd></center>                 | Make vertical split larger                    |
| <center>Neovim</center>    | <center><kbd>Alt</kbd> + <kbd>Up</kbd></center>                    | Make horizontal split smaller                 |
| <center>Neovim</center>    | <center><kbd>Alt</kbd> + <kbd>Down</kbd></center>                  | Make horizontal split larger                  |
| <center>Neovim</center>    | <center><kbd>Alt</kbd> + <kbd>1 - 10</kbd></center>                | Create or go to Neovim tabs 1 through 10      |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>Esc</kbd></center>                | Quit all buffers and windows in Neovim        |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>ww</kbd></center>                 | Write current buffer in Neovim                |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>wa</kbd></center>                 | Write to all buffers                          |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>wq</kbd></center>                 | Write and quit all buffers                    |
| <center>Neovim</center>    | <center><kbd>Ctrl + s</kbd></center>                               | Buffer-wide search and replace                |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>ip</kbd></center>                 | Indent an entire paragraph                    |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>cx</kbd></center>                 | Make current file executable (`chmod +x`)     |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>p</kbd></center>                  | Paste visual selection without yanking        |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>P</kbd></center>                  | Paste visual selection without yanking        |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>y\[a-z\]</kbd></center>           | Yank into the \[a-z\] registers               |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>dd</kbd></center>                       | Smart blackhole register deletion (dd)        |
| <center>Neovim</center>    | <center>(Visual mode) <kbd>D</kbd></center>                        | Smart blackhole register deletion             |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>pp</kbd></center>                 | Paste from Neovim's internal clipboard        |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>yy</kbd></center>                 | Yank from Neovim's internal clipboard         |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>n</kbd></center>                        | Remapped to the same but centers the cursor   |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>N</kbd></center>                        | Remapped to the same but centers the cursor   |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>{</kbd></center>                        | Remapped to the same but centers the cursor   |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>}</kbd></center>                        | Remapped to the same but centers the cursor   |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>(</kbd></center>                        | Remapped to the same but centers the cursor   |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>)</kbd></center>                        | Remapped to the same but centers the cursor   |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>S</kbd></center>                        | Replace `S` default functionality             |
| <center>Neovim</center>    | <center>(Visual mode) <kbd>s</kbd></center>                        | Replace `s` default functionality             |
| <center>Neovim</center>    | <center>(Normal and visual mode) <kbd>x</kbd></center>             | Delete character without yanking              |
| <center>Neovim</center>    | <center>(Normal and visual mode) <kbd>X</kbd></center>             | Delete characters without yanking             |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>C</kbd></center>                  | Insert a pseudosnippet for codeblocks in MD   |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>sa</kbd></center>                 | Select all lines in the current buffer        |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>ya</kbd></center>                 | Yank all lines in the current buffer          |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>o</kbd></center>                  | Insert line below and stay in normal mode     |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>O</kbd></center>                  | Insert line above and stay in normal mode     |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>bd</kbd></center>                 | Force close a buffer                          |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>bc</kbd></center>                 | Close a buffer                                |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>q</kbd></center>                  | Close a Neovim window                         |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>;</kbd></center>                  | Put `;` at the end of the line without moving |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>,</kbd></center>                  | Put `,` at the end of the line without moving |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>:</kbd></center>                  | Put `:` at the end of the line without moving |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>.</kbd></center>                  | Put `.` at the end of the line without moving |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>)</kbd></center>                  | Put `)` at the end of the line without moving |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>}</kbd></center>                  | Put `}` at the end of the line without moving |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>\\</kbd></center>                 | Put `\` at the end of the line without moving |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>-</kbd></center>                  | Put `- ` at the start of the line             |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>*</kbd></center>                  | Put `* ` at the start of the line             |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>pc</kbd></center>                 | Put `* [ ]` at the start of the line          |
| <center>Neovim</center>    | <center>(N / V mode) <kbd>Leader</kbd> + <kbd>tn</kbd></center>    | Toggle relative line numbers                  |
| <center>Neovim</center>    | <center>(N / V mode) <kbd>Ctrl + Alt + q</kbd></center>            | Start ranged macro                            |
| <center>Neovim</center>    | <center>(N / V / I mode) <kbd>Ctrl + Alt + c</kbd></center>        | Confirm ranged macro                          |
| <center>Neovim</center>    | <center>(N / V mode) <kbd>Ctrl + Alt + r</kbd></center>            | Replay ranged macro                           |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>Ctrl + d</kbd></center>                 | Remapped to the same but centers the cursor   |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>Ctrl + u</kbd></center>                 | Remapped to the same but centers the cursor   |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>Ctrl + f</kbd></center>                 | Start tmux-sessionizer on a new tmux window   |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>Ctrl + Alt + j</kbd></center>           | Start a mini-terminal inside Neovim           |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>Ctrl + h</kbd></center>                 | Scroll text to the left on the viewport       |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>Ctrl + j</kbd></center>                 | Scroll text to the left on the viewport       |
| <center>Neovim</center>    | <center>(Normal mode) <kbd>Ctrl + z</kbd></center>                 | Unmapped                                      |
| <center>Neovim</center>    | <center>(Visual mode) <kbd>J</kbd></center>                        | Move selected text down                       |
| <center>Neovim</center>    | <center>(Visual mode) <kbd>K</kbd></center>                        | Move selected text up                         |
| <center>Neovim</center>    | <center>(Terminal mode) <kbd>Ctrl + Alt + j</kbd></center>         | Exit terminal and delete buffer               |
| <center>Neovim</center>    | <center>(Visual mode) <kbd><</kbd></center>                        | Indent to the left continuously               |
| <center>Neovim</center>    | <center>(Visual mode) <kbd>></kbd></center>                        | Indent to the right continuously              |
| <center>Neovim</center>    | <center>(Terminal mode) <kbd>Esc</kbd></center>                    | Get out ot terminal mode                      |
| <center>Neovim</center>    | <center><kbd>Leader</kbd> + <kbd>te</kbd></center>                 | Exit terminal                                 |
