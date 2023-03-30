--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

PlayerLiftingState = Class{__includes = BaseState}

function PlayerLiftingState:init(player, dungeon)
    self.player = player
    self.dungeon = dungeon

    self.player:changeAnimation('lift-' .. self.player.direction)
end

function PlayerLiftingState:enter(params)
    -- render offset for spaced character sprite (negated in render function of state)
    self.player.offsetY = 5
    self.player.offsetX = 0
    self.player.projectile = Projectile(GAME_OBJECT_DEFS['pot'], self.player)
    params.object.inPlay = false

    table.insert(self.dungeon.currentRoom.objects, self.player.projectile)

    self.offsets = {
        right = {
            { x = self.player.width, y = 0 },
            { x = self.player.width * 0.5, y = -5 },
            { x = 0, y = -10 },
        },
        left = {
            { x = -self.player.width, y = 0 },
            { x = -self.player.width * 0.5, y = -5 },
            { x = 0, y = -10 },
        },
        up = {
            { x = 0, y = 0 },
            { x = 0, y = -5 },
            { x = 0, y = -10 },
        },
        down = {
            { x = 0, y = 0 },
            { x = 0, y = -5 },
            { x = 0, y = -10 },
        }
    }

    self.player.currentAnimation:refresh()
end

function PlayerLiftingState:update(dt)
    local direction = self.player.direction
    local anim = self.player.currentAnimation

    if self.player.currentAnimation.timesPlayed > 0 then
        self.player.currentAnimation.timesPlayed = 0

        self.player:changeState('idle-carrying')
    else
        if anim.currentFrame <= #self.offsets[direction] then
            local currentOffset = self.offsets[direction][anim.currentFrame]

            self.player.projectile.offsetX = currentOffset.x
            self.player.projectile.offsetY = currentOffset.y
        end
    end
end

function PlayerLiftingState:render()
    local anim = self.player.currentAnimation
    love.graphics.draw(gTextures[anim.texture], gFrames[anim.texture][anim:getCurrentFrame()],
        math.floor(self.player.x - self.player.offsetX), math.floor(self.player.y - self.player.offsetY))
end