--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GAME_OBJECT_DEFS = {
    ['switch'] = {
        type = 'switch',
        texture = 'switches',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'unpressed',
        states = {
            ['unpressed'] = {
                frame = 2
            },
            ['pressed'] = {
                frame = 1
            }
        }
    },
    ['heart'] = {
        type = 'heart',
        texture = 'hearts',
        frame = 2,
        width = 16,
        height = 16,
        solid = false,
        scale = 0.5,
        defaultState = 'available',
        states = {
            ['available'] = {
                frame = 5
            }
        }
    },
    ['pot'] = {
        type = 'carriable',
        texture = 'tiles',
        frame = 2,
        width = 8,
        height = 8,
        solid = true,
        defaultState = 'onfloor',
        states = {
            ['onfloor'] = {
                frame = 110
            },
            ['carried'] = {
                frame = 111
            }
        }
    }
}