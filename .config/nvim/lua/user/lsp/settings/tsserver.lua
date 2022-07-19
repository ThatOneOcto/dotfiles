local lspconfig = require 'nvim-lspconfig'
local util = require 'lspconfig.util'

lspconfig.tsserver.setup({
    root_dir = function(fname)
        return util.root_pattern('tsconfig.json')(fname)
            or util.root_pattern('package.json', 'jsconfig.json', '.git')(fname)
            or util.path.dirname(fname)
    end
})
