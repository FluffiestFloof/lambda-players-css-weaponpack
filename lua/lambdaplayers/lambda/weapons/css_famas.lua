local random = math.random
local CurTime = CurTime
local bulletInfo = {
    Damage = 7,
    Force = 7,
    HullSize = 5,
    Num = 1,
    TracerName = "Tracer",
    Spread = Vector( 0.11, 0.11, 0 )
}

local function ShootGun( lambda, wepent )
    bulletInfo.Attacker = lambda
    bulletInfo.Src = wepent:GetPos()
    bulletInfo.IgnoreEntity = lambda

    wepent:EmitSound( "Weapon_FAMAS.Single", 70, 100, 1, CHAN_WEAPON )
    lambda:HandleMuzzleFlash( 1 )
    lambda:HandleShellEject( "RifleShellEject", Vector( 10, 0, 0 ), Angle( 180, 0, 0 ) )
    wepent:FireBullets( bulletInfo )
    
    lambda.l_Clip = lambda.l_Clip - 1
end

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

            bulletInfo.Dir = ( target:WorldSpaceCenter() - wepent:GetPos() ):GetNormalized()

            ShootGun( self, wepent )
            
            if wepent.burst then
                self.l_WeaponUseCooldown = CurTime() + 0.5

                self:SimpleTimer(0.075, function()
                    ShootGun( self, wepent)
                end)
                
                self:SimpleTimer(0.15, function()
                    ShootGun( self, wepent )
                end)
            else
                self.l_WeaponUseCooldown = CurTime() + 0.09
            end

            self:RemoveGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 )
            self:AddGesture( ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 )

            return true
        end,

        islethal = true,
    }

})