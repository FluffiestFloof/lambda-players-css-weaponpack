table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_tmp = {
        model = "models/weapons/w_smg_tmp.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "TMP",
        holdtype = "smg",
        killicon = "weapon_l_tmp",
        bonemerge = true,
        keepdistance = 400,
        attackrange = 2100,
        offpos = Vector( 3, 0, -3 ),

        clip = 30,
        tracername = "Tracer",
        damage = 5,
        spread = 0.10,
        rateoffire = 0.07,
        muzzleflash = 0,
        shelleject = "ShellEject",
        attackanim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1,
        attacksnd = "Weapon_TMP.Single",

        reloadtime = 2.1,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_SMG1,
        reloadanimspeed = 1,
        reloadsounds = { 
            { 0.2, "Weapon_TMP.Clipout" },
            { 1.2, "Weapon_TMP.Clipin" }
        },

        islethal = true,
    }

})