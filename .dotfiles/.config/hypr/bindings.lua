local mainMod = "SUPER"
hl.config({ input = { kb_options = "ctrl:nocaps" } })
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"), { desc = "lock the screen" })

hl.bind(mainMod .. " + W", hl.dsp.window.close(), { desc = "Close window" })
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }), { desc = "Toggle floating" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 0 }), { desc = "Fullscreen" })
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), { desc = "Pseudo tile" })
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"), { desc = "Toggle split" })

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }), { desc = "Focus left" })
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }), { desc = "Focus right" })
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "up" }), { desc = "Focus up" })
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "down" }), { desc = "Focus down" })

hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.window.swap({ direction = "left" }), { desc = "Swap left" })
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.swap({ direction = "right" }), { desc = "Swap right" })
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.window.swap({ direction = "up" }), { desc = "Swap up" })
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.window.swap({ direction = "down" }), { desc = "Swap down" })

hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }), { desc = "Next workspace" })
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }), { desc = "Previous workspace" })

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { desc = "Next workspace" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { desc = "Previous workspace" })

for i = 1, 10 do
	local code = tostring(9 + i)
	local ws = tostring(i)

	hl.bind(mainMod .. " + code:" .. code, hl.dsp.focus({ workspace = ws }), { desc = "Switch to workspace " .. ws })

	hl.bind(
		mainMod .. " + SHIFT + code:" .. code,
		hl.dsp.window.move({ workspace = ws }),
		{ desc = "Move to workspace " .. ws }
	)
end

hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("powermenu"), { desc = "launches powermenu" })

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show drun"), { desc = "Launch apps" })
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("ghostty"), { desc = "Terminal" })
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("brave"), { desc = "Browser" })
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("ghostty -e yazi"), { desc = "File manager" })
hl.bind("PRINT", hl.dsp.exec_cmd("grimblast copy area"), { desc = "Screenshot" })
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("ghostty -e btop"), { desc = "Activity" })
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("ghostty -e nvim ~/Notes/"), { desc = "Notes" })

hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("brave --app=https://chatgpt.com"), { desc = "ChatGPT" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("brave --app=https://perplexity.ai"), { desc = "Perplexity" })
hl.bind(mainMod .. " + SHIFT + Y", hl.dsp.exec_cmd("brave --app=https://youtube.com"), { desc = "YouTube" })
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("brave --app=https://web.whatsapp.com"), { desc = "WhatsApp" })
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd("brave --app=https://x.com"), { desc = "X" })
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("brave --app=https://claude.ai"), { desc = "Claude" })

hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("spotify"), { desc = "Spotify" })
