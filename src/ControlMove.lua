local ControlMove = class("ControlMove", function()
    return cc.LayerColor:create(cc.c4b(100,100,100,255))
end)

function ControlMove:init()
    
    local s = self:getContentSize()
    --cc.PhysicsBody:createEdgeSegment(cc.p(0,50),cc.p(s.width,50))
    local vertexs = {
        cc.p(0,0),
        cc.p(0,150),
        cc.p(200,100),
        cc.p(400,80),
        cc.p(480,100),
        cc.p(480,0)
    }
    
    self:setPhysicsBody(cc.PhysicsBody:createEdgePolygon(vertexs))
    
    self._hero = cc.Sprite:create("tank.png")
    self._hero:setPhysicsBody(cc.PhysicsBody:createBox(cc.size(80,59), cc.PhysicsMaterial(0.0,0.0,0.0)))
    self._hero:setTextureRect(cc.rect(0,0,80,59))
    self._hero:setPosition(s.width/2,150)
    self:addChild(self._hero)
    
    local arrow = require("Arrow").new()
    arrow.init(self,self._hero)
    arrow:setPosition(s.width/2,30)
    self:addChild(arrow)
    
    
    --[[
    function moveLeft()
        print("moveleft")
        self._hero:getPhysicsBody():setVelocity(cc.p(-100,0))
    end
    
    function moveRight()
        print("moveright")
        self._hero:getPhysicsBody():setVelocity(cc.p(100,0))
    end
    
    local left = cc.MenuItemImage:create("button.png","button1.png","button.png")
    left:registerScriptTapHandler(moveLeft)
    
    left:setPosition(s.width/2-100,30)
    
    local right = cc.MenuItemImage:create("button.png","button1.png","button.png")
    right:registerScriptTapHandler(moveRight)
    right:setPosition(s.width/2+100,30)
    
    local menu = cc.Menu:create(left,right)
    menu:setPosition(0,0)
    self:addChild(menu)
    --]]
    
end

return ControlMove