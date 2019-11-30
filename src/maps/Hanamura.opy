"""@Rule "|-------------------------------------------------------------------------------| START SETTINGS"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| INFINITE ULT USING FOR NOT MODER/LEADER | [ONLY ANA,BAPTISTE,MCCREE,ORISA] / P.VARS: G /"
@Event eachPlayer
if (eventPlayer.getCurrentHero() == Hero.ANA or eventPlayer.getCurrentHero() == Hero.BAPTISTE or eventPlayer.getCurrentHero() == Hero.MCCREE or eventPlayer.getCurrentHero() == Hero.ORISA) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.G == 0:
    eventPlayer.setUltCharge(100)


@Rule "| TEXTS AND JUMP | / P.VARS: C,B,F,G /"
@Event eachPlayer
hudHeader(eventPlayer, l"In View: {}".format(eventPlayer.C), Position.LEFT, 2, Color.WHITE, HudReeval.STRING)
hudHeader(eventPlayer, l"Speed: {}".format(eventPlayer.F), Position.LEFT, 3, Color.WHITE, HudReeval.STRING)
createInWorldText([player for player in getAllPlayers() if player.G > 0], l"{}: {}".format(heroIcon(eventPlayer.getCurrentHero()), eventPlayer), eventPlayer + vect(0, eventPlayer.B + 0.4, 0), 1.1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
eventPlayer.disallowButton(Button.JUMP)


@Rule "| TEXTS WHEN NOT INVISIBILITY | / P.VARS: M /"
@Event eachPlayer
if eventPlayer.M == 0:
    eventPlayer.setInvisibility(Invis.NONE)
    createInWorldText(getAllPlayers(), l"In View: {}".format(eventPlayer.C), eventPlayer + vect(0, eventPlayer.B + -0.2, 0), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.J[0] = getLastCreatedText()
    createInWorldText(getAllPlayers(), l"Speed: {}".format(eventPlayer.F), eventPlayer + vect(0, eventPlayer.B + -0.1, 0), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.J[1] = getLastCreatedText()


@Rule "| RISE |"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.JUMP) and not eventPlayer.hasStatusEffect(Status.KNOCKED_DOWN) and not eventPlayer.hasStatusEffect(Status.ASLEEP) and not eventPlayer.hasStatusEffect(Status.FROZEN) and not eventPlayer.hasStatusEffect(Status.ROOTED) and not eventPlayer.hasStatusEffect(Status.STUNNED):
    do:
        wait(0.02)
        eventPlayer.applyImpulse(Vector.UP, 4, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    while RULE_CONDITION


@Rule "/ P.VARS: A,C,F /"
@Event eachPlayer
if getPlayersInSlot(0, Color.TEAM_1) != eventPlayer:
    eventPlayer.A = 1
    eventPlayer.C = 1
    eventPlayer.F = 100


"""@Rule "|____________________ [POSITIONS OF TEXTS/EFFECTS FOR HEROES] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| TRACER,HANZO,PHARAH,SYMMETRA,GENJI,MCCREE,JUNKRAT,LUCIO,MEI,SOMBRA,DOOMFIST,ANA,ASHE,BAPTISTE | / P.VARS: B /"
@Event eachPlayer
if (eventPlayer.getCurrentHero() == Hero.TRACER or eventPlayer.getCurrentHero() == Hero.HANZO or eventPlayer.getCurrentHero() == Hero.PHARAH or eventPlayer.getCurrentHero() == Hero.SYMMETRA or eventPlayer.getCurrentHero() == Hero.GENJI or eventPlayer.getCurrentHero() == Hero.MCCREE or eventPlayer.getCurrentHero() == Hero.JUNKRAT or eventPlayer.getCurrentHero() == Hero.LUCIO or eventPlayer.getCurrentHero() == Hero.MEI or eventPlayer.getCurrentHero() == Hero.SOMBRA or eventPlayer.getCurrentHero() == Hero.DOOMFIST or eventPlayer.getCurrentHero() == Hero.ANA or eventPlayer.getCurrentHero() == Hero.ASHE or eventPlayer.getCurrentHero() == Hero.BAPTISTE):
    eventPlayer.B = 1.8


@Rule "| REINHARDT,WINSTON,BASTION,ROADHOG,ZARYA,ORISA,WRECKING BALL | / P.VARS: B /"
@Event eachPlayer
if (eventPlayer.getCurrentHero() == Hero.REINHARDT or eventPlayer.getCurrentHero() == Hero.WINSTON or eventPlayer.getCurrentHero() == Hero.BASTION or eventPlayer.getCurrentHero() == Hero.ROADHOG or eventPlayer.getCurrentHero() == Hero.ZARYA or eventPlayer.getCurrentHero() == Hero.ORISA or eventPlayer.getCurrentHero() == Hero.HAMMOND):
    eventPlayer.B = 2.2


@Rule "| REAPER,MERCY,WIDOWMAKER,ZENYATTA,SOLDIER: 76,BRIGITTE,MOIRA | / P.VARS: B /"
@Event eachPlayer
if (eventPlayer.getCurrentHero() == Hero.REAPER or eventPlayer.getCurrentHero() == Hero.MERCY or eventPlayer.getCurrentHero() == Hero.WIDOWMAKER or eventPlayer.getCurrentHero() == Hero.ZENYATTA or eventPlayer.getCurrentHero() == Hero.SOLDIER or eventPlayer.getCurrentHero() == Hero.BRIGITTE or eventPlayer.getCurrentHero() == Hero.MOIRA):
    eventPlayer.B = 2


@Rule "| SIGMA | / P.VARS: B /"
@Event eachPlayer
if eventPlayer.getCurrentHero() == Hero.SIGMA:
    eventPlayer.B = 2.6


@Rule "| TORBJORN | / P.VARS: B /"
@Event eachPlayer
if eventPlayer.getCurrentHero() == Hero.TORBJORN:
    eventPlayer.B = 1.6


@Rule "| D.VA | / P.VARS: B /"
@Event eachPlayer
if eventPlayer.getCurrentHero() == Hero.DVA and eventPlayer.getMaxHealth() == abs(600):
    eventPlayer.B = 2.2


@Rule "| BABY D.VA | / P.VARS: B /"
@Event eachPlayer
if eventPlayer.getCurrentHero() == Hero.DVA and eventPlayer.getMaxHealth() == abs(150):
    eventPlayer.B = 1.8


"""@Rule "|-----------------------------------------------------------------------------------| TELEPORTS"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| EFFECTS |"
@Event global
createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.WHITE, vect(-32.595, 2.443, -100.815), 1, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.WHITE, vect(82.079, -1.557, -4.038), 1, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.WHITE, vect(-9.992, 2.444, -6.94), 1, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.WHITE, vect(-13.453, 0.522, -95.036), 1, IconReeval.VISIBILITY)


@Rule "| FROM SPAWN |"
@Event eachPlayer
if (distance(eventPlayer, vect(-32.595, 2.443, -100.815)) <= 1.8 or distance(eventPlayer, vect(82.079, -1.557, -4.038)) <= 1.8):
    eventPlayer.teleport(vect(13.43, 1.1, -4.367))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.WHITE, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.WHITE, eventPlayer, 4)


@Rule "| TO LAST POINT |"
@Event eachPlayer
if distance(eventPlayer, vect(-9.992, 2.444, -6.94)) <= 1.8:
    eventPlayer.teleport(vect(-16.676, -0.6, -90.496))
    eventPlayer.setFacing(vectorTowards(vect(-16.676, 0.693, -90.496), vect(-16.118, 0.693, -89.938)), Relativity.TO_WORLD)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.WHITE, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.WHITE, eventPlayer, 4)


@Rule "| FROM LAST POINT |"
@Event eachPlayer
if distance(eventPlayer, vect(-13.453, 0.522, -95.036)) <= 1.8:
    eventPlayer.teleport(vect(13.43, 1.1, -4.367))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.WHITE, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.WHITE, eventPlayer, 4)


"""@Rule "|____________________ [SOUNDS] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| FROM SPAWN |"
@Event global
if (any([distance(player, vect(-32.595, 2.443, -100.815)) <= 1.8 or distance(player, vect(82.079, -1.557, -4.038)) <= 1.8 for player in getAllPlayers()])):
    wait(0.06)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(13.43, 2.437, -4.367), 80)


@Rule "| TO LAST POINT |"
@Event global
if any([distance(player, vect(-9.992, 2.444, -6.94)) <= 1.8 for player in getAllPlayers()]):
    wait(0.06)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(-16.676, 0.693, -90.496), 80)


@Rule "| FROM LAST POINT |"
@Event global
if any([distance(player, vect(-13.453, 0.522, -95.036)) <= 1.8 for player in getAllPlayers()]):
    wait(0.06)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(13.43, 2.437, -4.367), 80)


"""@Rule "|--------------------------------------------------------------------------------| ENTER PLACES"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| EFFECTS |"
@Event global
createEffect(getAllPlayers(), Effect.RING, Color.BLUE, vect(14.03, 1.444, 9.431), 0.8, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.RING, Color.RED, vect(14.016, 0.93, 12.324), 0.8, IconReeval.VISIBILITY)
createInWorldText(getAllPlayers(), l"Inside", vect(14.03, 1.444, 9.431), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
createInWorldText(getAllPlayers(), l"Outside", vect(14.016, 0.931, 12.324), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
createEffect(getAllPlayers(), Effect.RING, Color.BLUE, vect(-14.067, 0.444, 9.848), 0.8, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.RING, Color.RED, vect(-14.073, 0.444, 12.764), 0.8, IconReeval.VISIBILITY)
createInWorldText(getAllPlayers(), l"Inside", vect(-14.067, 0.444, 9.848), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
createInWorldText(getAllPlayers(), l"Outside", vect(-14.073, 0.444, 12.764), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
createEffect(getPlayers(Color.TEAM_2), Effect.RING, Color.BLUE, vect(-39.268, 2.443, -87.678), 0.8, IconReeval.VISIBILITY)
createEffect(getPlayers(Color.TEAM_2), Effect.RING, Color.RED, vect(-40.907, 2.443, -89.344), 0.8, IconReeval.VISIBILITY)
createInWorldText(getPlayers(Color.TEAM_2), l"Inside", vect(-39.268, 2.443, -87.678), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
createInWorldText(getPlayers(Color.TEAM_2), l"Outside", vect(-40.907, 2.443, -89.344), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
createEffect(getPlayers(Color.TEAM_1), Effect.RING, Color.BLUE, vect(72.278, -0.52, -0.009), 0.8, IconReeval.VISIBILITY)
createEffect(getPlayers(Color.TEAM_1), Effect.RING, Color.RED, vect(76.036, -0.556, -0.01), 0.8, IconReeval.VISIBILITY)
createInWorldText(getPlayers(Color.TEAM_1), l"Inside", vect(72.278, -0.52, -0.009), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
createInWorldText(getPlayers(Color.TEAM_1), l"Outside", vect(76.036, -0.556, -0.01), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)


@Rule "| ENTER BUILIDING 1 |"
@Event eachPlayer
if distance(eventPlayer, vect(14.03, 1.444, 9.431)) <= 1.55:
    eventPlayer.teleport(vect(14.01, -0.956, 14.373))
    smallMessage(eventPlayer, l"Inside")


@Rule "| EXIT BUILIDING 1 |"
@Event eachPlayer
if distance(eventPlayer, vect(14.016, 0.4, 12.324)) <= 1.55:
    eventPlayer.teleport(vect(14.037, 0.1, 7.149))
    smallMessage(eventPlayer, l"Outside")


@Rule "| ENTER BUILIDING 1 (2) |"
@Event eachPlayer
if distance(eventPlayer, vect(-14.067, 0.444, 9.848)) <= 1.55:
    eventPlayer.teleport(vect(-14.088, -0.956, 14.733))
    smallMessage(eventPlayer, l"Inside")


@Rule "| EXIT BUILIDING 1 (2) |"
@Event eachPlayer
if distance(eventPlayer, vect(-14.073, 0.444, 12.764)) <= 1.55:
    eventPlayer.teleport(vect(-14.083, 0.5, 8.034))
    smallMessage(eventPlayer, l"Outside")


@Rule "| ENTER TEAM 1 SPAWN |"
@Event eachPlayer
if distance(eventPlayer, vect(-39.268, 2.443, -87.678)) <= 1.55 and eventPlayer.getTeam() == Color.TEAM_2:
    eventPlayer.teleport(vect(-42.398, 1.1, -90.829))
    smallMessage(eventPlayer, l"Inside")


@Rule "| EXIT TEAM 1 SPAWN |"
@Event eachPlayer
if distance(eventPlayer, vect(-40.907, 2.443, -89.344)) <= 1.55 and eventPlayer.getTeam() == Color.TEAM_2:
    eventPlayer.teleport(vect(-37.871, 1.1, -86.282))
    smallMessage(eventPlayer, l"Outside")


@Rule "| ENTER TEAM 2 SPAWN |"
@Event eachPlayer
if distance(eventPlayer, vect(72.278, -0.52, -0.009)) <= 1.55 and eventPlayer.getTeam() == Color.TEAM_1:
    eventPlayer.teleport(vect(78.038, -1.8, 0.011))
    smallMessage(eventPlayer, l"Inside")


@Rule "| EXIT TEAM 2 SPAWN |"
@Event eachPlayer
if distance(eventPlayer, vect(76.036, -0.556, -0.01)) <= 1.55 and eventPlayer.getTeam() == Color.TEAM_1:
    eventPlayer.teleport(vect(70.071, -1.8, -0.071))
    smallMessage(eventPlayer, l"Outside")


"""@Rule "|---------------------------------------------------------------------------------| DANCE FLOOR"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| EFFECTS | / G.VARS: A /"
@Event global
createEffect(getAllPlayers(), Effect.BAD_AURA, Color.PURPLE, vect(-4.294, 3.166, 0.473), 3, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.SPARKLES, Color.RED, vect(-4.294, 7.5, 0.473), 9, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.SPARKLES, Color.PURPLE, vect(-4.294, 5.5, 0.473), 9, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.SPARKLES, Color.GREEN, vect(-4.294, 3.5, 0.473), 9, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.SPARKLES, Color.YELLOW, vect(-4.294, 1.5, 0.473), 9, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.RING, Color.PURPLE, vect(-4.294, 1.5, 0.473), A, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.PURPLE, vect(-4.294, -17, 0.473), A, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


@Rule "| LOOP EFFECTS |"
@Event global
do:
    wait(0.365)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.YELLOW, vect(-4.294, 1.6, 0.473), 14)
    wait(0.365)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(-4.294, 1.6, 0.473), 15)
    wait(0.365)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.PURPLE, vect(-4.294, 1.6, 0.473), 16)
    wait(0.365)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(-4.294, 1.6, 0.473), 17)
while true


@Rule "| CHASE G.VAR A | / G.VARS: A /"
@Event global
do:
    wait(3)
    chase(A, 8.5, duration=3, ChaseReeval.DESTINATION_AND_DURATION)
    wait(3)
    chase(A, 2, duration=3, ChaseReeval.DESTINATION_AND_DURATION)
while true


"""@Rule "|--------------------------------------------------------------------------------------| CAMERA"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| CHANGE VIEW | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.INTERACT) and eventPlayer.C < 8 and eventPlayer.D == 0:
    eventPlayer.C++


@Rule "| FIRST PERSON | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.C == 8 and eventPlayer.D == 0:
    eventPlayer.C = 1


"""@Rule "|____________________ [VIEWS] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| VIEW 1 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.C == 1:
    eventPlayer.stopCamera()
    smallMessage(eventPlayer, l"In View 1")


@Rule "| VIEW 2 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.C == 2:
    eventPlayer.setCamera(eventPlayer.getFacingDirection() * -2 + eventPlayer + worldVector(vect(-1.2, 1.8, 0), eventPlayer, Transform.ROTATION), eventPlayer + eventPlayer.getFacingDirection() * 100, 0)
    smallMessage(eventPlayer, l"In View 2")


@Rule "| VIEW 3 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.C == 3:
    eventPlayer.setCamera(eventPlayer.getFacingDirection() * -3.5 + eventPlayer + vect(0, 2.1, 0), eventPlayer + eventPlayer.getFacingDirection() * 100, 0)
    smallMessage(eventPlayer, l"In View 3")


@Rule "| VIEW 4 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.C == 4:
    eventPlayer.setCamera(eventPlayer.getFacingDirection() * -3.5 + eventPlayer + vect(0, 2.1, 0), raycast(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * 100 + eventPlayer.getEyePosition(), include=null, exclude=getAllPlayers(), includePlayerObjects=false).getHitPosition(), 4)
    smallMessage(eventPlayer, l"In View 4")


@Rule "| VIEW 5 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.C == 5:
    eventPlayer.setCamera(vect(0, 10, 0) + eventPlayer, eventPlayer.getFacingDirection() * 4 + eventPlayer, 0)
    smallMessage(eventPlayer, l"In View 5")


@Rule "| VIEW 6 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.C == 6:
    eventPlayer.setCamera(eventPlayer.getFacingDirection() * 1.5 + eventPlayer + vect(0, 1.6, 0), eventPlayer + eventPlayer.getFacingDirection() * -100, 0)
    smallMessage(eventPlayer, l"In View 6")


@Rule "| BONUS VIEW | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.C == 7:
    eventPlayer.setCamera(eventPlayer.getFacingDirection() * -0.6 + eventPlayer + worldVector(vect(0.05, 0.85, 0), eventPlayer, Transform.ROTATION), eventPlayer + eventPlayer.getFacingDirection() * 100, 0)
    smallMessage(eventPlayer, l"In View ... Oops")


"""@Rule "|--------------------------------------------------------------------------------| LOOTBOX SIMULATOR"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| EFFECTS |"
@Event global
createEffect(getAllPlayers(), Effect.RING, Color.BLUE, vect(-8.983, 5.444, 14.951), 0.7, IconReeval.VISIBILITY)
createInWorldText(getAllPlayers(), l"Start", vect(-8.983, 4.044, 14.951), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)


@Rule "| START | / G.VARS: B,C,D /"
@Event eachPlayer
if distance(eventPlayer, vect(-8.983, 4.244, 14.951)) <= 0.675 and eventPlayer.isHoldingButton(Button.INTERACT) and B == 0:
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.BLUE, vect(-8.983, 4.044, 14.951), 1.45)
    destroyEffect(C[0])
    destroyEffect(C[1])
    destroyEffect(C[2])
    destroyEffect(C[3])
    destroyInWorldText(C[4])
    destroyInWorldText(C[5])
    destroyInWorldText(C[6])
    destroyInWorldText(C[7])
    D[0] = random.randint(1, 100)
    D[1] = random.randint(1, 5)
    D[2] = random.randint(1, 100)
    D[3] = random.randint(1, 5)
    D[4] = random.randint(1, 100)
    D[5] = random.randint(1, 5)
    D[6] = random.randint(1, 100)
    D[7] = random.randint(1, 5)
    wait(0.005)
    B = 1
    wait(4.5)
    B = 0


"""@Rule "|____________________ [SOUNDS] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "/ G.VARS: B /"
@Event global
if any([distance(player, vect(-8.983, 4.244, 14.951)) <= 0.675 for player in getAllPlayers()]) and any([i.isHoldingButton(Button.INTERACT) for i in [player for player in getAllPlayers() if distance(player, vect(-8.983, 4.244, 14.951)) <= 0.675]]) and B == 0:
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(-8.983, 4.244, 14.951), 80)


"""@Rule "|____________________ [DROPS] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| DROP 1 | / G.VARS: B,D,E,C,F /"
@Event global
if B == 1:
    wait(1)
    if D[0] > 2:
        goto lbl_0
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, vect(-10.435, 5.444, 12.998), 1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.YELLOW, vect(-10.435, 5.444, 12.998), 3)
    playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.YELLOW, vect(-10.435, 5.444, 12.998), 40)
    E[0] = 500
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, vect(-10.435, 3.944, 12.998), 0.4, IconReeval.VISIBILITY)
    lbl_0:
    if D[0] < 3 or D[0] > 15:
        goto lbl_1
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.PURPLE, vect(-10.435, 5.444, 12.998), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.PURPLE, vect(-10.435, 5.444, 12.998), 40)
    E[0] = 150
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.PURPLE, vect(-10.435, 3.944, 12.998), 0.4, IconReeval.VISIBILITY)
    lbl_1:
    if D[0] < 16 or D[0] > 44:
        goto lbl_2
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, vect(-10.435, 5.444, 12.998), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.BLUE, vect(-10.435, 5.444, 12.998), 40)
    E[0] = 50
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, vect(-10.435, 3.944, 12.998), 0.4, IconReeval.VISIBILITY)
    lbl_2:
    if D[0] < 45:
        goto lbl_3
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.WHITE, vect(-10.435, 5.444, 12.998), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, vect(-10.435, 5.444, 12.998), 40)
    E[0] = 15
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.WHITE, vect(-10.435, 3.944, 12.998), 0.4, IconReeval.VISIBILITY)
    lbl_3:
    C[0] = getLastCreatedEntity()
    if D[1] == 1:
        goto lbl_4
    F[0] = random.choice(getAllHeroes())
    createInWorldText(getAllPlayers(), heroIcon(F[0]), vect(-10.435, 5.444, 12.998), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    lbl_4:
    if D[1] > 1:
        goto lbl_5
    createInWorldText(getAllPlayers(), l"Credits: {}".format(E[0]), vect(-10.435, 5.444, 12.998), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    lbl_5:
    C[4] = getLastCreatedText()


@Rule "| DROP 2 | / G.VARS: B,D,E,C,F /"
@Event global
if B == 1:
    wait(1.75)
    if D[2] > 2:
        goto lbl_0
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, vect(-10.435, 5.444, 14.312), 1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.YELLOW, vect(-10.435, 5.444, 14.312), 3)
    playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.YELLOW, vect(-10.435, 5.444, 14.312), 40)
    E[1] = 500
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, vect(-10.435, 3.944, 14.312), 0.4, IconReeval.VISIBILITY)
    lbl_0:
    if D[2] < 3 or D[2] > 15:
        goto lbl_1
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.PURPLE, vect(-10.435, 5.444, 14.312), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.PURPLE, vect(-10.435, 5.444, 14.312), 40)
    E[1] = 150
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.PURPLE, vect(-10.435, 3.944, 14.312), 0.4, IconReeval.VISIBILITY)
    lbl_1:
    if D[2] < 16 or D[2] > 44:
        goto lbl_2
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, vect(-10.435, 5.444, 14.312), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.BLUE, vect(-10.435, 5.444, 14.312), 40)
    E[1] = 50
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, vect(-10.435, 3.944, 14.312), 0.4, IconReeval.VISIBILITY)
    lbl_2:
    if D[2] < 45:
        goto lbl_3
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.WHITE, vect(-10.435, 5.444, 14.312), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, vect(-10.435, 5.444, 14.312), 40)
    E[1] = 15
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.WHITE, vect(-10.435, 3.944, 14.312), 0.4, IconReeval.VISIBILITY)
    lbl_3:
    C[1] = getLastCreatedEntity()
    if D[3] == 1:
        goto lbl_4
    F[1] = random.choice(getAllHeroes())
    createInWorldText(getAllPlayers(), heroIcon(F[1]), vect(-10.435, 5.444, 14.312), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    lbl_4:
    if D[3] > 1:
        goto lbl_5
    createInWorldText(getAllPlayers(), l"Credits: {}".format(E[1]), vect(-10.435, 5.444, 14.312), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    lbl_5:
    C[5] = getLastCreatedText()


@Rule "| DROP 3 | / G.VARS: B,D,E,C,F /"
@Event global
if B == 1:
    wait(2.5)
    if D[4] > 2:
        goto lbl_0
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, vect(-10.435, 5.444, 15.626), 1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.YELLOW, vect(-10.435, 5.444, 15.626), 3)
    playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.YELLOW, vect(-10.435, 5.444, 15.626), 40)
    E[2] = 500
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, vect(-10.435, 3.944, 15.626), 0.4, IconReeval.VISIBILITY)
    lbl_0:
    if D[4] < 3 or D[4] > 15:
        goto lbl_1
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.PURPLE, vect(-10.435, 5.444, 15.626), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.PURPLE, vect(-10.435, 5.444, 15.626), 40)
    E[2] = 150
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.PURPLE, vect(-10.435, 3.944, 15.626), 0.4, IconReeval.VISIBILITY)
    lbl_1:
    if D[4] < 16 or D[4] > 44:
        goto lbl_2
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, vect(-10.435, 5.444, 15.626), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.BLUE, vect(-10.435, 5.444, 15.626), 40)
    E[2] = 50
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, vect(-10.435, 3.944, 15.626), 0.4, IconReeval.VISIBILITY)
    lbl_2:
    if D[4] < 45:
        goto lbl_3
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.WHITE, vect(-10.435, 5.444, 15.626), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, vect(-10.435, 5.444, 15.626), 40)
    E[2] = 15
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.WHITE, vect(-10.435, 3.944, 15.626), 0.4, IconReeval.VISIBILITY)
    lbl_3:
    C[2] = getLastCreatedEntity()
    if D[5] == 1:
        goto lbl_4
    F[2] = random.choice(getAllHeroes())
    createInWorldText(getAllPlayers(), heroIcon(F[2]), vect(-10.435, 5.444, 15.626), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    lbl_4:
    if D[5] > 1:
        goto lbl_5
    createInWorldText(getAllPlayers(), l"Credits: {}".format(E[2]), vect(-10.435, 5.444, 15.626), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    lbl_5:
    C[6] = getLastCreatedText()


@Rule "| DROP 4 | / G.VARS: B,D,E,C,F /"
@Event global
if B == 1:
    wait(3.25)
    if D[6] > 2:
        goto lbl_0
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, vect(-10.435, 5.444, 16.94), 1)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.YELLOW, vect(-10.435, 5.444, 16.94), 3)
    playEffect(getAllPlayers(), DynamicEffect.BUFF_IMPACT_SOUND, Color.YELLOW, vect(-10.435, 5.444, 16.94), 40)
    J[3] = 500
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.YELLOW, vect(-10.435, 3.944, 16.94), 0.4, IconReeval.VISIBILITY)
    lbl_0:
    if D[6] < 3 or D[6] > 15:
        goto lbl_1
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.PURPLE, vect(-10.435, 5.444, 16.94), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.PURPLE, vect(-10.435, 5.444, 16.94), 40)
    J[3] = 150
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.PURPLE, vect(-10.435, 3.944, 16.94), 0.4, IconReeval.VISIBILITY)
    lbl_1:
    if D[6] < 16 or D[6] > 44:
        goto lbl_2
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, vect(-10.435, 5.444, 16.94), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.BLUE, vect(-10.435, 5.444, 16.94), 40)
    J[3] = 50
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.BLUE, vect(-10.435, 3.944, 16.94), 0.4, IconReeval.VISIBILITY)
    lbl_2:
    if D[6] < 45:
        goto lbl_3
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.WHITE, vect(-10.435, 5.444, 16.94), 1)
    playEffect(getAllPlayers(), DynamicEffect.EXPLOSION_SOUND, Color.WHITE, vect(-10.435, 5.444, 16.94), 40)
    J[3] = 15
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.WHITE, vect(-10.435, 3.944, 16.94), 0.4, IconReeval.VISIBILITY)
    lbl_3:
    C[3] = getLastCreatedEntity()
    if D[7] == 1:
        goto lbl_4
    F[3] = random.choice(getAllHeroes())
    createInWorldText(getAllPlayers(), heroIcon(F[3]), vect(-10.435, 5.444, 16.94), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    lbl_4:
    if D[7] > 1:
        goto lbl_5
    createInWorldText(getAllPlayers(), l"Credits: {}".format(J[3]), vect(-10.435, 5.444, 16.94), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    lbl_5:
    C[7] = getLastCreatedText()


"""@Rule "|--------------------------------------------------------------------------------------| FORM"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| EFFECTS |"
@Event global
createEffect(getAllPlayers(), Effect.ORB, Color.BLUE, vect(-34.468, 1.694, -108.346), 0.5, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.ORB, Color.BLUE, vect(80.083, -1.556, 8.634), 0.5, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.ORB, Color.WHITE, vect(-40.169, 1.694, -102.732), 0.5, IconReeval.VISIBILITY)
createEffect(getAllPlayers(), Effect.ORB, Color.WHITE, vect(80.064, -1.556, 4.447), 0.5, IconReeval.VISIBILITY)
createInWorldText(getAllPlayers(), l"Innocent Form", vect(-34.468, 1.694, -108.346), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
createInWorldText(getAllPlayers(), l"Innocent Form", vect(80.083, -1.556, 8.634), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
createInWorldText(getAllPlayers(), l"Normal Form", vect(-40.169, 1.694, -102.732), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
createInWorldText(getAllPlayers(), l"Normal Form", vect(80.064, -1.556, 4.447), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)


"""@Rule "|____________________ [PICK FORM] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| INNOCENT | / P.VARS: G,A /"
@Event eachPlayer
if (distance(eventPlayer, vect(-34.468, 1.694, -108.346)) <= 1.5 or distance(eventPlayer, vect(80.083, -1.556, 8.634)) <= 1.5):
    if eventPlayer.A == 2 or eventPlayer.G > 0:
        goto lbl_0
    if eventPlayer.getCurrentHero() == Hero.DVA:
        goto lbl_1
    kill(eventPlayer, null)
    lbl_1:
    if eventPlayer.getCurrentHero() == Hero.LUCIO:
        goto lbl_2
    eventPlayer.respawn()
    lbl_2:
    eventPlayer.A = 2
    wait(0.05)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.BLUE, eventPlayer, 5)
    lbl_0:


@Rule "| NORMAL | / P.VARS: G,A /"
@Event eachPlayer
if (distance(eventPlayer, vect(-40.169, 1.694, -102.732)) <= 1.5 or distance(eventPlayer, vect(80.064, -1.556, 4.447)) <= 1.5):
    if eventPlayer.A == 1 or eventPlayer.G > 0:
        goto lbl_0
    if eventPlayer.getCurrentHero() == Hero.DVA:
        goto lbl_1
    kill(eventPlayer, null)
    lbl_1:
    eventPlayer.respawn()
    eventPlayer.A = 1
    wait(0.05)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.WHITE, eventPlayer, 5)
    lbl_0:


"""@Rule "|____________________ [HAVE FORM] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| INNOCENT | / P.VARS: A,J,B /"
@Event eachPlayer
if eventPlayer.A == 2:
    destroyHudText(eventPlayer.J[2])
    hudText(eventPlayer, l"Innocent", l"Form", null, Position.LEFT, 0, Color.BLUE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.J[2] = getLastCreatedText()
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.BLUE, eventPlayer + vect(0, eventPlayer.B + 0.175, 0), 0.15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.J[4] = getLastCreatedEntity()
    createInWorldText(getAllPlayers(), l"Innocent", eventPlayer + vect(0, eventPlayer.B, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.J[5] = getLastCreatedText()
    bigMessage(eventPlayer, l"Innocent Form")
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, getMatchTime())
    eventPlayer.setDamageDealt(0)
    eventPlayer.setHealingDealt(0)


@Rule "| NORMAL | / P.VARS: A,J /"
@Event eachPlayer
if eventPlayer.A == 1:
    if eventPlayer.G > 0:
        goto lbl_0
    destroyHudText(eventPlayer.J[2])
    destroyEffect(eventPlayer.J[4])
    destroyInWorldText(eventPlayer.J[5])
    hudText(eventPlayer, l"Normal", l"Form", null, Position.LEFT, 0, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.J[2] = getLastCreatedText()
    bigMessage(eventPlayer, l"Normal Form")
    eventPlayer.clearStatusEffect(Status.PHASED_OUT)
    eventPlayer.setDamageDealt(100)
    eventPlayer.setHealingDealt(100)
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)
    lbl_0:


@Rule "| LUCIO DIED | / P.VARS: A /"
@Event playerDied
if eventPlayer.A == 2 and eventPlayer.getCurrentHero() == Hero.LUCIO:
    eventPlayer.respawn()
    wait(0.3)
    eventPlayer.setAbility1Enabled(true)
    wait(0.065)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.3)
    eventPlayer.setAbility1Enabled(false)


"""@Rule "|____________________ [DISABLE ABILITIES] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| SIGMA | Ability1,Ability2,SecondaryFire,PrimaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and eventPlayer.getCurrentHero() == Hero.SIGMA:
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| LUCIO | Ability1 and Speedboost,SecondaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and eventPlayer.getCurrentHero() == Hero.LUCIO:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.forceButtonPress(Button.ABILITY_1)
    wait(0.05)
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| REINHARDT | Ability1,SecondaryFire,PrimaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and eventPlayer.getCurrentHero() == Hero.REINHARDT:
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| DOOMFIST,ZARYA | Ability1,Ability2,SecondaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and (eventPlayer.getCurrentHero() == Hero.DOOMFIST or eventPlayer.getCurrentHero() == Hero.ZARYA):
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| ANA,JUNKRAT | Ability1,Ability2,PrimaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and (eventPlayer.getCurrentHero() == Hero.ANA or eventPlayer.getCurrentHero() == Hero.JUNKRAT):
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(false)


@Rule "| BRIGITTE,D.VA | Ability1,SecondaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and (eventPlayer.getCurrentHero() == Hero.BRIGITTE or eventPlayer.getCurrentHero() == Hero.DVA):
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| BAPTISTE,ORISA | Ability2,SecondaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and (eventPlayer.getCurrentHero() == Hero.BAPTISTE or eventPlayer.getCurrentHero() == Hero.ORISA):
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| ASHE,MEI,SYMMETRA | Ability1,Ability2,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and (eventPlayer.getCurrentHero() == Hero.ASHE or eventPlayer.getCurrentHero() == Hero.MEI or eventPlayer.getCurrentHero() == Hero.SYMMETRA):
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(false)


@Rule "| WINSTON | Ability1,Ability2,PrimaryFire / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and eventPlayer.getCurrentHero() == Hero.WINSTON:
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)


@Rule "| MERCY | Ability2,SecondaryFire / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and eventPlayer.getCurrentHero() == Hero.MERCY:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(true)


@Rule "| PHARAH,MOIRA | Ability2,PrimaryFire / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and (eventPlayer.getCurrentHero() == Hero.PHARAH or eventPlayer.getCurrentHero() == Hero.MOIRA):
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)


@Rule "| SOMBRA,WRECKING BALL | SecondaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and (eventPlayer.getCurrentHero() == Hero.SOMBRA or eventPlayer.getCurrentHero() == Hero.HAMMOND):
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| ROADHOG,TORBJORN | Ability1,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and (eventPlayer.getCurrentHero() == Hero.ROADHOG or eventPlayer.getCurrentHero() == Hero.TORBJORN):
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(false)


@Rule "| WIDOWMAKER | Ability2,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and eventPlayer.getCurrentHero() == Hero.WIDOWMAKER:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(false)


@Rule "| SOLDIER: 76 | SecondaryFire / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and eventPlayer.getCurrentHero() == Hero.SOLDIER:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(true)


@Rule "| HANZO | Ability1 / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and eventPlayer.getCurrentHero() == Hero.HANZO:
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)


@Rule "| GENJI,MCCREE,ZENYATTA | Ability2 / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and (eventPlayer.getCurrentHero() == Hero.GENJI or eventPlayer.getCurrentHero() == Hero.MCCREE or eventPlayer.getCurrentHero() == Hero.ZENYATTA):
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)


@Rule "| BASTION | Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and eventPlayer.getCurrentHero() == Hero.BASTION:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(false)


@Rule "| REAPER,TRACER | Allow All / P.VARS: A /"
@Event eachPlayer
if eventPlayer.A == 2 and (eventPlayer.getCurrentHero() == Hero.REAPER or eventPlayer.getCurrentHero() == Hero.TRACER):
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)


"""@Rule "|---------------------------------------------------------------------------------------| MENU"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| OPEN MENU | / P.VARS: C,D,E,F,K /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.INTERACT) and distance(eventPlayer, vect(-8.983, 4.244, 14.951)) > 0.675 and eventPlayer.D == 0:
    wait(0.8, Wait.ABORT_WHEN_FALSE)
    eventPlayer.E = eventPlayer.C
    eventPlayer.C = 1
    eventPlayer.setFacing(vect(1.5, 0, 0), Relativity.TO_WORLD)
    eventPlayer.setStatusEffect(null, Status.ROOTED, getMatchTime())
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    createIcon(getAllPlayers(), eventPlayer.getEyePosition() + vect(1.5, -0.22, 0.15), Icon.ARROW_RIGHT, IconReeval.VISIBILITY_AND_POSITION, Color.WHITE, false)
    eventPlayer.K[0] = getLastCreatedEntity()
    createIcon(getAllPlayers(), eventPlayer.getEyePosition() + vect(1.5, -0.22, -0.15), Icon.ARROW_LEFT, IconReeval.VISIBILITY_AND_POSITION, Color.WHITE, false)
    eventPlayer.K[1] = getLastCreatedEntity()
    createIcon(getAllPlayers(), eventPlayer.getEyePosition() + vect(1.5, -0.05, 0), Icon.RECYCLE, IconReeval.VISIBILITY_AND_POSITION, Color.YELLOW, false)
    eventPlayer.K[2] = getLastCreatedEntity()
    createInWorldText(getAllPlayers(), eventPlayer.F, eventPlayer.getEyePosition() + vect(1.5, -0.08, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.K[3] = getLastCreatedText()
    createInWorldText(getAllPlayers(), heroIcon(eventPlayer.getCurrentHero()), eventPlayer.getEyePosition() + vect(1.5, -0.22, 0), 1.6, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.K[4] = getLastCreatedText()
    wait(0.8)
    eventPlayer.D = 1


@Rule "| CLOSE MENU | / P.VARS: C,D,E,F,K /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.INTERACT) and eventPlayer.D == 1:
    eventPlayer.D = 0
    eventPlayer.C = eventPlayer.E
    eventPlayer.clearStatusEffect(Status.ROOTED)
    destroyIcon(eventPlayer.K[0])
    destroyIcon(eventPlayer.K[1])
    destroyIcon(eventPlayer.K[2])
    destroyInWorldText(eventPlayer.K[3])
    destroyInWorldText(eventPlayer.K[4])
    eventPlayer.K = 0
    wait(0.3)
    if eventPlayer.getCurrentHero() == Hero.WINSTON and eventPlayer.A == 2:
        goto lbl_0
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    lbl_0:


@Rule "| INCREASE SPEED | / P.VARS: D,F /"
@Event eachPlayer
if distance(eventPlayer.getEyePosition() + vect(1.5, 0, 0.15), raycast(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * (distance(eventPlayer.getEyePosition() + vect(1.5, 0, 0.15), eventPlayer.getEyePosition())) + eventPlayer.getEyePosition(), include=null, exclude=getAllPlayers(), includePlayerObjects=true).getHitPosition()) <= 0.06 and eventPlayer.D == 1 and eventPlayer.F < 998 and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
    do:
        wait(0.005)
        eventPlayer.F += 2
        eventPlayer.setMoveSpeed(eventPlayer.F)
    while RULE_CONDITION


@Rule "| DECREASE SPEED | / P.VARS: D,F /"
@Event eachPlayer
if distance(eventPlayer.getEyePosition() + vect(1.5, 0, -0.15), raycast(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * (distance(eventPlayer.getEyePosition() + vect(1.5, 0, -0.15), eventPlayer.getEyePosition())) + eventPlayer.getEyePosition(), include=null, exclude=getAllPlayers(), includePlayerObjects=true).getHitPosition()) <= 0.06 and eventPlayer.D == 1 and eventPlayer.F > 2 and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
    do:
        wait(0.005)
        eventPlayer.F -= 2
        eventPlayer.setMoveSpeed(eventPlayer.F)
    while RULE_CONDITION


@Rule "| DEFAULT SPEED | / P.VARS: D,F /"
@Event eachPlayer
if distance(eventPlayer.getEyePosition() + vect(1.5, 0.17, 0), raycast(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * (distance(eventPlayer.getEyePosition() + vect(1.5, 0.17, 0), eventPlayer.getEyePosition())) + eventPlayer.getEyePosition(), include=null, exclude=getAllPlayers(), includePlayerObjects=true).getHitPosition()) <= 0.06 and eventPlayer.D == 1 and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
    eventPlayer.F = 100
    eventPlayer.setMoveSpeed(eventPlayer.F)


@Rule "| CHANGE HERO | / P.VARS: D,L /"
@Event eachPlayer
if distance(eventPlayer.getEyePosition() + vect(1.5, -0.12, 0), raycast(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * (distance(eventPlayer.getEyePosition() + vect(1.5, -0.12, 0), eventPlayer.getEyePosition())) + eventPlayer.getEyePosition(), include=null, exclude=getAllPlayers(), includePlayerObjects=true).getHitPosition()) <= 0.06 and eventPlayer.D == 1 and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
    eventPlayer.L[0] = 1
    eventPlayer.L[1] = eventPlayer.getPosition()
    eventPlayer.L[2] = vectorTowards(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * 3 + eventPlayer.getEyePosition())
    wait(0.1)
    eventPlayer.setAllowedHeroes(getAllHeroes().exclude(eventPlayer.getCurrentHero()))


@Rule "| TELEPORT WHEN CHANGED HERO | / P.VARS: L /"
@Event eachPlayer
if eventPlayer.L[0] == 1 and eventPlayer.isInSpawnRoom():
    wait(0.025)
    eventPlayer.teleport(eventPlayer.L[1])
    eventPlayer.setFacing(eventPlayer.L[2], Relativity.TO_WORLD)
    eventPlayer.L[0] = 0
    eventPlayer.setAllowedHeroes(getAllHeroes())


"""@Rule "|----------------------------------------------------------------------| LEADER AND MODER FEATURES"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| CHECK LEADER SLOT | / P.VARS: G /"
@Event eachPlayer
if getPlayersInSlot(0, Color.TEAM_1) == eventPlayer:
    eventPlayer.G = 1


@Rule "| START SETTINGS FOR MODER/LEADER | / P.VARS: G,C,F,H,A,J /"
@Event eachPlayer
if eventPlayer.G > 0:
    if eventPlayer.G == 2:
        goto lbl_0
    eventPlayer.C = 1
    eventPlayer.H = 1
    eventPlayer.F = 100
    lbl_0:
    if eventPlayer.G == 1:
        goto lbl_1
    eventPlayer.A = 0
    eventPlayer.H = 1
    destroyHudText(eventPlayer.J[2])
    destroyEffect(eventPlayer.J[4])
    destroyInWorldText(eventPlayer.J[5])
    eventPlayer.setDamageDealt(100)
    eventPlayer.setHealingDealt(100)
    lbl_1:


@Rule "| HUD, EFFECTS FOR MODER/LEADER | / P.VARS: G,H,B,J /"
@Event eachPlayer
if eventPlayer.G > 0:
    if eventPlayer.G == 1:
        goto lbl_0
    destroyHudText(eventPlayer.J[2])
    destroyEffect(eventPlayer.J[4])
    destroyInWorldText(eventPlayer.J[5])
    wait(0.005)
    hudHeader(eventPlayer, l"Moderate", Position.LEFT, 0, Color.YELLOW, HudReeval.STRING)
    eventPlayer.J[2] = getLastCreatedText()
    hudHeader(eventPlayer, l"Phase: {}".format(eventPlayer.H), Position.LEFT, 1, Color.YELLOW, HudReeval.STRING)
    eventPlayer.J[3] = getLastCreatedText()
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer + vect(0, eventPlayer.B + 0.175, 0), 0.15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.J[4] = getLastCreatedEntity()
    createInWorldText(getAllPlayers(), l"Moderate", eventPlayer + vect(0, eventPlayer.B, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.J[5] = getLastCreatedText()
    lbl_0:
    if eventPlayer.G == 2:
        goto lbl_1
    hudHeader(eventPlayer, l"Leader", Position.LEFT, 0, Color.RED, HudReeval.STRING)
    hudHeader(eventPlayer, l"Phase: {}".format(eventPlayer.H), Position.LEFT, 1, Color.RED, HudReeval.STRING)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.RED, eventPlayer + vect(0, eventPlayer.B + 0.175, 0), 0.15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.J[2] = getLastCreatedEntity()
    wait(1)
    createInWorldText(getAllPlayers(), l"Leader", eventPlayer + vect(0, eventPlayer.B, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.J[3] = getLastCreatedText()
    lbl_1:


@Rule "| SHOW SERVER STATS TO LEADER |"
@Event global
hudHeader(getPlayersInSlot(0, Color.TEAM_1), l"Server Load: {}%".format(getServerLoad()), Position.LEFT, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
hudHeader(getPlayersInSlot(0, Color.TEAM_1), l"Server Load Average: {}%".format(getAverageServerLoad()), Position.LEFT, 5, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
hudHeader(getPlayersInSlot(0, Color.TEAM_1), l"Server Load Peak: {}%".format(getPeakServerLoad()), Position.LEFT, 6, Color.RED, HudReeval.VISIBILITY_AND_STRING)


@Rule "| INVINCIBLE FOR MODER/LEADER | / P.VARS: G /"
@Event eachPlayer
if eventPlayer.G > 0:
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, getMatchTime())


@Rule "| RESTART INVINCIBLE WHEN DIED | / P.VARS: G /"
@Event playerDied
if eventPlayer.G > 0:
    eventPlayer.clearStatusEffect(Status.PHASED_OUT)
    wait(0.05)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, getMatchTime())


@Rule "| INFINITE ULT USING | [ALL HEROES] | / P.VARS: G /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.ULTIMATE) and (not (eventPlayer.getCurrentHero() == Hero.MEI or eventPlayer.getCurrentHero() == Hero.DVA)) and eventPlayer.G > 0:
    eventPlayer.setUltCharge(100)


@Rule "| WHEN CROUCHING | / P.VARS: G,I /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.G > 0:
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)
    eventPlayer.disallowButton(Button.JUMP)
    createInWorldText(eventPlayer, l"Target", eventPlayer.getPlayerClosestToReticle(Team.ALL) + vect(0, -0.15, 0), 2, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.I = getLastCreatedText()


@Rule "| WHEN NOT CROUCHING | / P.VARS: G,I /"
@Event eachPlayer
if not eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.G > 0:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    if eventPlayer.D == 1:
        goto lbl_0
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    lbl_0:
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)
    eventPlayer.allowButton(Button.JUMP)
    destroyInWorldText(eventPlayer.I)


@Rule "| CHANGE MODES | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_1) and eventPlayer.G > 0:
    if eventPlayer.H > 8:
        goto lbl_0
    eventPlayer.H++
    lbl_0:
    if eventPlayer.H < 9:
        goto lbl_1
    eventPlayer.H = 1
    lbl_1:


"""@Rule "|____________________ [MODE 1 (KILL)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| KILL PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 1:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).A == 2 or eventPlayer.getPlayerClosestToReticle(Team.ALL).G > 0:
        goto lbl_0
    kill(eventPlayer.getPlayerClosestToReticle(Team.ALL), eventPlayer)
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| KILL ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.G == 1 and eventPlayer.H == 1:
    kill([player for player in getLivingPlayers(Team.ALL) if player.A == 1 or eventPlayer.G == 0], eventPlayer)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, eventPlayer, 4)


@Rule "| RESSURECT PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 1:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).resurrect()
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).G == 0 or eventPlayer.getPlayerClosestToReticle(Team.ALL).A == 1:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(null, Status.PHASED_OUT, getMatchTime())
    lbl_0:


@Rule "| RESSURECT ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_2) and eventPlayer.G == 1 and eventPlayer.H == 1:
    for player in getDeadPlayers(Team.ALL):
        player.resurrect()
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.BLUE, eventPlayer, 4)
    wait(0.1)
    [player for player in getAllPlayers() if player.G > 0 or player.A == 2].setStatusEffect(null, Status.PHASED_OUT, getMatchTime())


"""@Rule "|____________________ [MODE 2 (TELEPORT)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| TELEPORT TO PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 2:
    eventPlayer.teleport(eventPlayer.getPlayerClosestToReticle(Team.ALL))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| TELEPORT PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.G == 2 and eventPlayer.H == 2:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).G > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).teleport(eventPlayer)
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| TELEPORT PLAYER | [LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.G == 1 and eventPlayer.H == 2:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).teleport(eventPlayer)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| TELEPORT ALL PLAYER'S TO LEADER | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.G == 1 and eventPlayer.H == 2:
    [player for player in getAllPlayers() if player.G != 1].teleport(eventPlayer)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.BLUE, eventPlayer, 5)


"""@Rule "|____________________ [MODE 3 (FREEZE)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| FREEZE PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G == 2 and eventPlayer.H == 3:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).G > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.FROZEN, getMatchTime())
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| FREEZE PLAYER | [LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G == 1 and eventPlayer.H == 3:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.FROZEN, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| FREEZE ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.G == 1 and eventPlayer.H == 3:
    [player for player in getAllPlayers() if player.G != 1].setStatusEffect(eventPlayer, Status.FROZEN, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, eventPlayer, 4)


@Rule "| UNFREEZE PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 3:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).clearStatusEffect(Status.FROZEN)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| UNFREEZE ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_2) and eventPlayer.G == 1 and eventPlayer.H == 3:
    for player in getAllPlayers():
        player.clearStatusEffect(Status.FROZEN)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.BLUE, eventPlayer, 4)


"""@Rule "|____________________ [MODE 4 (KNOCK DOWN)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| KNOCK DOWN PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G == 2 and eventPlayer.H == 4:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).G > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, getMatchTime())
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| KNOCK DOWN PLAYER | [LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G == 1 and eventPlayer.H == 4:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| KNOCK DOWN ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.G == 1 and eventPlayer.H == 4:
    [player for player in getAllPlayers() if player.G != 1].setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, eventPlayer, 4)


@Rule "| LET PLAYER STAND | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 4:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).clearStatusEffect(Status.KNOCKED_DOWN)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| LET ALL PLAYER'S STAND | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_2) and eventPlayer.G == 1 and eventPlayer.H == 4:
    for player in getAllPlayers():
        player.clearStatusEffect(Status.KNOCKED_DOWN)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.BLUE, eventPlayer, 4)


"""@Rule "|____________________ [MODE 5 (BURNING)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| BURN PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G == 2 and eventPlayer.H == 5:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).G > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.BURNING, getMatchTime())
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| BURN PLAYER | [LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G == 1 and eventPlayer.H == 5:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.BURNING, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| BURN ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.G == 1 and eventPlayer.H == 5:
    [player for player in getAllPlayers() if player.G != 1].setStatusEffect(eventPlayer, Status.BURNING, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, eventPlayer, 4)


@Rule "| UNBURN PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 5:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).clearStatusEffect(Status.BURNING)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| UNBURN ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_2) and eventPlayer.G == 1 and eventPlayer.H == 5:
    for player in getAllPlayers():
        player.clearStatusEffect(Status.BURNING)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.BLUE, eventPlayer, 4)


"""@Rule "|____________________ [MODE 6 (SELF)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| KILL/RES YOURSELF | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 6:
    if eventPlayer.isDead():
        goto lbl_0
    kill(eventPlayer, eventPlayer)
    lbl_0:
    if eventPlayer.isAlive():
        goto lbl_1
    eventPlayer.resurrect()
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)
    lbl_1:


@Rule "| FREEZE/UNFREEZE YOURSELF | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 6:
    if eventPlayer.hasStatusEffect(Status.FROZEN):
        goto lbl_0
    eventPlayer.setStatusEffect(eventPlayer, Status.FROZEN, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)
    lbl_0:
    if not eventPlayer.hasStatusEffect(Status.FROZEN):
        goto lbl_1
    eventPlayer.clearStatusEffect(Status.FROZEN)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)
    lbl_1:


@Rule "| KNOCK DOWN/LET STAND YOURSELF | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.G > 0 and eventPlayer.H == 6:
    if eventPlayer.hasStatusEffect(Status.KNOCKED_DOWN):
        goto lbl_0
    eventPlayer.setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)
    lbl_0:
    if not eventPlayer.hasStatusEffect(Status.KNOCKED_DOWN):
        goto lbl_1
    eventPlayer.clearStatusEffect(Status.KNOCKED_DOWN)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)
    lbl_1:


@Rule "| BURN/UNBURN YOURSELF | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_2) and eventPlayer.G > 0 and eventPlayer.H == 6:
    if eventPlayer.hasStatusEffect(Status.BURNING):
        goto lbl_0
    eventPlayer.setStatusEffect(eventPlayer, Status.BURNING, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)
    lbl_0:
    if not eventPlayer.hasStatusEffect(Status.BURNING):
        goto lbl_1
    eventPlayer.clearStatusEffect(Status.BURNING)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)
    lbl_1:


"""@Rule "|____________________ [MODE 7 (PUSH)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| PUSH PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G == 2 and eventPlayer.H == 7:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).G > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).applyImpulse(eventPlayer.getFacingDirection(), 50, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| PUSH PLAYER | [LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G == 1 and eventPlayer.H == 7:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).applyImpulse(eventPlayer.getFacingDirection(), 50, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


"""@Rule "|____________________ [MODE 8 (INVISIBILITY)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| INVISIBILITY ON | / P.VARS: G,H,J,M /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.G > 0 and eventPlayer.H == 8 and eventPlayer.M == 0:
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)
    wait(0.2)
    eventPlayer.setInvisibility(Invis.ALL)
    destroyInWorldText(eventPlayer.J[0])
    destroyInWorldText(eventPlayer.J[1])
    destroyEffect(eventPlayer.J[2])
    destroyInWorldText(eventPlayer.J[3])
    destroyEffect(eventPlayer.J[4])
    destroyInWorldText(eventPlayer.J[5])
    eventPlayer.M = 1


@Rule "| INVISIBILITY OFF | / P.VARS: G,H,J,M /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.G == 2 and eventPlayer.H == 8 and eventPlayer.M == 1:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)
    wait(0.2)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer + vect(0, eventPlayer.B + 0.175, 0), 0.15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.J[4] = getLastCreatedEntity()
    createInWorldText(getAllPlayers(), l"Moderate", eventPlayer + vect(0, eventPlayer.B, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.J[5] = getLastCreatedText()
    eventPlayer.M = 0


@Rule "| INVISIBILITY OFF | [LEADER] / P.VARS: G,H,J,M /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.G == 1 and eventPlayer.H == 8 and eventPlayer.M == 1:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)
    wait(0.2)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.RED, eventPlayer + vect(0, eventPlayer.B + 0.175, 0), 0.15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.J[2] = getLastCreatedEntity()
    createInWorldText(getAllPlayers(), l"Leader", eventPlayer + vect(0, eventPlayer.B, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.J[3] = getLastCreatedText()
    eventPlayer.M = 0


"""@Rule "|____________________ [GIVE/TAKE MODER] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| GIVE/TAKE MODER | [ONLY LEADER] / P.VARS: G,H,J,A /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.JUMP) and eventPlayer.G == 1:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).H > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).G = 2
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, eventPlayer.getPlayerClosestToReticle(Team.ALL), 1)
    bigMessage(getAllPlayers(), l"{} Raise {} -> Moderate, Congratulations!".format(eventPlayer, eventPlayer.getPlayerClosestToReticle(Team.ALL)))
    lbl_0:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).H == 0:
        goto lbl_1
    eventPlayer.getPlayerClosestToReticle(Team.ALL).H = 0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).G = 0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).M = 0
    destroyHudText(eventPlayer.getPlayerClosestToReticle(Team.ALL).J[2])
    destroyHudText(eventPlayer.getPlayerClosestToReticle(Team.ALL).J[3])
    destroyEffect(eventPlayer.getPlayerClosestToReticle(Team.ALL).J[4])
    destroyInWorldText(eventPlayer.getPlayerClosestToReticle(Team.ALL).J[5])
    eventPlayer.getPlayerClosestToReticle(Team.ALL).A = 1
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer.getPlayerClosestToReticle(Team.ALL), 1)
    eventPlayer.getPlayerClosestToReticle(Team.ALL).clearStatusEffect(Status.PHASED_OUT)
    bigMessage(getAllPlayers(), l"{}: {} No Moderate!".format(eventPlayer, eventPlayer.getPlayerClosestToReticle(Team.ALL)))
    lbl_1:


"""@Rule "|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-| INFO"
@Event eachPlayer
@Team 1
@Slot 0
"""

"""@Rule "|-| Total Rules Usage (With Conditions Or Actions): 122 |-|"
@Event eachPlayer
@Team 1
@Slot 0
"""

"""@Rule "|-| Total G.VARS Usage: A,B,C,D,E,F |-|"
@Event eachPlayer
@Team 1
@Slot 0
"""

"""@Rule "|-| Total P.VARS Usage: Ą,B,C,D,E,F,G,H,I,J,K,L,M |-|"
@Event eachPlayer
@Team 1
@Slot 0
"""

"""@Rule "|-| Created By \"IRLININ\" |-|"
@Event eachPlayer
@Team 1
@Slot 0
"""

