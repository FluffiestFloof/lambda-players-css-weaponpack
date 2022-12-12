table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_xm1014 = {
        model = "models/weapons/w_shot_xm1014.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "XM1014",
        holdtype = "shotgun",
        killicon = "weapon_l_xm1014",
        bonemerge = true,
        keepdistance = 200,
        attackrange = 1000,
        offpos = Vector( 11, -1.5, -2 ),   
        offang = Angle( -5, 0, 0 ),

        clip = 7,
        tracername = "Tracer",
        damage = 6,
        bulletcount = 6,
        spread = 0.08,
        rateoffire = 0.25,
        muzzleflash = 1,
        shelleject = "ShotgunShellEject",
        attackanim = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN,
        attacksnd = "Weapon_XM1014.Single",

        reloadtime = 3,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        reloadanimspeed = 1,

        OnEquip = function( lambda, wepent )
            wepent:EmitSound( "Weapon_DEagle.Deploy", 70, 100, 1, CHAN_WEAPON )
        end,

        islethal = true,
    }

})