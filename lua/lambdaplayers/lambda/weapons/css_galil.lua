table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_galil = {
        model = "models/weapons/w_rif_galil.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "Galil",
        holdtype = "ar2",
        killicon = "weapon_l_galil",
        bonemerge = true,
        keepdistance = 400,
        attackrange = 2000,
        offpos = Vector( 11, -1, -2 ),   
        offang = Angle( -10, 0, 0 ),

        clip = 35,
        tracername = "Tracer",
        damage = 8,
        spread = 0.15,
        rateoffire = 0.09,
        muzzleflash = 1,
        shelleject = "RifleShellEject",
        shelloffpos = Vector( 0, 5, -2 ),
        attackanim = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,
        attacksnd = "Weapon_Galil.Single",

        reloadtime = 2.5,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        reloadanimspeed = 0.8,
        reloadsounds = { 
            { 0.1, "Weapon_Galil.Clipout" },
            { 1.5, "Weapon_Galil.Clipin" },
            { 2.1, "Weapon_Galil.BoltPull" }
        },

        islethal = true,
    }

})