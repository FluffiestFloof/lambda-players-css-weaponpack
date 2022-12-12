local random = math.random
local CurTime = CurTime
local bullettbl = {}

table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_m4a1 = {
        model = "models/weapons/w_rif_m4a1.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "M4A1",
        holdtype = "ar2",
        killicon = "weapon_l_m4a1",
        bonemerge = true,
        keepdistance = 300,
        attackrange = 1600,
        offpos = Vector( 10, -1, -2 ),   
        offang = Angle( -10, 0, 0 ),

        clip = 30,

        reloadtime = 3.1,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_AR2,
        reloadanimspeed = 0.65,
        reloadsounds = { 
            { 0, "Weapon_M4A1.Clipout" },
            { 1.4, "Weapon_M4A1.Clipin" },
            { 2.5, "Weapon_M4A1.Boltpull" }
        },

        OnEquip = function( lambda, wepent )
            wepent.silenced = false
            wepent:EmitSound( "Weapon_M4A1.Deploy", 70, 100, 1, CHAN_WEAPON )
            lambda:SimpleTimer(0.4, function()
                if !IsValid( wepent ) then return false end
                wepent:EmitSound( "Weapon_M4A1.Boltpull", 70, 100, 1, CHAN_WEAPON )
            end)
            if random(10) == 1 then
                wepent.silenced = true
                wepent:SetModel( "models/weapons/w_rif_m4a1_silencer.mdl" )

            end
        end,

        callback = function( self, wepent, target )
            if self.l_Clip <= 0 then self:ReloadWeapon() return end

            self.l_WeaponUseCooldown = CurTime() + 0.10

            if wepent.silenced then
                wepent:EmitSound( "Weapon_M4A1.Silenced", 70, 100, 1, CHAN_WEAPON )
                self:HandleMuzzleFlash( 0 )
            else
                wepent:EmitSound( "Weapon_M4A1.Single", 70, 100, 1, CHAN_WEAPON )
                self:HandleMuzzleFlash( 1 )
            end

            self:RemoveGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 )
            self:AddGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 )
            
            self:HandleShellEject( "RifleShellEject" )

            bullettbl.Attacker = self
            bullettbl.Damage = 8
            bullettbl.Force = 8
            bullettbl.HullSize = 5
            bullettbl.Num = 1
            bullettbl.TracerName = "Tracer"
            bullettbl.Dir = ( target:WorldSpaceCenter() - wepent:GetPos() ):GetNormalized()
            bullettbl.Src = wepent:GetPos()
            bullettbl.Spread = Vector( 0.15, 0.15, 0 )
            bullettbl.IgnoreEntity = self

            self.l_Clip = self.l_Clip - 1

            wepent:FireBullets( bullettbl )

            return true
        end,

        islethal = true,
    }

})