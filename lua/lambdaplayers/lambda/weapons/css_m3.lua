local CurTime = CurTime
local bulletInfo = {}

table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_m3 = {
        model = "models/weapons/w_shot_m3super90.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "M3",
        holdtype = "shotgun",
        killicon = "weapon_l_m3",
        bonemerge = true,
        keepdistance = 250,
        attackrange = 750,
        offpos = Vector( 10, -0.5, -2.5 ),
        offang = Angle( -5, 0, 0 ),

        clip = 8,

        reloadtime = 4,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        reloadanimspeed = 0.7,

        OnEquip = function( lambda, wepent )
            wepent:EmitSound( "Weapon_M3.Pump", 70, 100, 1, CHAN_WEAPON )
        end,

        callback = function( self, wepent, target )
            if self.l_Clip <= 0 then self:ReloadWeapon() return end

            self.l_WeaponUseCooldown = CurTime() + 0.88

            wepent:EmitSound( "Weapon_M3.Single", 70, 100, 1, CHAN_WEAPON )

            self:HandleMuzzleFlash( 1 )

            bulletInfo.Attacker = self
            bulletInfo.Damage = 6
            bulletInfo.Force = 6
            bulletInfo.HullSize = 5
            bulletInfo.Num = 9
            bulletInfo.TracerName = "Tracer"
            bulletInfo.Dir = ( target:WorldSpaceCenter() - wepent:GetPos() ):GetNormalized()
            bulletInfo.Src = wepent:GetPos()
            bulletInfo.Spread = Vector( 0.15, 0.15, 0 )
            bulletInfo.IgnoreEntity = self
            wepent:FireBullets( bulletInfo )

            self:RemoveGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN )
            self:AddGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN )
            
            -- To simulate pump action after the shot
            self:SimpleTimer( 0.4, function()
                wepent:EmitSound( "Weapon_M3.Pump", 70, 100, 1, CHAN_WEAPON )
                self:HandleShellEject( "ShotgunShellEject" )
            end)

            self.l_Clip = self.l_Clip - 1

            return true
        end,

        islethal = true,
    }

})