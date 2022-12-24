local imgui = require "imgui"

local showTestWindow = false
local showAnotherWindow = false
local floatValue = 0;
local sliderFloat = { 0.1, 0.5 }
local clearColor = { 0.2, 0.2, 0.2 }
local comboSelection = 1
local textValue = "text"
-- File path is not working so have to put the font in the root.
local FreeSerifBold18 = imgui.AddFontFromFileTTF("FreeSerifBold.ttf", 18)
local FreeSerif12 = imgui.AddFontFromFileTTF("FreeSerif.ttf", 12)
local FreeSerif16 = imgui.AddFontFromFileTTF("FreeSerif.ttf", 16)
local FreeMonoBold12 = imgui.AddFontFromFileTTF("FreeMonoBold.ttf", 12)
local FreeMonoBold16 = imgui.AddFontFromFileTTF("FreeMonoBold.ttf", 16)
-- this full path is not working
-- local FreeSansBold12_fullpath = imgui.AddFontFromFileTTF("/home/bill/love-imgui_builder/Sparker256Fork/love-imgui/Love_Imgui_Fonts_Demo/FreeSansBold.ttf", 12)
local FreeSansBold12 = imgui.AddFontFromFileTTF("FreeSansBold.ttf", 12)
local FreeSansBold16 = imgui.AddFontFromFileTTF("FreeSansBold.ttf", 16)

--
-- LOVE callbacks
--
function love.load(arg)
end

function love.update(dt)
    imgui.NewFrame()
end

function love.draw()

    -- Menu
    if imgui.BeginMainMenuBar() then
        if imgui.BeginMenu("File") then
            imgui.MenuItem("Test")
            imgui.EndMenu()
        end
        imgui.EndMainMenuBar()
    end

    -- Debug window
    imgui.Text("Hello, world!");
    clearColor[1], clearColor[2], clearColor[3] = imgui.ColorEdit3("Clear color", clearColor[1], clearColor[2], clearColor[3]);
    
    -- Sliders
    floatValue = imgui.SliderFloat("SliderFloat", floatValue, 0.0, 1.0);
    sliderFloat[1], sliderFloat[2] = imgui.SliderFloat2("SliderFloat2", sliderFloat[1], sliderFloat[2], 0.0, 1.0);
    
    -- Combo
    comboSelection = imgui.Combo("Combo", comboSelection, { "combo1", "combo2", "combo3", "combo4" }, 4);

    -- Windows
    if imgui.Button("Test Window") then
        showTestWindow = not showTestWindow;
    end
    
    if imgui.Button("Another Window") then
        showAnotherWindow = not showAnotherWindow;
    end
    
    if showAnotherWindow then
        imgui.SetNextWindowPos(50, 50, "ImGuiCond_FirstUseEver")
        showAnotherWindow = imgui.Begin("Another Window", true, { "ImGuiWindowFlags_AlwaysAutoResize", "ImGuiWindowFlags_NoTitleBar" });
        imgui.Text("Hello");
        -- Input text
        textValue = imgui.InputTextMultiline("InputText", textValue, 200, 300, 200);
        imgui.End();
    end

    if showTestWindow then
        showTestWindow = imgui.ShowDemoWindow(true)
    end
    
    imgui.PushFont(FreeSerifBold18)
    imgui.Text "Lets Test Some Fonts   FreeSerifBold.ttf Pixel Size 18"
    imgui.PopFont()
    
    imgui.PushFont(FreeSerif12)
    imgui.Text "FreeSerif.ttf Pixel Size 12"
    imgui.PopFont()
    
    imgui.PushFont(FreeSerif16)
    imgui.Text "FreeSerif.ttf  Pixel Size 16"
    imgui.PopFont()
    
    imgui.PushFont(FreeMonoBold12)
    imgui.Text "FreeMonoBold.ttf Pixel Size 12"
    imgui.PopFont()
    
    imgui.PushFont(FreeMonoBold16)
    imgui.Text "FreeMonoBold.ttf  Pixel Size 16"
    imgui.PopFont()

--  This is not working and not sure why
--  For some reason it does not like the full path and thinks it is nullptr
--  /home/bill/love-imgui_builder/Sparker256Fork/love-imgui/Love_Imgui_Fonts_Demo/FreeSansBold.ttf    
--    imgui.PushFont(FreeSansBold16_fullpath)
    imgui.PushFont(FreeSansBold12)
    imgui.Text "FreeSansBold.ttf  Pixel Size 12"
    imgui.PopFont()
    
    imgui.PushFont(FreeSansBold16)
    imgui.Text "FreeSansBold.ttf  Pixel Size 16"
    imgui.PopFont()
    

    love.graphics.clear(clearColor[1], clearColor[2], clearColor[3])
    imgui.Render();
end

function love.quit()
    imgui.ShutDown();
end

--
-- User inputs
--
function love.textinput(t)
    imgui.TextInput(t)
    if not imgui.GetWantCaptureKeyboard() then
        -- Pass event to the game
    end
end

function love.keypressed(key)
    imgui.KeyPressed(key)
    if not imgui.GetWantCaptureKeyboard() then
        -- Pass event to the game
    end
end

function love.keyreleased(key)
    imgui.KeyReleased(key)
    if not imgui.GetWantCaptureKeyboard() then
        -- Pass event to the game
    end
end

function love.mousemoved(x, y)
    imgui.MouseMoved(x, y)
    if not imgui.GetWantCaptureMouse() then
        -- Pass event to the game
    end
end

function love.mousepressed(x, y, button)
    imgui.MousePressed(button)
    if not imgui.GetWantCaptureMouse() then
        -- Pass event to the game
    end
end

function love.mousereleased(x, y, button)
    imgui.MouseReleased(button)
    if not imgui.GetWantCaptureMouse() then
        -- Pass event to the game
    end
end

function love.wheelmoved(x, y)
    imgui.WheelMoved(y)
    if not imgui.GetWantCaptureMouse() then
        -- Pass event to the game
    end
end
