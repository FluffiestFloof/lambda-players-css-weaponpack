local CurTime = CurTime
local bullettbl = {}

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

            bullettbl.Attacker = self
            bullettbl.Damage = 18
            bullettbl.Force = 18
            bullettbl.HullSize = 5
            bullettbl.Num = 1
            bullettbl.TracerName = "Tracer"
            bullettbl.Dir = ( target:WorldSpaceCenter() - wepent:GetPos() ):GetNormalized()
            bullettbl.Src = wepent:GetPos()
            bullettbl.Spread = Vector( 0.07, 0.07, 0 )
            bullettbl.IgnoreEntity = self
            wepent:FireBullets( bullettbl )

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