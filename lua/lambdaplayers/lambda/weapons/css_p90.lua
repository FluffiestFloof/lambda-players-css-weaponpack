table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_p90 = {
        model = "models/weapons/w_smg_p90.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "P90",
        holdtype = "smg",
        killicon = "weapon_l_p90",
        bonemerge = true,
        keepdistance = 400,
        attackrange = 2100,
        offpos = Vector( 4, -1, -3 ),   
        offang = Angle( -10, 0, 0 ),

        clip = 50,
        tracername = "Tracer",
        damage = 7,
        spread = 0.10,
        rateoffire = 0.07,
        muzzleflash = 1,
        shelleject = "ShellEject",
        shelloffpos = Vector( 0, 0, -5 ),
        shelloffang = Angle( 90, 0, 90 ),
        attackanim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1,
        attacksnd = "Weapon_P90.Single",

        reloadtime = 3.3,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        reloadanimspeed = 0.7,
        reloadsounds = { 
            { 0, "Weapon_P90.Cliprelease" },
            { 0.5, "Weapon_P90.Clipout" },
            { 1.7, "Weapon_P90.Clipin" },
            { 2.5, "Weapon_P90.BoltPull" }
        },

        OnEquip = function( lambda, wepent )
            wepent:EmitSound( "Weapon_P90.BoltPull", 70, 100, 1, CHAN_WEAPON )
        end,

        islethal = true,
    }

})