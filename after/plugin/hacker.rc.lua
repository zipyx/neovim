local status, hacker = pcall(require, "hacker")
if (not status) then return end

hacker.setup {
  filetype = "c",
  speed = {
    min = 1,
    max = 3,
  },
  is_popup = true,
  popup_after = 4,
}
