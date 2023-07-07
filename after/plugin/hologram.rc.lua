local status, hologram = pcall(require, "hologram")
if (not status) then return end

hologram.setup {
  auto_display = true, -- WIP automatic markdown image display, may break based on project
}

-- local source = '/Users/.../Documents/my-image.png'
-- local source = '/home/onahp/Downloads/pepe.png'
-- local buf = vim.api.nvim_get_current_buf()
-- local image = require('hologram.image'):new(source, {})

-- -- Image should appear below this line, then disappear after 5 seconds

-- image:display(5, 0, buf, {})

-- vim.defer_fn(function()
--   image:delete(0, { free = true })
-- end, 5000)
