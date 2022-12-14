local CurTime = CurTime
local bulletInfo = {}

table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_awp = {
        model = "models/weapons/w_snip_awp.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "AWP",
        holdtype = "ar2",
        killicon = "weapon_l_awp",
        bonemerge = true,
        keepdistance = 900,
        attackrange = 5000,
        addspeed = -50,
        offpos = Vector( 11, -1, -3 ),   
        offang = Angle( -10, 0, 0 ),

        clip = 10,

        reloadtime = 3.7,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        reloadanimspeed = 0.65,
        reloadsounds = { 
            { 0.2, "Weapon_AWP.Clipout" },
            { 1.4, "Weapon_AWP.Clipin" },
            { 2.4, "Weapon_AWP.Bolt" }
        },

        callback = function( self, wepent, target )
            if self.l_Clip <= 0 then self:ReloadWeapon() return end

            self.l_WeaponUseCooldown = CurTime() + 1.9

            wepent:EmitSound( "Weapon_AWP.Single" )

            self:HandleMuzzleFlash( 1 )

            bulletInfo.Attacker = self
            bulletInfo.Damage = 35
            bulletInfo.Force = 35
            bulletInfo.HullSize = 5
            bulletInfo.Num = 1
            bulletInfo.TracerName = "Tracer"
            bulletInfo.Dir = ( target:WorldSpaceCenter() - wepent:GetPos() ):GetNormalized()
            bulletInfo.Src = wepent:GetPos()
            bulletInfo.Spread = Vector( 0.06, 0.06, 0 )
            bulletInfo.IgnoreEntity = self
            wepent:FireBullets( bulletInfo )

            self:RemoveGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 )
            self:AddGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 )
            
            self:SimpleTimer( 0.5, function()
                wepent:EmitSound( "Weapon_AWP.Bolt", 70, 100, 1, CHAN_WEAPON )
                wepent:EmitSound( "Weapon_Scout.Bolt", 70, 100, 1, CHAN_WEAPON )
                self:HandleShellEject( "RifleShellEject" )
            end)

            self.l_Clip = self.l_Clip - 1

            return true
        end,

        islethal = true,
    }

})