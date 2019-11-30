@Rule "Rule 158"
@Event global
pauseMatchTime()


@Rule "| Teleport Phase 9 | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 9:
    do:
        eventPlayer.applyImpulse(vect(0, 1, 0), 1, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
        eventPlayer.Z = eventPlayer.getFacingDirection()
        eventPlayer.teleport(eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 10)
        eventPlayer.setFacing(eventPlayer.Z, Relativity.TO_WORLD)
        wait(0.125)
    while RULE_CONDITION


@Rule "| Balls Phase 9 | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 9:
    eventPlayer.Y = raycast(eventPlayer.getEyePosition(), eventPlayer.getEyePosition() + eventPlayer.getFacingDirection() * 100, include=null, exclude=eventPlayer, includePlayerObjects=true).getHitPosition()
    eventPlayer.X = nearestWalkablePosition(eventPlayer.X)
    destroyEffect(eventPlayer.V)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.GREEN, eventPlayer.Y, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.V = getLastCreatedEntity()
    destroyEffect(eventPlayer.W)
    createEffect(getAllPlayers(), Effect.SPHERE, Color.RED, eventPlayer.X, 0.5, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.W = getLastCreatedEntity()


@Rule "| CHANGE MODES | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_1) and eventPlayer.G > 0:
    if eventPlayer.H > 9:
        goto lbl_0
    eventPlayer.H++
    lbl_0:
    if eventPlayer.H < 10:
        goto lbl_1
    eventPlayer.H = 1
    lbl_1:


