function love.conf(t)
    t.identity = nil                   -- The name of the save directory (string)
    t.appendidentity = false           -- Search files in source directory before save directory (boolean)
    t.version = "11.1"                  -- The LÖVE version this game was made for (string)
    t.console = true                   -- Attach a console (boolean, Windows only)

    t.window.title = "Space Invaders"   -- The window title (string)
    t.window.icon = "images/invader.png"-- Filepath to an image to use as the window's icon (string)
    t.window.width = 800                -- The window width (number)
    t.window.height = 600               -- The window height (number)
    t.window.borderless = false         -- Remove all border visuals from the window (boolean)
    t.window.resizable = false          -- Let the window be user-resizable (boolean)

end