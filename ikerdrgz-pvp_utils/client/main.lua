print('^5[ikerdrgz-pvp_utils] [INFO]: Script initializing!^0')

CreateThread(function()
    if ZConfig.enable_stats then
        StatSetInt(`MP0_SHOOTING_ABILITY`, 100, true)
        StatSetInt(`MP0_STAMINA`, 100, true)
    end

    if ZConfig.enable_fps_command then
        RegisterCommand('fps', function()
            fps = not fps
        
            if fps then
                SetTimecycleModifier('cinema')
            else
                ClearTimecycleModifier()
            end
        end)
    end

    if ZConfig.enable_no_recoil then
        for k,v in pairs(ZConfig.no_recoil_weapons) do
            SetWeaponRecoilShakeAmplitude(v, -100)
        end
    end

    if ZConfig.enable_day_command then
        RegisterCommand(ZConfig.day_command, function()
            ClearOverrideWeather()
            ClearWeatherTypePersist()
            SetWeatherTypePersist('CLEAR')
            SetWeatherTypeNow('CLEAR')
            SetWeatherTypeNowPersist('CLEAR')
            NetworkOverrideClockTime(12, 0, 0)
        end)
    end
end)

print('^2[ikerdrgz-pvp_utils] [SUCCESS]: Script successfully started!^0')