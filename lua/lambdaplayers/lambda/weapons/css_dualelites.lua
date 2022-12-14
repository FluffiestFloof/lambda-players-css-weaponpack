local CurTime = CurTime
local random = math.random
local vector_origin = vector_origin
local Effect = util.Effect
local bulletInfo = {}

table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_dualelites = {
        model = "models/weapons/w_pist_elite.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "Dual Berettas",
        holdtype = "duel",
        killicon = "weapon_l_dualelites",
        bonemerge = true,
        keepdistance = 300,
        attackrange = 1800,

        clip = 30,

        reloadtime = 3.7,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_DUEL,
        reloadanimspeed = 1,

        OnEquip = function( lambda, wepent )
            wepent.GunSwitch = 0
            wepent:EmitSound( "Weapon_ELITE.Deploy", 70, 100, 1, CHAN_WEAPON )
        end,

        callback = function( self, wepent, target )
            if self.l_Clip <= 0 then self:ReloadWeapon() return end
            self.l_WeaponUseCooldown = CurTime() + 0.15
            wepent.GunSwitch = wepent.GunSwitch == 1 and 0 or 1

            if wepent.GunSwitch==0 then 
                wepent.muzzleAttach = wepent:GetAttachment(wepent:LookupAttachment("muzzle")) 
                wepent.shellAttach = wepent:GetAttachment(wepent:LookupAttachment("shell"))
            else
                wepent.muzzleAttach = wepent:GetAttachment(wepent:LookupAttachment("muzzle2")) 
                wepent.shellAttach = wepent:GetAttachment(wepent:LookupAttachment("shell2"))
            end

            self.l_WeaponUseCooldown = CurTime() + 0.15

            wepent:EmitSound( "Weapon_ELITE.Single", 70, 100, 1, CHAN_WEAPON )

            self:RemoveGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL )
            self:AddGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_DUEL )
            
            if wepent.shellAttach then
                local shellEject = EffectData()
                shellEject:SetOrigin( wepent.shellAttach.Pos )
                shellEject:SetAngles( wepent.shellAttach.Ang )
                shellEject:SetEntity( wepent )
                Effect("ShellEject", shellEject, tue)
            end
            if wepent.muzzleAttach then
                local muzzleFlash = EffectData()
                muzzleFlash:SetOrigin( wepent.muzzleAttach.Pos )
                muzzleFlash:SetStart( wepent.muzzleAttach.Pos )
                muzzleFlash:SetAngles( wepent.muzzleAttach.Ang )
                muzzleFlash:SetScale(0.5)
                muzzleFlash:SetEntity( wepent )
                Effect( "MuzzleEffect", muzzleFlash, true )
            end

            bulletInfo.Attacker = self
            bulletInfo.Damage = 7
            bulletInfo.Force = 7
            bulletInfo.HullSize = 5
            bulletInfo.Num = 1
            bulletInfo.TracerName = "Tracer"
            bulletInfo.Dir = ( target:WorldSpaceCenter() - wepent:GetPos() ):GetNormalized()
            bulletInfo.Src = wepent:GetPos()
            bulletInfo.Spread = Vector( 0.26, 0.26, 0 )
            bulletInfo.IgnoreEntity = self

            self.l_Clip = self.l_Clip - 1

            wepent:FireBullets( bulletInfo )

            return true
        end,

        islethal = true,
    }

})