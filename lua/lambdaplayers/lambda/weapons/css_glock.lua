local random = math.random
local CurTime = CurTime
local bulletInfo = {
    Damage = 6,
    Force = 6,
    HullSize = 5,
    Num = 1,
    TracerName = "Tracer",
    Spread = Vector( 0.16, 0.16, 0 )
}

local function ShootGun( lambda, wepent )
    bulletInfo.Attacker = lambda
    bulletInfo.Src = wepent:GetPos()
    bulletInfo.IgnoreEntity = lambda

    wepent:EmitSound( "Weapon_Glock.Single", 70, 100, 1, CHAN_WEAPON )
    lambda:HandleMuzzleFlash( 1 )
    lambda:HandleShellEject( "ShellEject" )
    wepent:FireBullets( bulletInfo )
    
    lambda.l_Clip = lambda.l_Clip - 1
end

table.Merge( _LAMBDAPLAYERSWEAPONS, {

    css_glock = {
        model = "models/weapons/w_pist_glock18.mdl",
        origin = "Counter-Strike: Source",
        prettyname = "Glock 18",
        holdtype = "pistol",
        killicon = "weapon_l_glock",
        bonemerge = true,
        keepdistance = 325,
        attackrange = 2000,

        clip = 20,

        reloadtime = 2.3,
        reloadanim = ACT_HL2MP_GESTURE_RELOAD_PISTOL,
        reloadanimspeed = 0.85,
        reloadsounds = { 
            { 0, "Weapon_Glock.Slideback" },
            { 0.4, "Weapon_Glock.Clipout" },
            { 1.3, "Weapon_Glock.Clipin" },
            { 2, "Weapon_Glock.Sliderelease" }
        },

        OnEquip = function( lambda, wepent )
            wepent.burst = false
            wepent:EmitSound( "Weapon_Glock.Slideback", 70, 100, 1, CHAN_WEAPON )
            if random(10) == 1 then
                wepent.burst = true
            end
        end,

        callback = function( self, wepent, target )
            if self.l_Clip <= 0 then self:ReloadWeapon() return end

            bulletInfo.Dir = ( target:WorldSpaceCenter() - wepent:GetPos() ):GetNormalized()

            ShootGun( self, wepent )
            
            if wepent.burst then
                self.l_WeaponUseCooldown = CurTime() + 0.5

                self:SimpleTimer(0.05, function()
                    ShootGun( self, wepent )
                end)
                
                    self:SimpleTimer(0.1, function()
                        if self.l_Clip >= 1 then -- Just to prevent shooting a third bullet when on last two.
                            ShootGun( self, wepent )
                        end
                    end)
            else
                self.l_WeaponUseCooldown = CurTime() + 0.15
            end

            self:RemoveGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL )
            self:AddGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL )

            return true
        end,

        islethal = true,
    }

})