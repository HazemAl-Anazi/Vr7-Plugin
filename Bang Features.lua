local TargetPath = getgenv().ButtonsContainer

getgenv().VR7_API.CreateButton(TargetPath, "زر من البلوقن", function()
    print("تم الضغط على زر البلوقن")
end)

getgenv().VR7_API.CreateToggle(TargetPath, "طيران", false, function(State)
    local LocalPlayer = game:GetService("Players").LocalPlayer
    local Character = LocalPlayer.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    
    if Humanoid then
        if State then
            print("تم تفعيل الطيران")
        else
            print("تم إيقاف الطيران")
        end
    end
end)
