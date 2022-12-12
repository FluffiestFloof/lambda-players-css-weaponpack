local random = math.random
local CurTime = CurTime
local bullettbl = {}

table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_famas = {
        model = "models/weapons/w_rif_famas.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "FAMAS",
        holdtype = "ar2",
        killicon = "weapon_l_famas",
        bonemerge = true,
        keepdistance = 300,
        attackrange = 1800,

        clip = 25,

        reloadtime = 3.3,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        reloadanimspeed = 0.65,
        reloadsounds = { 
            { 0.5, "Weapon_FAMAS.Clipout" },
            { 1.5, "Weapon_FAMAS.Clipin" },
            { 2.5, "Weapon_FAMAS.Forearm" }
        },

        OnEquip = function( lambda, wepent )
            wepent.burst = false
            if random(10) == 1 then
                wepent.burst = true
            end
        end,

        callback = function( self, wepent, target )
            if self.l_Clip <= 0 then self:ReloadWeapon() return end

            bullettbl.Attacker = self
            bullettbl.Damage = 7
            bullettbl.Force = 7
            bullettbl.HullSize = 5
            bullettbl.Num = 1
            bullettbl.TracerName = "Tracer"
            bullettbl.Dir = ( target:WorldSpaceCenter() - wepent:GetPos() ):GetNormalized()
            bullettbl.Src = wepent:GetPos()
            bullettbl.Spread = Vector( 0.11, 0.11, 0 )
            bullettbl.IgnoreEntity = self
            
            if wepent.burst and self.l_Clip >= 3 then
                self.l_WeaponUseCooldown = CurTime() + 0.5

                self:SimpleTimer(0.075, function()
                    wepent:EmitSound( "Weapon_FAMAS.Single", 70, 100, 1, CHAN_WEAPON )
                    self:HandleMuzzleFlash( 1 )
                    self:HandleShellEject( "RifleShellEject", Vector( 10, 0, 0 ), Angle( 180, 0, 0 ) )
                    bullettbl.Src = wepent:GetPos()
                    wepent:FireBullets( bullettbl )
                end)
                
                self:SimpleTimer(0.15, function()
                    wepent:EmitSound( "Weapon_FAMAS.Single", 70, 100, 1, CHAN_WEAPON )
                    self:HandleMuzzleFlash( 1 )
                    self:HandleShellEject( "RifleShellEject", Vector( 10, 0, 0 ), Angle( 180, 0, 0 ) )
                    bullettbl.Src = wepent:GetPos()
                    wepent:FireBullets( bullettbl )
                end)

                self.l_Clip = self.l_Clip - 3
            else
                self.l_WeaponUseCooldown = CurTime() + 0.09

                self.l_Clip = self.l_Clip - 1
            end

            wepent:EmitSound( "Weapon_FAMAS.Single", 70, 100, 1, CHAN_WEAPON )

            self:RemoveGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 )
            self:AddGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 )
            
            self:HandleMuzzleFlash( 1 )
            self:HandleShellEject( "RifleShellEject", Vector( 10, 0, 0 ), Angle( 180, 0, 0 ) )

            wepent:FireBullets( bullettbl )

            return true
        end,

        islethal = true,
    }

})