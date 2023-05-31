require("todo-comments").setup {
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--hidden",
            "--line-number",
            "--column",
        }
    }
}
