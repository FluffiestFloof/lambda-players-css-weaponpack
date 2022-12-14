local random = math.random
local CurTime = CurTime
local bulletInfo = {}

table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_usp = {
        model = "models/weapons/w_pist_usp.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "USP-45",
        holdtype = "pistol",
        killicon = "weapon_l_usp",
        bonemerge = true,
        keepdistance = 350,
        attackrange = 2000,

        clip = 12,

        reloadtime = 2.7,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        reloadanimspeed = 0.8,
        reloadsounds = { 
            { 0, "Weapon_USP.Slideback2" },
            { 0.4, "Weapon_USP.Clipout" },
            { 1.3, "Weapon_USP.Clipin" },
            { 2, "Weapon_USP.Sliderelease" }
        },

        OnEquip = function( lambda, wepent )
            wepent.silenced = false
            wepent:EmitSound( "Weapon_USP.Slideback", 70, 100, 1, CHAN_WEAPON )
            if random(10) == 1 then
                wepent.silenced = true
                wepent:SetModel( "models/weapons/w_pist_usp_silencer.mdl" )
            end
        end,

        callback = function( self, wepent, target )
            if self.l_Clip <= 0 then self:ReloadWeapon() return end

            self.l_WeaponUseCooldown = CurTime() + 0.18

            if wepent.silenced then
                wepent:EmitSound( "Weapon_USP.SilencedShot", 70, 100, 1, CHAN_WEAPON )
                self:HandleMuzzleFlash( 0 )
            else
                wepent:EmitSound( "Weapon_USP.Single", 70, 100, 1, CHAN_WEAPON )
                self:HandleMuzzleFlash( 1 )
            end

            self:RemoveGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL )
            self:AddGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL )
            
            self:HandleShellEject( "ShellEject" )

            bulletInfo.Attacker = self
            bulletInfo.Damage = 11
            bulletInfo.Force = 11
            bulletInfo.HullSize = 5
            bulletInfo.Num = 1
            bulletInfo.TracerName = "Tracer"
            bulletInfo.Dir = ( target:WorldSpaceCenter() - wepent:GetPos() ):GetNormalized()
            bulletInfo.Src = wepent:GetPos()
            bulletInfo.Spread = Vector( 0.14, 0.14, 0 )
            bulletInfo.IgnoreEntity = self

            self.l_Clip = self.l_Clip - 1

            wepent:FireBullets( bulletInfo )

            return true
        end,

        islethal = true,
    }

})