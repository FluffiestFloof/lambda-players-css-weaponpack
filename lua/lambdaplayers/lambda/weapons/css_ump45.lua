table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_ump45 = {
        model = "models/weapons/w_smg_ump45.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "UMP-45",
        holdtype = "ar2",
        killicon = "weapon_l_ump45",
        bonemerge = true,
        keepdistance = 350,
        attackrange = 2100,

        clip = 25,
        tracername = "Tracer",
        damage = 8,
        spread = 0.13,
        rateoffire = 0.10,
        muzzleflash = 1,
        shelleject = "ShellEject",
        attackanim = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,
        attacksnd = "Weapon_UMP45.Single",

        reloadtime = 3.5,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        reloadanimspeed = 0.6,
        reloadsounds = { 
            { 0.4, "Weapon_UMP45.Clipout" },
            { 1.8, "Weapon_UMP45.Clipin" },
            { 2.5, "Weapon_UMP45.Boltslap" }
        },

        islethal = true,
    }

})