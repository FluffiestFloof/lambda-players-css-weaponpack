table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_mac10 = {
        model = "models/weapons/w_smg_mac10.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "MAC-10",
        holdtype = "pistol",
        killicon = "weapon_l_mac10",
        bonemerge = true,
        keepdistance = 300,
        attackrange = 1250,

        clip = 30,
        tracername = "Tracer",
        damage = 6,
        spread = 0.20,
        rateoffire = 0.07,
        muzzleflash = 1,
        shelleject = "ShellEject",
        shelloffang = Angle( -180, 0, 0 ),
        attackanim = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL,
        attacksnd = "Weapon_MAC10.Single",

        reloadtime = 3.2,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        reloadanimspeed = 0.6,
        reloadsounds = { 
            { 0.3, "Weapon_MAC10.Clipout" },
            { 1.5, "Weapon_MAC10.Clipin" },
            { 2.5, "Weapon_MAC10.Boltpull" }
        },

        islethal = true,
    }

})