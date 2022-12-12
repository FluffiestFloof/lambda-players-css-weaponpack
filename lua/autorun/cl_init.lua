if CLIENT then
    local iconColor = Color(255, 80, 0, 255)
    local cssFontName = "LambdaCSKillIcons"
    
    surface.CreateFont( cssFontName, {
        font = "csd",
        size = ScreenScale(25),
        weight = 500, 
        antialias = true, 
        additive = true
    } )

    killicon.AddFont( "weapon_l_sg552", cssFontName, "A", iconColor )
    killicon.AddFont( "weapon_l_p228", cssFontName, "a", iconColor )
    killicon.AddFont( "weapon_l_xm1014", cssFontName, "B", iconColor )
    killicon.AddFont( "weapon_l_ak47", cssFontName, "b", iconColor )
    killicon.AddFont( "weapon_l_glock", cssFontName, "c", iconColor )
    killicon.AddFont( "weapon_l_tmp", cssFontName, "d", iconColor )
    killicon.AddFont( "weapon_l_aug", cssFontName, "e", iconColor )
    killicon.AddFont( "weapon_l_deagle", cssFontName, "f", iconColor )
    killicon.AddFont( "weapon_l_g3sg1", cssFontName, "i", iconColor )
    killicon.AddFont( "weapon_l_knife", cssFontName, "j", iconColor )
    killicon.AddFont( "weapon_l_m3", cssFontName, "k", iconColor )
    killicon.AddFont( "weapon_l_mac10", cssFontName, "l", iconColor )
    killicon.AddFont( "weapon_l_p90", cssFontName, "m", iconColor )
    killicon.AddFont( "weapon_l_scout", cssFontName, "n", iconColor )
    killicon.AddFont( "weapon_l_sg550", cssFontName, "o", iconColor )
    killicon.AddFont( "weapon_l_ump45", cssFontName, "q", iconColor )
    killicon.AddFont( "weapon_l_awp", cssFontName, "r", iconColor )
    killicon.AddFont( "weapon_l_dualelites", cssFontName, "s", iconColor )
    killicon.AddFont( "weapon_l_famas", cssFontName, "t", iconColor )
    killicon.AddFont( "weapon_l_fiveseven", cssFontName, "u", iconColor )
    killicon.AddFont( "weapon_l_galil", cssFontName, "v", iconColor )
    killicon.AddFont( "weapon_l_m4a1", cssFontName, "w", iconColor )
    killicon.AddFont( "weapon_l_mp5", cssFontName, "x", iconColor )
    killicon.AddFont( "weapon_l_usp", cssFontName, "y", iconColor )
    killicon.AddFont( "weapon_l_m249", cssFontName, "z", iconColor )
end