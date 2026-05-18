local function HopServer()

    local current =
        GetCurrentWeather()

    print(
        "当前天气:",
        current
    )


    if current
    and TargetWeather[current] then

        print(
            "找到目标天气:",
            current
        )

        return

    end


    print(
        "天气不符合，换服..."
    )


    local target =
        GetServer()


    if target then

        game:GetService(
            "TeleportService"
        ):TeleportToPlaceInstance(

            game.PlaceId,

            target,

            game.Players.LocalPlayer

        )

    end

end


task.wait(2)

HopServer()