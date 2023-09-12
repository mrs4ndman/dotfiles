- When inside a gh.nvim panel, this key will open a node if it has any futher functionality. for example, hitting <CR> on a commit node will open the commit's changed files in a new gh.nvim panel.
```
open = "<CR>",
```
- When inside a gh.nvim panel, expand a collapsed node
```
expand = "zo",
```
- When inside a gh.nvim panel, collpased an expanded node
```
collapse = "zc",
```
- When cursor is over a "#1234" formatted issue or PR, open its details and comments in a new tab.
```
goto_issue = "gd",
```
- Show any details about a node, typically, this reveals commit messages and submitted review bodys.
```
details = "d",
```
- Inside a convo buffer, submit a comment
```
submit_comment = "<C-s>",
```
- Inside a convo buffer, when your cursor is ontop of a comment, open up a set of actions that can be performed.
```
actions = "<C-a>",
```
- Inside a thread convo buffer, resolve the thread.
```
resolve_thread = "<C-r>",
```
- Inside a gh.nvim panel, if possible, open the node's web URL in your browser. useful particularily for digging into external failed CI checks.
```
goto_web = "gx"
```
