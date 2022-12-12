table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_sg552 = {
        model = "models/weapons/w_rif_sg552.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "SG552",
        holdtype = "ar2",
        killicon = "weapon_l_sg552",
        bonemerge = true,
        keepdistance = 600,
        attackrange = 2500,

        clip = 30,
        tracername = "Tracer",
        damage = 9,
        spread = 0.08,
        rateoffire = 0.10,
        muzzleflash = 1,
        shelleject = "RifleShellEject",
        shelloffpos = Vector( 5, 0, -2 ),
        attackanim = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2,
        attacksnd = "Weapon_SG552.Single",

        reloadtime = 2.9,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        reloadanimspeed = 0.8,
        reloadsounds = { 
            { 0, "Weapon_SG552.Clipout" },
            { 1, "Weapon_SG552.Clipin" },
            { 1.8, "Weapon_SG552.BoltPull" }
        },

        OnEquip = function( lambda, wepent )
            wepent:EmitSound( "Weapon_SG552.Boltpull", 70, 100, 1, CHAN_WEAPON )
        end,

        islethal = true,
    }

})