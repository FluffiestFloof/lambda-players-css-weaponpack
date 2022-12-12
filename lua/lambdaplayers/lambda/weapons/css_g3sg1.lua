table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_g3sg1 = {
        model = "models/weapons/w_snip_g3sg1.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "G3SG1",
        holdtype = "ar2",
        killicon = "weapon_l_g3sg1",
        bonemerge = true,
        keepdistance = 500,
        attackrange = 3000,

        clip = 20,
        tracername = "Tracer",
        damage = 20,
        spread = 0.15,
        rateoffire = 0.25,
        muzzleflash = 1,
        shelleject = "RifleShellEject",
        attackanim = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,
        attacksnd = "Weapon_G3SG1.Single",

        reloadtime = 3.5,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        reloadanimspeed = 0.60,
        reloadsounds = { 
            { 0.2, "Weapon_G3SG1.Clipout" },
            { 1.7, "Weapon_G3SG1.Clipin" },
            { 2.6, "Weapon_G3SG1.Slide" }
        },

        islethal = true,
    }

})