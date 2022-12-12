table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_sg550 = {
        model = "models/weapons/w_snip_sg550.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "SG550",
        holdtype = "ar2",
        killicon = "weapon_l_sg550",
        bonemerge = true,
        keepdistance = 480,
        attackrange = 2800,

        clip = 30,
        tracername = "Tracer",
        damage = 20,
        spread = 0.2,
        rateoffire = 0.25,
        muzzleflash = 1,
        shelleject = "RifleShellEject",
        attackanim = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,
        attacksnd = "Weapon_SG550.Single",

        reloadtime = 3.5,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        reloadanimspeed = 0.60,
        reloadsounds = { 
            { 0.2, "Weapon_SG550.Clipout" },
            { 1.7, "Weapon_SG550.Clipin" },
            { 2.6, "Weapon_SG550.Boltpull" }
        },

        islethal = true,
    }

})