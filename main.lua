--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

require 'src/Dependencies'


function love.load()
    math.randomseed(os.time())
    love.window.setTitle('Legend of Zelda')
    love.graphics.setDefaultFilter('nearest', 'nearest')

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true
    })

    love.graphics.setFont(gFonts['small'])

    gControl = Control{ engine = love, position = 1, player = 'A' }

    gStateMachine = StateMachine {
        ['start'] = function() return StartState() end,
        ['play'] = function() return PlayState() end,
        ['game-over'] = function() return GameOverState() end
    }
    gStateMachine:change('start')

    gSounds['music']:setLooping(true)
    gSounds['music']:play()
end

function love.resize(w, h)
    push:resize(w, h)
end

function love.keypressed(key)
    if key == 'r' then
        gStateMachine:change('play')
    end
    Control.RegisterKeyboard(key)
end

function love.gamepadpressed(joystick, button)
    Control.RegisterGamepad(button, joystick:getID())
end


function love.update(dt)
    Control.UpdateAll(dt)
    Timer.update(dt)
    gStateMachine:update(dt)
    Control.CleanInputs()
end

function love.draw()
    push:start()
    gStateMachine:render()
    push:finish()
end