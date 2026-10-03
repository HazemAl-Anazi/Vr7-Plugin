local ToggleFrame = getgenv().VR7_API.CreateToggle(ButtonsContainer, "بانق V1", false, function(State)
    if TargetedPlayer == nil then return end
    
    local TargetChar = Players[TargetedPlayer].Character
    if not TargetChar then return end
    
    local OtherTorso = TargetChar:FindFirstChild("Torso") or TargetChar:FindFirstChild("UpperTorso")
    local Root = GetRoot(plr)
    local Hum = Root.Parent:FindFirstChildOfClass("Humanoid")
    
    if not OtherTorso or not Root or not Hum then return end

    if State then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "System VR7",
            Text = "يمكنك تغير سرعة البانق من الاعدادات في الواجهه",
            Duration = 3
        })
        
        task.spawn(function()
            while ToggleFrame:GetAttribute("IsActive") == true do
                pcall(function()
                    if game.PlaceId ~= 11379739543 then
                        if Hum.RigType.Name == "R15" and Hum.Sit then
                            if not CheckAnim("5918726674") then 
                                PlayAnim(5918726674, 0, tonumber(getgenv().ConfigData.BangSpeed)) 
                            end
                        elseif Hum.Sit then 
                            if not CheckAnim("148840371") then 
                                PlayAnim(148840371, 0, tonumber(getgenv().ConfigData.BangSpeed + 1.7)) 
                            end
                        end
                        Hum.Sit = true 
                        Root.CFrame = OtherTorso.CFrame * CFrame.new(0, 0, 1)
                        Root.Velocity = Vector3.new(0, 0, 0)
                        workspace.FallenPartsDestroyHeight = 0 / 0
                    else
                        Root.Velocity = Vector3.new()
                        local Offset = math.sin(tick() * 20) * 0.6
                        Root.CFrame = OtherTorso.CFrame * CFrame.new(0, 0, 2 + Offset)
                        workspace.FallenPartsDestroyHeight = 0 / 0
                    end
                end)
                task.wait()
            end
            
            workspace.FallenPartsDestroyHeight = -500
            StopAnim()
            Hum.Sit = false
        end)
    end
end)

ToggleFrame:SetAttribute("IsActive", false)

local ButtonElement = ToggleFrame:FindFirstChildOfClass("TextButton")
if ButtonElement then
    ButtonElement.MouseButton1Click:Connect(function()
        local CurrentState = ToggleFrame:GetAttribute("IsActive")
        ToggleFrame:SetAttribute("IsActive", not CurrentState)
    end)
end
