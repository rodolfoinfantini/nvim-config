require('telescope').setup{
    file_ignore_patterns = {"node%_modules/.*", ".git/.*"},
    extensions = {
        coc = {
            prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        },
    },
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = { height = 0.95, width = 0.75, preview_width = 0.35 },
    },
}
require('telescope').load_extension('coc')
