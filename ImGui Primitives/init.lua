local core_mainmenu = require("core_mainmenu")

local display = false

local function DoTestLines()
    success, display = imgui.Begin("Test Lines", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddLine(
            xStart + 0, yStart + 0, -- a
            xStart + 500, yStart + 500, -- b
            0xFFFFFFFF, -- color 
            100) -- thickness
        imgui.AddLine(
            xStart + 300, yStart + 600, --a
            xStart + 100, yStart + 100, -- b
            0xFFFF0000, -- color
            50) -- thickness
        imgui.End()
    end
end

local function DoTestRect()
    success, display = imgui.Begin("Test Rect", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddRect(
            xStart + 100, yStart + 100, -- a
            xStart + 300, yStart + 300, -- b
            0xFF7FFF2F, -- color
            1, -- optional rounding
            15, -- optional rounding corners bitmask (0xF for all 4 corners)
            15.2) -- optional thickness
        imgui.AddRect(
            xStart + 400, yStart + 400, -- a
            xStart + 800, yStart + 800, -- b
            0xAF7FFF2F, -- color
            0, -- no rounding
            0, -- optional rounding corners
            25.0) -- optional thickness
        imgui.End()
    end
end

local function DoTestRectFilled()
    success, display = imgui.Begin("Test RectFilled", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddRectFilled(
            xStart + 100, yStart + 100, -- a
            xStart + 300, yStart + 300, -- b
            0x7F7F002F, -- color
            1.0, -- optional rounding
            0xF) -- optional rounding corners bitmask
        imgui.End()
    end
end

local function DoTestRectFilledMultiColor()
    success, display = imgui.Begin("Test RectFilledMulti", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddRectFilledMultiColor(
            xStart + 100, yStart + 100, -- a 
            xStart + 300, yStart + 300, -- b
            0x7FFF0000, -- upper left color
            0x7F003F00, -- upper right color
            0xFF009F2F, -- bottom right color
            0x2F333333) -- bottom left color
        imgui.End()
    end
end

local function DoTestQuad()
    success, display = imgui.Begin("Test Quad", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddQuad(
            xStart + 100, yStart + 100, -- a
            xStart + 300, yStart + 300, -- b
            xStart + 500, yStart + 200, -- c
            xStart + 200, yStart + 600, -- d
            0x7F7F002F, -- color
            15.0) -- thickness
        imgui.End()
    end
end


local function DoTestQuadFilled()
    success, display = imgui.Begin("Test QuadFilled", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddQuadFilled(
            xStart + 100, yStart + 100, -- a
            xStart + 300, yStart + 300, -- b
            xStart + 500, yStart + 200, -- c
            xStart + 200, yStart + 600, -- d
            0x7F7F002F) -- color
        imgui.End()
    end
end

local function DoTestTriangle()
    success, display = imgui.Begin("Test Triangle", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddTriangle(
            xStart + 100, yStart + 100, -- a
            xStart + 300, yStart + 300, -- b
            xStart + 500, yStart + 200, -- c
            0x7F7F002F) -- color
        imgui.AddTriangle(
            xStart + 300, yStart + 100, -- a
            xStart + 300, yStart + 600, -- b
            xStart + 200, yStart + 900, -- c
            0x7F2F005F, -- color
            30.5) -- optional thickness
        imgui.End()
    end
end

local function DoTestTriangleFilled()
    success, display = imgui.Begin("Test TriangleFIlled", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddTriangleFilled(
            xStart + 100, yStart + 100, -- a
            xStart + 300, yStart + 300, -- b
            xStart + 500, yStart + 200, -- c
            0x7F7F002F) -- color
        imgui.End()
    end
end
local function DoTestCircle()
    success, display = imgui.Begin("Test Circle", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddCircle(
            xStart + 170, yStart + 170, -- center
            150, -- radius
            0xFF222210, -- color
            20, -- optional num_segments
            30) -- optional thickness
        imgui.End()
    end
end

local function DoTestCircleFilled()
    success, display = imgui.Begin("Test CircleFilled", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddCircleFilled(
            xStart + 160, yStart + 170, -- center
            150, -- radius
            0xFF222210, -- color
            20) -- optional num_segments
        imgui.End()
    end
end

local function DoTestBezierCurve()
    success, display = imgui.Begin("Test BezierCurve", display, {})
    if success then
        local xStart, yStart = imgui.GetWindowPos()
        imgui.AddBezierCurve(
            xStart + 100, yStart + 100, -- pos0
            xStart + 200, yStart + 300, -- cp0
            xStart + 400, yStart + 200, -- cp1
            xStart + 600, yStart + 400, -- pos1
            0x7F7F7F00, -- color
            15.2, -- thickness
            20) -- optional num_segments (0 makes it a line)
        imgui.End()
    end
end

local function PresentNotSupported()
    success, display = imgui.Begin("ImGui Primitive Test", display, {})
    if success then
        imgui.Text("Not supported. Please update the addon plugin (dinput8.dll).")
        imgui.End()
    end
end

local function present()
    if not display then
        return
    end

    -- Do nothing if not supported.
    -- pso.require_version was added when some string formatting bugs were fixed
    -- in v3.6.0.
    if nil == pso.require_version or not pso.require_version(3, 7, 0) then
        PresentNotSupported()
        return
    end

    -- Display all of the windows to demonstrate how they work.
    -- Probably a good idea to comment out the ones you don't care about.
    DoTestLines()
    DoTestRect()
    DoTestRectFilled()
    DoTestRectFilledMultiColor()
    DoTestQuad()
    DoTestQuadFilled()
    DoTestTriangle()
    DoTestTriangleFilled()
    DoTestCircle()
    DoTestCircleFilled()
    DoTestBezierCurve()
end


local function init()
    local mainMenuButtonHandler = function()
        display = not display
    end
    core_mainmenu.add_button("ImGui Primitive Test", mainMenuButtonHandler)
    
    return 
    {
        name = 'ImGui Primitive Test',
        version = '0.0.1',
        author = 'Ender',
        present = present,
        toggleable = true,
    }
end

return 
{
    __addon = 
    {
        init = init,
    },
}
