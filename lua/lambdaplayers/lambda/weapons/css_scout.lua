local CurTime = CurTime
local bulletInfo = {}

table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_scout = {
        model = "models/weapons/w_snip_scout.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "Schmidt Scout",
        holdtype = "ar2",
        killicon = "weapon_l_scout",
        bonemerge = true,
        keepdistance = 800,
        attackrange = 4500,
        addspeed = 10,
        offpos = Vector( 11, -1, -3 ),
        offang = Angle( -10, 0, 0 ),

        clip = 10,

        reloadtime = 2,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        reloadanimspeed = 1,
        reloadsounds = { 
            { 0.1, "Weapon_Scout.Clipout" },
            { 1.0, "Weapon_Scout.Clipin" },
            { 1.5, "Weapon_Scout.Bolt" }
        },

        callback = function( self, wepent, target )
            if self.l_Clip <= 0 then self:ReloadWeapon() return end

            self.l_WeaponUseCooldown = CurTime() + 1.5

            wepent:EmitSound( "Weapon_Scout.Single" )

            self:HandleMuzzleFlash( 1 )

            bulletInfo.Attacker = self
            bulletInfo.Damage = 18
            bulletInfo.Force = 18
            bulletInfo.HullSize = 5
            bulletInfo.Num = 1
            bulletInfo.TracerName = "Tracer"
            bulletInfo.Dir = ( target:WorldSpaceCenter() - wepent:GetPos() ):GetNormalized()
            bulletInfo.Src = wepent:GetPos()
            bulletInfo.Spread = Vector( 0.07, 0.07, 0 )
            bulletInfo.IgnoreEntity = self
            wepent:FireBullets( bulletInfo )

            self:RemoveGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 )
            self:AddGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 )
            
            self:SimpleTimer( 0.4, function()
                wepent:EmitSound( "Weapon_Scout.Bolt", 70, 100, 1, CHAN_WEAPON )
                self:HandleShellEject( "RifleShellEject" )
            end)

            self.l_Clip = self.l_Clip - 1

            return true
        end,

        islethal = true,
    }

})