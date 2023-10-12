Player = {}

function SetUpPlayer()
    Player = {x = 530, y = 20, speed = 300}
    Player.collider = World:newBSGRectangleCollider(Player.x, Player.y, 30, 40, 10)
    Player.collider:setCollisionClass('Player')
    Player.collider:setFixedRotation(true)
    Player.spriteSheet = love.graphics.newImage('sprites/characters/player-sheet.png')
    Player.grid = Anim8.newGrid(12, 18, Player.spriteSheet:getWidth(), Player.spriteSheet:getHeight(), 1)
    Player.animations = {}
    Player.animations.down = Anim8.newAnimation(Player.grid('1-4', 1), 0.2)
    Player.animations.left = Anim8.newAnimation(Player.grid('1-4', 2), 0.2)
    Player.animations.right = Anim8.newAnimation(Player.grid('1-4', 3), 0.2)
    Player.animations.up = Anim8.newAnimation(Player.grid('1-4', 4), 0.2)
    Player.anim = Player.animations.down
end
