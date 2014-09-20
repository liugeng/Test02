local AddBox = class("AddBox", function()
    return cc.LayerColor:create(cc.c4b(100,100,100,255))
end)

function AddBox:init()

    local s = cc.Director:getInstance():getVisibleSize()
    s.width = s.width-100
    s.height = s.height-100
    self:setPosition(50,50)
    self:setContentSize(s)
    self:setPhysicsBody(cc.PhysicsBody:createEdgeBox(s,cc.PhysicsMaterial(1.0,0.0,0.0)))
    local p = cc.p(s.width/2,s.height/2)
    self:getPhysicsBody():setPositionOffset(p)

    local function addBox(p)
        local box = cc.Sprite:create("land.png")
        box:setScale(0.3)
        box:setPhysicsBody(cc.PhysicsBody:createBox(cc.size(50,20)))
        box:setPosition(p)
        self:addChild(box)
    end

    self.touchListener = cc.EventListenerTouchOneByOne:create()
    self.touchListener:setSwallowTouches(true)

    local function onTouchBegan(touch, event)
        local p = self:convertTouchToNodeSpace(touch)
        addBox(p)
    end

    --注册touch监听
    self.touchListener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN)
    cc.Director:getInstance():getEventDispatcher():addEventListenerWithSceneGraphPriority(self.touchListener,self)
end

return AddBox