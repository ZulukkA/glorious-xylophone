--[[
        Script: Menu de Teste com Teleporte de Brainrot
            Descrição: GUI simples, sem chave, com um botão para ativar/desativar a função de teleporte.
                Cor: Azul Escuro
                    Pronto para loadstring.
]]

-- Evite que o script seja executado novamente se você já estiver carregado
if getgenv().MenuTesteCarregado então
    retornar
    fim
    getgenv().MenuTesteCarregado = true


    -- //==============[ CONFIGURAÃ‡Ã•ES E LÃ“GICA ]==============//

    local brainrotTeleportAtivo = false -- Controla se a função de teleporte está LIGADA ou DESLIGADA

    -- Uma função de teleporte que já criamos
    função local executarTeleporte()
        -- Verificação de segurança: só executa se o botão no menu estiver ativo
            se não for brainrotTeleportAtivo então
                    print("Tentativa de teleporte, mas a função está desativada no menu.")
                            retornar
                                fim

                                    jogador local = jogo:GetService("Jogadores").LocalPlayer
                                        personagem local = jogador.Personagem
                                            local humanoidRootPart = personagem e personagem:FindFirstChild("HumanoidRootPart")

                                                se não for humanoidRootPart então
                                                        warning("Jogador ou HumanoidRootPart não encontrado para teleporte.")
                                                                retornar
                                                                    fim

                                                                        -- ATENÃ‡ÃƒO: ESSA Ã‰ A PARTE MAIS IMPORTANTE PARA VOCÃŠ EDITAR
                                                                            -- Ajuste esta linha para encontrar a base corretamente no seu jogo.
                                                                                playerBase local = jogo.Workspace:FindFirstChild(jogador.Nome .. "'s Base")

                                                                                    se playerBase e playerBase:IsA("BasePart") então
                                                                                            print("Base encontrada! Teleportando...")
                                                                                                    humanoidRootPart.CFrame = playerBase.CFrame + Vector3.new(0, 3, 0)
                                                                                                            print("Teleporte concluído.")
                                                                                                                outro
                                                                                                                        warning("AVISO: Base do jogador '" .. player.Name .. "' não foi encontrado. O teleporte falhou.")
                                                                                                                            fim
                                                                                                                            fim

                                                                                                                            -- Roda em segundo plano para encontrar a ferramenta e conectar o evento
                                                                                                                            -- Isso evita que o jogo congele enquanto espera a ferramenta.
                                                                                                                            spawn(função()
                                                                                                                                jogador local = jogo:GetService("Jogadores").LocalPlayer
                                                                                                                                    mochila local = jogador:WaitForChild("Mochila")
                                                                                                                                        ferramenta local = mochila:WaitForChild("brainrot")
                                                                                                                                        
                                                                                                                                            print("Ferramenta 'brainrot' encontrada! Evento de equipamento conectado.")
                                                                                                                                                
                                                                                                                                                    -- Quando a ferramenta é equipada, chama a função de teletransporte
                                                                                                                                                        ferramenta.Equipado:Conectar(executarTeleporte)
                                                                                                                                                        fim)


                                                                                                                                                        -- //==============[ CRIAÇÃO DA INTERFACE (GUI) ]===============//

                                                                                                                                                        -- Criar a tela principal
                                                                                                                                                        ScreenGui local = Instância.new("ScreenGui")
                                                                                                                                                        ScreenGui.Parent = jogo:GetService("Jogadores").LocalPlayer:WaitForChild("PlayerGui")
                                                                                                                                                        ScreenGui.ResetOnSpawn = false -- Para o menu não sumir se o jogador morrer

                                                                                                                                                        -- Frame principal (a janela do menu)
                                                                                                                                                        MainFrame local = Instância.new("Quadro")
                                                                                                                                                        MainFrame.Parent = ScreenGui
                                                                                                                                                        MainFrame.BackgroundColor3 = Color3.fromRGB(25, 28, 38) -- Azul bem escuro
                                                                                                                                                        MainFrame.BorderColor3 = Color3.fromRGB(74, 144, 226) -- Borda azul clara
                                                                                                                                                        MainFrame.BorderSizePixel = 2
                                                                                                                                                        MainFrame.Size = UDim2.new(0, 320, 0, 180) -- Tamanho da janela
                                                                                                                                                        MainFrame.Position = UDim2.new(0.5, -160, 0.5, -90) -- Centralizado
                                                                                                                                                        MainFrame.Draggable = true -- Permite arrastar uma janela
                                                                                                                                                        MainFrame.Active = verdadeiro

                                                                                                                                                        -- Barra de título
                                                                                                                                                        Barra de Título local = Instance.new("Quadro")
                                                                                                                                                        TitleBar.Parent = MainFrame
                                                                                                                                                        TitleBar.BackgroundColor3 = Color3.fromRGB(35, 39, 51) -- Um pouco mais claro que o fundo
                                                                                                                                                        TitleBar.Size = UDim2.new(1, 0, 0, 30)
                                                                                                                                                        TitleBar.BorderSizePixel = 0

                                                                                                                                                        -- Texto do título
                                                                                                                                                        TítuloLabel local = Instância.new("TextLabel")
                                                                                                                                                        TitleLabel.Parent = Barra de Título
                                                                                                                                                        TitleLabel.Text = "teste"
                                                                                                                                                        TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                                                                                                                                                        TitleLabel.Font = Enum.Font.SourceSansBold
                                                                                                                                                        TitleLabel.TextSize = 18
                                                                                                                                                        TitleLabel.BackgroundTransparency = 1
                                                                                                                                                        TitleLabel.Size = UDim2.new(1, -30, 1, 0) -- Deixa espaço para o botão de fechar
                                                                                                                                                        TitleLabel.Position = UDim2.new(0, 0, 0, 0)
                                                                                                                                                        TitleLabel.TextXAligment = Enum.TextXAligment.Center

                                                                                                                                                        -- Botão de fechar
                                                                                                                                                        BotãoFechar local = Instância.new("BotãoTexto")
                                                                                                                                                        CloseButton.Parent = Barra de Título
                                                                                                                                                        BotãoFechar.Texto = "X"
                                                                                                                                                        CloseButton.BackgroundColor3 = Barra de Título.BackgroundColor3
                                                                                                                                                        CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                                                                                                                                                        BotãoFechar.Fonte = Enum.Fonte.SourceSansBold
                                                                                                                                                        CloseButton.TextSize = 18
                                                                                                                                                        BotãoFechar.Tamanho = UDim2.novo(0, 30, 1, 0)
                                                                                                                                                        CloseButton.Position = UDim2.new(1, -30, 0, 0)
                                                                                                                                                        BotãoFechar.TamanhoDaBordaPixel = 0
                                                                                                                                                        BotãoFechar.BotãoMouse1Clique:Conectar(função()
                                                                                                                                                            ScreenGui:Destruir()
                                                                                                                                                                getgenv().MenuTesteCarregado = nil -- Permite recarregar o script fechado
                                                                                                                                                                fim)

                                                                                                                                                                -- Botão para ativar/desativar o teleporte
                                                                                                                                                                ToggleTPButton local = Instance.new("TextButton")
                                                                                                                                                                ToggleTPButton.Parent = MainFrame
                                                                                                                                                                ToggleTPButton.Size = UDim2.new(1, -20, 0, 40)
                                                                                                                                                                ToggleTPButton.Position = UDim2.new(0, 10, 0, 50)
                                                                                                                                                                ToggleTPButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50) -- Começo vermelho (Desativado)
                                                                                                                                                                ToggleTPButton.BorderColor3 = Cor3.fromRGB(255, 255, 255)
                                                                                                                                                                ToggleTPButton.Font = Enum.Font.SourceSansSemibold
                                                                                                                                                                ToggleTPButton.TextSize = 16
                                                                                                                                                                ToggleTPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                                                                                                                                                                ToggleTPButton.Text = "Brainrot TP: [DESLIGADO]"

                                                                                                                                                                -- Função do botão de alternar
                                                                                                                                                                ToggleTPButton.MouseButton1Click:Conectar(função()
                                                                                                                                                                    brainrotTeleportAtivo = not brainrotTeleportAtivo -- Inverta o valor (true vira false, false vira true)
                                                                                                                                                                    
                                                                                                                                                                        se brainrotTeleportAtivo então
                                                                                                                                                                                ToggleTPButton.Text = "Brainrot TP: [LIGADO]"
                                                                                                                                                                                        ToggleTPButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50) -- Verde
                                                                                                                                                                                            outro
                                                                                                                                                                                                    ToggleTPButton.Text = "Brainrot TP: [DESLIGADO]"
                                                                                                                                                                                                            ToggleTPButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50) -- Vermelho
                                                                                                                                                                                                                fim
                                                                                                                                                                                                                fim)


                                                                                                                                                                                                                -- Botão de exemplo 2 (para você adicionar mais funções)
                                                                                                                                                                                                                local OutroBotao = Instance.new("TextButton")
                                                                                                                                                                                                                OutroBotao.Parent = MainFrame
                                                                                                                                                                                                                OutroBotao.Size = UDim2.new(1, -20, 0, 40)
                                                                                                                                                                                                                OutroBotao.Position = UDim2.new(0, 10, 0, 110)
                                                                                                                                                                                                                OutroBotao.BackgroundColor3 = Color3.fromRGB(74, 144, 226) -- Azul do tema
                                                                                                                                                                                                                OutroBotao.BorderColor3 = Color3.fromRGB(255, 255, 255)
                                                                                                                                                                                                                OutroBotao.Font = Enum.Font.SourceSansSemibold
                                                                                                                                                                                                                OutroBotao.TextSize = 16
                                                                                                                                                                                                                OutroBotao.TextColor3 = Color3.fromRGB(255, 255, 255)
                                                                                                                                                                                                                OutroBotao.Text = "Ativar Outra Coisa"

                                                                                                                                                                                                                OutroBotao.MouseButton1Click:Connect(function()
                                                                                                                                                                                                                    print("O segundo botão foi clicado!")
                                                                                                                                                                                                                        -- Coloque o código para sua outra função aqui
                                                                                                                                                                                                                        fim)
]]
