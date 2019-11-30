#!define isCorrectMap(x) (getCurrentMap() in x)

#Global variables

#!declareGlobal global_a 0

#Player variables

#!declarePlayer player_selectedMode 0
#!declarePlayer player_textPosition 1
#!declarePlayer player_selectedCamera 2
#!declarePlayer player_isInPlayerMenu 3
#!declarePlayer player_backupCamera 4
#!declarePlayer player_selectedSpeed 5
#!declarePlayer player_isLeader 6
#!declarePlayer player_selectedPhase 7
#!declarePlayer player_lastText 8
#!declarePlayer player_textArray 9
#!declarePlayer player_playerMenuArray 10
#!declarePlayer player_backupPositionArray 11
#!declarePlayer player_invisible 12


"""@Rule "|-------------------------------------------------------------------------------| START SETTINGS"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "Disable Time Limit"
@Event global
disableGamemodeCompletion()
disableAnnouncer()

@Rule "| INFINITE ULT USING FOR NOT MODER/LEADER | [ONLY ANA,BAPTISTE,MCCREE,ORISA] / P.VARS: G /"
@Event eachPlayer
if (eventPlayer.getCurrentHero() == Hero.ANA or eventPlayer.getCurrentHero() == Hero.BAPTISTE or eventPlayer.getCurrentHero() == Hero.MCCREE or eventPlayer.getCurrentHero() == Hero.ORISA) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.player_isLeader == 0:
    eventPlayer.setUltCharge(100)


@Rule "| TEXTS AND JUMP | / P.VARS: C,B,F,G /"
@Event eachPlayer
hudHeader(eventPlayer, l"In View: {}".format(eventPlayer.player_selectedCamera), Position.LEFT, 2, Color.WHITE, HudReeval.STRING)
hudHeader(eventPlayer, l"Speed: {}".format(eventPlayer.player_selectedSpeed), Position.LEFT, 3, Color.WHITE, HudReeval.STRING)
createInWorldText([player for player in getAllPlayers() if player.player_isLeader > 0], l"{}: {}".format(heroIcon(eventPlayer.getCurrentHero()), eventPlayer), eventPlayer + vect(0, eventPlayer.player_textPosition + 0.4, 0), 1.1, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
eventPlayer.disallowButton(Button.JUMP)


@Rule "| TEXTS WHEN NOT INVISIBILITY | / P.VARS: M /"
@Event eachPlayer
if eventPlayer.player_invisible == 0:
    eventPlayer.setInvisibility(Invis.NONE)
    createInWorldText(getAllPlayers(), l"In View: {}".format(eventPlayer.player_selectedCamera), eventPlayer + vect(0, eventPlayer.player_textPosition + -0.2, 0), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.player_textArray[0] = getLastCreatedText()
    createInWorldText(getAllPlayers(), l"Speed: {}".format(eventPlayer.player_selectedSpeed), eventPlayer + vect(0, eventPlayer.player_textPosition + -0.1, 0), 1, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.player_textArray[1] = getLastCreatedText()


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
    eventPlayer.player_selectedMode = 2
    eventPlayer.player_selectedCamera = 1
    eventPlayer.player_selectedSpeed = 100


"""@Rule "|____________________ [POSITIONS OF TEXTS/EFFECTS FOR HEROES] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| TRACER,HANZO,PHARAH,SYMMETRA,GENJI,MCCREE,JUNKRAT,LUCIO,MEI,SOMBRA,DOOMFIST,ANA,ASHE,BAPTISTE | / P.VARS: B /"
@Event eachPlayer
if (eventPlayer.getCurrentHero() == Hero.TRACER or eventPlayer.getCurrentHero() == Hero.HANZO or eventPlayer.getCurrentHero() == Hero.PHARAH or eventPlayer.getCurrentHero() == Hero.SYMMETRA or eventPlayer.getCurrentHero() == Hero.GENJI or eventPlayer.getCurrentHero() == Hero.MCCREE or eventPlayer.getCurrentHero() == Hero.JUNKRAT or eventPlayer.getCurrentHero() == Hero.LUCIO or eventPlayer.getCurrentHero() == Hero.MEI or eventPlayer.getCurrentHero() == Hero.SOMBRA or eventPlayer.getCurrentHero() == Hero.DOOMFIST or eventPlayer.getCurrentHero() == Hero.ANA or eventPlayer.getCurrentHero() == Hero.ASHE or eventPlayer.getCurrentHero() == Hero.BAPTISTE):
    eventPlayer.player_textPosition = 1.8


@Rule "| REINHARDT,WINSTON,BASTION,ROADHOG,ZARYA,ORISA,WRECKING BALL | / P.VARS: B /"
@Event eachPlayer
if (eventPlayer.getCurrentHero() == Hero.REINHARDT or eventPlayer.getCurrentHero() == Hero.WINSTON or eventPlayer.getCurrentHero() == Hero.BASTION or eventPlayer.getCurrentHero() == Hero.ROADHOG or eventPlayer.getCurrentHero() == Hero.ZARYA or eventPlayer.getCurrentHero() == Hero.ORISA or eventPlayer.getCurrentHero() == Hero.HAMMOND):
    eventPlayer.player_textPosition = 2.2


@Rule "| REAPER,MERCY,WIDOWMAKER,ZENYATTA,SOLDIER: 76,BRIGITTE,MOIRA | / P.VARS: B /"
@Event eachPlayer
if (eventPlayer.getCurrentHero() == Hero.REAPER or eventPlayer.getCurrentHero() == Hero.MERCY or eventPlayer.getCurrentHero() == Hero.WIDOWMAKER or eventPlayer.getCurrentHero() == Hero.ZENYATTA or eventPlayer.getCurrentHero() == Hero.SOLDIER or eventPlayer.getCurrentHero() == Hero.BRIGITTE or eventPlayer.getCurrentHero() == Hero.MOIRA):
    eventPlayer.player_textPosition = 2


@Rule "| SIGMA | / P.VARS: B /"
@Event eachPlayer
if eventPlayer.getCurrentHero() == Hero.SIGMA:
    eventPlayer.player_textPosition = 2.6


@Rule "| TORBJORN | / P.VARS: B /"
@Event eachPlayer
if eventPlayer.getCurrentHero() == Hero.TORBJORN:
    eventPlayer.player_textPosition = 1.6


@Rule "| D.VA | / P.VARS: B /"
@Event eachPlayer
if eventPlayer.getCurrentHero() == Hero.DVA and eventPlayer.getMaxHealth() == abs(600):
    eventPlayer.player_textPosition = 2.2


@Rule "| BABY D.VA | / P.VARS: B /"
@Event eachPlayer
if eventPlayer.getCurrentHero() == Hero.DVA and eventPlayer.getMaxHealth() == abs(150):
    eventPlayer.player_textPosition = 1.8


"""@Rule "|-----------------------------------------------------------------------------------| TELEPORTS"
@Event eachPlayer
@Team 1
@Slot 0
"""

"""@Rule "|--------------------------------------------------------------------------------| ENTER PLACES"
@Event eachPlayer
@Team 1
@Slot 0
"""

"""@Rule "|---------------------------------------------------------------------------------| DANCE FLOOR"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| CHASE G.VAR A | / G.VARS: A /"
@Event global
do:
    wait(2)
    chase(global_a, 5.5, duration=2, ChaseReeval.DESTINATION_AND_DURATION)
    wait(2)
    chase(global_a, 1.5, duration=2, ChaseReeval.DESTINATION_AND_DURATION)
while true


"""@Rule "|--------------------------------------------------------------------------------------| CAMERA"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| CHANGE VIEW | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.INTERACT) and eventPlayer.player_selectedCamera < 8 and eventPlayer.player_isInPlayerMenu == 0:
    eventPlayer.player_selectedCamera++


@Rule "| FIRST PERSON | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.player_selectedCamera == 8 and eventPlayer.player_isInPlayerMenu == 0:
    eventPlayer.player_selectedCamera = 1


"""@Rule "|____________________ [VIEWS] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| VIEW 1 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.player_selectedCamera == 1:
    eventPlayer.stopCamera()
    smallMessage(eventPlayer, l"In View 1")


@Rule "| VIEW 2 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.player_selectedCamera == 2:
    eventPlayer.setCamera(eventPlayer.getFacingDirection() * -2 + eventPlayer + worldVector(vect(-1.2, 1.8, 0), eventPlayer, Transform.ROTATION), eventPlayer + eventPlayer.getFacingDirection() * 100, 0)
    smallMessage(eventPlayer, l"In View 2")


@Rule "| VIEW 3 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.player_selectedCamera == 3:
    eventPlayer.setCamera(eventPlayer.getFacingDirection() * -3.5 + eventPlayer + vect(0, 2.1, 0), eventPlayer + eventPlayer.getFacingDirection() * 100, 0)
    smallMessage(eventPlayer, l"In View 3")


@Rule "| VIEW 4 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.player_selectedCamera == 4:
    eventPlayer.setCamera(eventPlayer.getFacingDirection() * -3.5 + eventPlayer + vect(0, 2.1, 0), raycast(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * 100 + eventPlayer.getEyePosition(), include=null, exclude=getAllPlayers(), includePlayerObjects=false).getHitPosition(), 4)
    smallMessage(eventPlayer, l"In View 4")


@Rule "| VIEW 5 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.player_selectedCamera == 5:
    eventPlayer.setCamera(vect(0, 10, 0) + eventPlayer, eventPlayer.getFacingDirection() * 4 + eventPlayer, 0)
    smallMessage(eventPlayer, l"In View 5")


@Rule "| VIEW 6 | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.player_selectedCamera == 6:
    eventPlayer.setCamera(eventPlayer.getFacingDirection() * 1.5 + eventPlayer + vect(0, 1.6, 0), eventPlayer + eventPlayer.getFacingDirection() * -100, 0)
    smallMessage(eventPlayer, l"In View 6")


@Rule "| BONUS VIEW | / P.VARS: C /"
@Event eachPlayer
if eventPlayer.player_selectedCamera == 7:
    eventPlayer.setCamera(eventPlayer.getFacingDirection() * -0.6 + eventPlayer + worldVector(vect(0.05, 0.85, 0), eventPlayer, Transform.ROTATION), eventPlayer + eventPlayer.getFacingDirection() * 100, 0)
    smallMessage(eventPlayer, l"In View ... Oops")


"""@Rule "|--------------------------------------------------------------------------------| LOOTBOX SIMULATOR"
@Event eachPlayer
@Team 1
@Slot 0
"""

"""@Rule "|____________________ [DROPS] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

"""@Rule "|--------------------------------------------------------------------------------------| FORM"
@Event eachPlayer
@Team 1
@Slot 0
"""

"""@Rule "|____________________ [PICK FORM] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| INNOCENT | / P.VARS: G,A /"
@Event eachPlayer
if (distance(eventPlayer, vect(3.223, 10.443, -7.93)) <= 1.5 or distance(eventPlayer, vect(-40.87, 6.443, -158.795)) <= 1.5):
    if eventPlayer.player_selectedMode == 2 or eventPlayer.player_isLeader > 0:
        goto lbl_0
    if eventPlayer.getCurrentHero() == Hero.DVA:
        goto lbl_1
    kill(eventPlayer, null)
    lbl_1:
    if eventPlayer.getCurrentHero() == Hero.LUCIO:
        goto lbl_2
    eventPlayer.respawn()
    lbl_2:
    eventPlayer.player_selectedMode = 2
    wait(0.05)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.BLUE, eventPlayer, 5)
    lbl_0:


@Rule "| NORMAL | / P.VARS: G,A /"
@Event eachPlayer
if (distance(eventPlayer, vect(5.929, 10.443, -2.765)) <= 1.5 or distance(eventPlayer, vect(-45.69, 6.443, -156.246)) <= 1.5):
    if eventPlayer.player_selectedMode == 1 or eventPlayer.player_isLeader > 0:
        goto lbl_0
    if eventPlayer.getCurrentHero() == Hero.DVA:
        goto lbl_1
    kill(eventPlayer, null)
    lbl_1:
    eventPlayer.respawn()
    eventPlayer.player_selectedMode = 1
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
if eventPlayer.player_selectedMode == 2:
    destroyHudText(eventPlayer.player_textArray[2])
    hudText(eventPlayer, l"Innocent", l"Form", null, Position.LEFT, 0, Color.BLUE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_textArray[2] = getLastCreatedText()
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.BLUE, eventPlayer + vect(0, eventPlayer.player_textPosition + 0.175, 0), 0.15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_textArray[4] = getLastCreatedEntity()
    createInWorldText(getAllPlayers(), l"Innocent", eventPlayer + vect(0, eventPlayer.player_textPosition, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.player_textArray[5] = getLastCreatedText()
    bigMessage(eventPlayer, l"Innocent Form")
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, getMatchTime())
    eventPlayer.setDamageDealt(0)
    eventPlayer.setHealingDealt(0)


@Rule "| NORMAL | / P.VARS: A,J /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 1:
    if eventPlayer.player_isLeader > 0:
        goto lbl_0
    destroyHudText(eventPlayer.player_textArray[2])
    destroyEffect(eventPlayer.player_textArray[4])
    destroyInWorldText(eventPlayer.player_textArray[5])
    hudText(eventPlayer, l"Normal", l"Form", null, Position.LEFT, 0, Color.WHITE, Color.WHITE, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
    eventPlayer.player_textArray[2] = getLastCreatedText()
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
if eventPlayer.player_selectedMode == 2 and eventPlayer.getCurrentHero() == Hero.LUCIO:
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
if eventPlayer.player_selectedMode == 2 and eventPlayer.getCurrentHero() == Hero.SIGMA:
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| LUCIO | Ability1 and Speedboost,SecondaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and eventPlayer.getCurrentHero() == Hero.LUCIO:
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
if eventPlayer.player_selectedMode == 2 and eventPlayer.getCurrentHero() == Hero.REINHARDT:
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| DOOMFIST,ZARYA | Ability1,Ability2,SecondaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and (eventPlayer.getCurrentHero() == Hero.DOOMFIST or eventPlayer.getCurrentHero() == Hero.ZARYA):
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| ANA,JUNKRAT | Ability1,Ability2,PrimaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and (eventPlayer.getCurrentHero() == Hero.ANA or eventPlayer.getCurrentHero() == Hero.JUNKRAT):
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(false)


@Rule "| BRIGITTE,D.VA | Ability1,SecondaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and (eventPlayer.getCurrentHero() == Hero.BRIGITTE or eventPlayer.getCurrentHero() == Hero.DVA):
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| BAPTISTE,ORISA | Ability2,SecondaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and (eventPlayer.getCurrentHero() == Hero.BAPTISTE or eventPlayer.getCurrentHero() == Hero.ORISA):
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| ASHE,MEI,SYMMETRA | Ability1,Ability2,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and (eventPlayer.getCurrentHero() == Hero.ASHE or eventPlayer.getCurrentHero() == Hero.MEI or eventPlayer.getCurrentHero() == Hero.SYMMETRA):
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(false)


@Rule "| WINSTON | Ability1,Ability2,PrimaryFire / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and eventPlayer.getCurrentHero() == Hero.WINSTON:
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)


@Rule "| MERCY | Ability2,SecondaryFire / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and eventPlayer.getCurrentHero() == Hero.MERCY:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(true)


@Rule "| PHARAH,MOIRA | Ability2,PrimaryFire / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and (eventPlayer.getCurrentHero() == Hero.PHARAH or eventPlayer.getCurrentHero() == Hero.MOIRA):
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(false)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)


@Rule "| SOMBRA,WRECKING BALL | SecondaryFire,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and (eventPlayer.getCurrentHero() == Hero.SOMBRA or eventPlayer.getCurrentHero() == Hero.HAMMOND):
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)


@Rule "| ROADHOG,TORBJORN | Ability1,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and (eventPlayer.getCurrentHero() == Hero.ROADHOG or eventPlayer.getCurrentHero() == Hero.TORBJORN):
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(false)


@Rule "| WIDOWMAKER | Ability2,Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and eventPlayer.getCurrentHero() == Hero.WIDOWMAKER:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(false)


@Rule "| SOLDIER: 76 | SecondaryFire / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and eventPlayer.getCurrentHero() == Hero.SOLDIER:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(true)


@Rule "| HANZO | Ability1 / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and eventPlayer.getCurrentHero() == Hero.HANZO:
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)


@Rule "| GENJI,MCCREE,ZENYATTA | Ability2 / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and (eventPlayer.getCurrentHero() == Hero.GENJI or eventPlayer.getCurrentHero() == Hero.MCCREE or eventPlayer.getCurrentHero() == Hero.ZENYATTA):
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)


@Rule "| BASTION | Ult / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and eventPlayer.getCurrentHero() == Hero.BASTION:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    eventPlayer.setPrimaryFireEnabled(true)
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(false)


@Rule "| REAPER,TRACER | Allow All / P.VARS: A /"
@Event eachPlayer
if eventPlayer.player_selectedMode == 2 and (eventPlayer.getCurrentHero() == Hero.REAPER or eventPlayer.getCurrentHero() == Hero.TRACER):
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
if eventPlayer.isHoldingButton(Button.INTERACT) and distance(eventPlayer, vect(-60.1, 12.272, 11.394)) > 0.675 and eventPlayer.player_isInPlayerMenu == 0:
    wait(0.8, Wait.ABORT_WHEN_FALSE)
    eventPlayer.player_backupCamera = eventPlayer.player_selectedCamera
    eventPlayer.player_selectedCamera = 1
    eventPlayer.setFacing(vect(1.5, 0, 0), Relativity.TO_WORLD)
    eventPlayer.setStatusEffect(null, Status.ROOTED, getMatchTime())
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    createIcon(getAllPlayers(), eventPlayer.getEyePosition() + vect(1.5, -0.22, 0.15), Icon.ARROW_RIGHT, IconReeval.VISIBILITY_AND_POSITION, Color.WHITE, false)
    eventPlayer.player_playerMenuArray[0] = getLastCreatedEntity()
    createIcon(getAllPlayers(), eventPlayer.getEyePosition() + vect(1.5, -0.22, -0.15), Icon.ARROW_LEFT, IconReeval.VISIBILITY_AND_POSITION, Color.WHITE, false)
    eventPlayer.player_playerMenuArray[1] = getLastCreatedEntity()
    createIcon(getAllPlayers(), eventPlayer.getEyePosition() + vect(1.5, -0.05, 0), Icon.RECYCLE, IconReeval.VISIBILITY_AND_POSITION, Color.YELLOW, false)
    eventPlayer.player_playerMenuArray[2] = getLastCreatedEntity()
    createInWorldText(getAllPlayers(), eventPlayer.player_selectedSpeed, eventPlayer.getEyePosition() + vect(1.5, -0.08, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.player_playerMenuArray[3] = getLastCreatedText()
    createInWorldText(getAllPlayers(), heroIcon(eventPlayer.getCurrentHero()), eventPlayer.getEyePosition() + vect(1.5, -0.22, 0), 1.6, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.player_playerMenuArray[4] = getLastCreatedText()
    wait(0.8)
    eventPlayer.player_isInPlayerMenu = 1


@Rule "| CLOSE MENU | / P.VARS: C,D,E,F,K /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.INTERACT) and eventPlayer.player_isInPlayerMenu == 1:
    eventPlayer.player_isInPlayerMenu = 0
    eventPlayer.player_selectedCamera = eventPlayer.player_backupCamera
    eventPlayer.clearStatusEffect(Status.ROOTED)
    destroyIcon(eventPlayer.player_playerMenuArray[0])
    destroyIcon(eventPlayer.player_playerMenuArray[1])
    destroyIcon(eventPlayer.player_playerMenuArray[2])
    destroyInWorldText(eventPlayer.player_playerMenuArray[3])
    destroyInWorldText(eventPlayer.player_playerMenuArray[4])
    eventPlayer.player_playerMenuArray = 0
    wait(0.3)
    if eventPlayer.getCurrentHero() == Hero.WINSTON and eventPlayer.player_selectedMode == 2:
        goto lbl_0
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    lbl_0:


@Rule "| INCREASE SPEED | / P.VARS: D,F /"
@Event eachPlayer
if distance(eventPlayer.getEyePosition() + vect(1.5, 0, 0.15), raycast(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * (distance(eventPlayer.getEyePosition() + vect(1.5, 0, 0.15), eventPlayer.getEyePosition())) + eventPlayer.getEyePosition(), include=null, exclude=getAllPlayers(), includePlayerObjects=true).getHitPosition()) <= 0.06 and eventPlayer.player_isInPlayerMenu == 1 and eventPlayer.player_selectedSpeed < 998 and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
    do:
        wait(0.005)
        eventPlayer.player_selectedSpeed += 2
        eventPlayer.setMoveSpeed(eventPlayer.player_selectedSpeed)
    while RULE_CONDITION


@Rule "| DECREASE SPEED | / P.VARS: D,F /"
@Event eachPlayer
if distance(eventPlayer.getEyePosition() + vect(1.5, 0, -0.15), raycast(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * (distance(eventPlayer.getEyePosition() + vect(1.5, 0, -0.15), eventPlayer.getEyePosition())) + eventPlayer.getEyePosition(), include=null, exclude=getAllPlayers(), includePlayerObjects=true).getHitPosition()) <= 0.06 and eventPlayer.player_isInPlayerMenu == 1 and eventPlayer.player_selectedSpeed > 2 and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
    do:
        wait(0.005)
        eventPlayer.player_selectedSpeed -= 2
        eventPlayer.setMoveSpeed(eventPlayer.player_selectedSpeed)
    while RULE_CONDITION


@Rule "| DEFAULT SPEED | / P.VARS: D,F /"
@Event eachPlayer
if distance(eventPlayer.getEyePosition() + vect(1.5, 0.17, 0), raycast(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * (distance(eventPlayer.getEyePosition() + vect(1.5, 0.17, 0), eventPlayer.getEyePosition())) + eventPlayer.getEyePosition(), include=null, exclude=getAllPlayers(), includePlayerObjects=true).getHitPosition()) <= 0.06 and eventPlayer.player_isInPlayerMenu == 1 and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
    eventPlayer.player_selectedSpeed = 100
    eventPlayer.setMoveSpeed(eventPlayer.player_selectedSpeed)


@Rule "| CHANGE HERO | / P.VARS: D,L /"
@Event eachPlayer
if distance(eventPlayer.getEyePosition() + vect(1.5, -0.12, 0), raycast(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * (distance(eventPlayer.getEyePosition() + vect(1.5, -0.12, 0), eventPlayer.getEyePosition())) + eventPlayer.getEyePosition(), include=null, exclude=getAllPlayers(), includePlayerObjects=true).getHitPosition()) <= 0.06 and eventPlayer.player_isInPlayerMenu == 1 and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE):
    eventPlayer.player_backupPositionArray[0] = 1
    eventPlayer.player_backupPositionArray[1] = eventPlayer.getPosition()
    eventPlayer.player_backupPositionArray[2] = vectorTowards(eventPlayer.getEyePosition(), eventPlayer.getFacingDirection() * 3 + eventPlayer.getEyePosition())
    wait(0.1)
    eventPlayer.setAllowedHeroes(getAllHeroes().exclude(eventPlayer.getCurrentHero()))


@Rule "| TELEPORT WHEN CHANGED HERO | / P.VARS: L /"
@Event eachPlayer
if eventPlayer.player_backupPositionArray[0] == 1 and eventPlayer.isInSpawnRoom():
    wait(0.025)
    eventPlayer.teleport(eventPlayer.player_backupPositionArray[1])
    eventPlayer.setFacing(eventPlayer.player_backupPositionArray[2], Relativity.TO_WORLD)
    eventPlayer.player_backupPositionArray[0] = 0
    eventPlayer.setAllowedHeroes(getAllHeroes())


"""@Rule "|----------------------------------------------------------------------| LEADER AND MODER FEATURES"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| CHECK LEADER SLOT | / P.VARS: G /"
@Event eachPlayer
if getPlayersInSlot(0, Color.TEAM_1) == eventPlayer:
    eventPlayer.player_isLeader = 1


@Rule "| START SETTINGS FOR MODER/LEADER | / P.VARS: G,C,F,H,A,J /"
@Event eachPlayer
if eventPlayer.player_isLeader > 0:
    if eventPlayer.player_isLeader == 2:
        goto lbl_0
    eventPlayer.player_selectedCamera = 1
    eventPlayer.player_selectedPhase = 1
    eventPlayer.player_selectedSpeed = 100
    lbl_0:
    if eventPlayer.player_isLeader == 1:
        goto lbl_1
    eventPlayer.player_selectedMode = 0
    eventPlayer.player_selectedPhase = 1
    destroyHudText(eventPlayer.player_textArray[2])
    destroyEffect(eventPlayer.player_textArray[4])
    destroyInWorldText(eventPlayer.player_textArray[5])
    eventPlayer.setDamageDealt(100)
    eventPlayer.setHealingDealt(100)
    lbl_1:


@Rule "| HUD, EFFECTS FOR MODER/LEADER | / P.VARS: G,H,B,J /"
@Event eachPlayer
if eventPlayer.player_isLeader > 0:
    if eventPlayer.player_isLeader == 1:
        goto lbl_0
    destroyHudText(eventPlayer.player_textArray[2])
    destroyEffect(eventPlayer.player_textArray[4])
    destroyInWorldText(eventPlayer.player_textArray[5])
    wait(0.005)
    hudHeader(eventPlayer, l"Moderate", Position.LEFT, 0, Color.YELLOW, HudReeval.STRING)
    eventPlayer.player_textArray[2] = getLastCreatedText()
    hudHeader(eventPlayer, l"Phase: {}".format(eventPlayer.player_selectedPhase), Position.LEFT, 1, Color.YELLOW, HudReeval.STRING)
    eventPlayer.player_textArray[3] = getLastCreatedText()
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer + vect(0, eventPlayer.player_textPosition + 0.175, 0), 0.15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_textArray[4] = getLastCreatedEntity()
    createInWorldText(getAllPlayers(), l"Moderate", eventPlayer + vect(0, eventPlayer.player_textPosition, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.player_textArray[5] = getLastCreatedText()
    lbl_0:
    if eventPlayer.player_isLeader == 2:
        goto lbl_1
    hudHeader(eventPlayer, l"Leader", Position.LEFT, 0, Color.RED, HudReeval.STRING)
    hudHeader(eventPlayer, l"Phase: {}".format(eventPlayer.player_selectedPhase), Position.LEFT, 1, Color.RED, HudReeval.STRING)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.RED, eventPlayer + vect(0, eventPlayer.player_textPosition + 0.175, 0), 0.15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_textArray[2] = getLastCreatedEntity()
    wait(1)
    createInWorldText(getAllPlayers(), l"Leader", eventPlayer + vect(0, eventPlayer.player_textPosition, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.player_textArray[3] = getLastCreatedText()
    lbl_1:


@Rule "| SHOW SERVER STATS TO LEADER |"
@Event global
hudHeader(getPlayersInSlot(0, Color.TEAM_1), l"Server Load:  {}%".format(getServerLoad()), Position.LEFT, 4, Color.WHITE, HudReeval.VISIBILITY_AND_STRING)
hudHeader(getPlayersInSlot(0, Color.TEAM_1),  "Load Average: {}%".format(getAverageServerLoad()), Position.LEFT, 5, Color.YELLOW, HudReeval.VISIBILITY_AND_STRING)
hudHeader(getPlayersInSlot(0, Color.TEAM_1),  "Load Peak:    {}%".format(getPeakServerLoad()), Position.LEFT, 6, Color.RED, HudReeval.VISIBILITY_AND_STRING)


@Rule "| INVINCIBLE FOR MODER/LEADER | / P.VARS: G /"
@Event eachPlayer
if eventPlayer.player_isLeader > 0:
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, getMatchTime())


@Rule "| RESTART INVINCIBLE WHEN DIED | / P.VARS: G /"
@Event playerDied
if eventPlayer.player_isLeader > 0:
    eventPlayer.clearStatusEffect(Status.PHASED_OUT)
    wait(0.05)
    eventPlayer.setStatusEffect(null, Status.PHASED_OUT, getMatchTime())


@Rule "| INFINITE ULT USING | [ALL HEROES] | / P.VARS: G /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.ULTIMATE) and (not (eventPlayer.getCurrentHero() == Hero.MEI or eventPlayer.getCurrentHero() == Hero.DVA)) and eventPlayer.player_isLeader > 0:
    eventPlayer.setUltCharge(100)


@Rule "| WHEN CROUCHING | / P.VARS: G,I /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.player_isLeader > 0:
    eventPlayer.setAbility1Enabled(false)
    eventPlayer.setAbility2Enabled(false)
    eventPlayer.disallowButton(Button.PRIMARY_FIRE)
    eventPlayer.setSecondaryFireEnabled(false)
    eventPlayer.setUltEnabled(false)
    eventPlayer.disallowButton(Button.JUMP)
    createInWorldText(eventPlayer, l"Target", eventPlayer.getPlayerClosestToReticle(Team.ALL) + vect(0, -0.15, 0), 2, Clip.NONE, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.player_lastText = getLastCreatedText()


@Rule "| WHEN NOT CROUCHING | / P.VARS: G,I /"
@Event eachPlayer
if not eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.player_isLeader > 0:
    eventPlayer.setAbility1Enabled(true)
    eventPlayer.setAbility2Enabled(true)
    if eventPlayer.player_isInPlayerMenu == 1:
        goto lbl_0
    eventPlayer.allowButton(Button.PRIMARY_FIRE)
    lbl_0:
    eventPlayer.setSecondaryFireEnabled(true)
    eventPlayer.setUltEnabled(true)
    eventPlayer.allowButton(Button.JUMP)
    destroyInWorldText(eventPlayer.player_lastText)


@Rule "| CHANGE MODES | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_1) and eventPlayer.player_isLeader > 0:
    if eventPlayer.player_selectedPhase > 9:
        goto lbl_0
    eventPlayer.player_selectedPhase++
    lbl_0:
    if eventPlayer.player_selectedPhase < 10:
        goto lbl_1
    eventPlayer.player_selectedPhase = 1
    lbl_1:


"""@Rule "|____________________ [MODE 1 (KILL)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| KILL PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 1:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).player_selectedMode == 2 or eventPlayer.getPlayerClosestToReticle(Team.ALL).player_isLeader > 0:
        goto lbl_0
    kill(eventPlayer.getPlayerClosestToReticle(Team.ALL), eventPlayer)
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| KILL ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 1:
    kill([player for player in getLivingPlayers(Team.ALL) if player.player_selectedMode == 1 or eventPlayer.player_isLeader == 0], eventPlayer)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, eventPlayer, 4)


@Rule "| RESSURECT PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 1:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).resurrect()
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).player_isLeader == 0 or eventPlayer.getPlayerClosestToReticle(Team.ALL).player_selectedMode == 1:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(null, Status.PHASED_OUT, getMatchTime())
    lbl_0:


@Rule "| RESSURECT ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_2) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 1:
    for player in getDeadPlayers(Team.ALL):
        player.resurrect()
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.BLUE, eventPlayer, 4)
    wait(0.1)
    [player for player in getAllPlayers() if player.player_isLeader > 0 or player.player_selectedMode == 2].setStatusEffect(null, Status.PHASED_OUT, getMatchTime())


"""@Rule "|____________________ [MODE 2 (TELEPORT)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| TELEPORT TO PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 2:
    eventPlayer.teleport(eventPlayer.getPlayerClosestToReticle(Team.ALL))
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| TELEPORT PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.player_isLeader == 2 and eventPlayer.player_selectedPhase == 2:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).player_isLeader > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).teleport(eventPlayer)
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| TELEPORT PLAYER | [LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 2:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).teleport(eventPlayer)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| TELEPORT ALL PLAYER'S TO LEADER | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 2:
    [player for player in getAllPlayers() if player.player_isLeader != 1].teleport(eventPlayer)
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.BLUE, eventPlayer, 5)


"""@Rule "|____________________ [MODE 3 (FREEZE)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| FREEZE PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader == 2 and eventPlayer.player_selectedPhase == 3:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).player_isLeader > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.FROZEN, getMatchTime())
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| FREEZE PLAYER | [LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 3:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.FROZEN, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| FREEZE ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 3:
    [player for player in getAllPlayers() if player.player_isLeader != 1].setStatusEffect(eventPlayer, Status.FROZEN, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, eventPlayer, 4)


@Rule "| UNFREEZE PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 3:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).clearStatusEffect(Status.FROZEN)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| UNFREEZE ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_2) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 3:
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
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader == 2 and eventPlayer.player_selectedPhase == 4:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).player_isLeader > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, getMatchTime())
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| KNOCK DOWN PLAYER | [LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 4:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| KNOCK DOWN ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 4:
    [player for player in getAllPlayers() if player.player_isLeader != 1].setStatusEffect(eventPlayer, Status.KNOCKED_DOWN, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, eventPlayer, 4)


@Rule "| LET PLAYER STAND | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 4:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).clearStatusEffect(Status.KNOCKED_DOWN)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| LET ALL PLAYER'S STAND | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_2) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 4:
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
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader == 2 and eventPlayer.player_selectedPhase == 5:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).player_isLeader > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.BURNING, getMatchTime())
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| BURN PLAYER | [LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 5:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).setStatusEffect(eventPlayer, Status.BURNING, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| BURN ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 5:
    [player for player in getAllPlayers() if player.player_isLeader != 1].setStatusEffect(eventPlayer, Status.BURNING, getMatchTime())
    playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, eventPlayer, 4)


@Rule "| UNBURN PLAYER | / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 5:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).clearStatusEffect(Status.BURNING)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)


@Rule "| UNBURN ALL PLAYER'S | [ONLY LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_2) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 5:
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
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 6:
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
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 6:
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
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ULTIMATE) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 6:
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
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.ABILITY_2) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 6:
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
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader == 2 and eventPlayer.player_selectedPhase == 7:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).player_isLeader > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).applyImpulse(eventPlayer.getFacingDirection(), 50, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    lbl_0:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


@Rule "| PUSH PLAYER | [LEADER] / P.VARS: G,H /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 7:
    eventPlayer.getPlayerClosestToReticle(Team.ALL).applyImpulse(eventPlayer.getFacingDirection(), 50, Relativity.TO_WORLD, Impulse.CANCEL_CONTRARY_MOTION)
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)


"""@Rule "|____________________ [MODE 8 (INVISIBILITY)] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| INVISIBILITY ON | / P.VARS: G,H,J,M /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.PRIMARY_FIRE) and eventPlayer.player_isLeader > 0 and eventPlayer.player_selectedPhase == 8 and eventPlayer.player_invisible == 0:
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.BLUE, eventPlayer, 1)
    wait(0.2)
    eventPlayer.setInvisibility(Invis.ALL)
    destroyInWorldText(eventPlayer.player_textArray[0])
    destroyInWorldText(eventPlayer.player_textArray[1])
    destroyEffect(eventPlayer.player_textArray[2])
    destroyInWorldText(eventPlayer.player_textArray[3])
    destroyEffect(eventPlayer.player_textArray[4])
    destroyInWorldText(eventPlayer.player_textArray[5])
    eventPlayer.player_invisible = 1


@Rule "| INVISIBILITY OFF | / P.VARS: G,H,J,M /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.player_isLeader == 2 and eventPlayer.player_selectedPhase == 8 and eventPlayer.player_invisible == 1:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)
    wait(0.2)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.YELLOW, eventPlayer + vect(0, eventPlayer.player_textPosition + 0.175, 0), 0.15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_textArray[4] = getLastCreatedEntity()
    createInWorldText(getAllPlayers(), l"Moderate", eventPlayer + vect(0, eventPlayer.player_textPosition, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.player_textArray[5] = getLastCreatedText()
    eventPlayer.player_invisible = 0


@Rule "| INVISIBILITY OFF | [LEADER] / P.VARS: G,H,J,M /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.SECONDARY_FIRE) and eventPlayer.player_isLeader == 1 and eventPlayer.player_selectedPhase == 8 and eventPlayer.player_invisible == 1:
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)
    wait(0.2)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.RED, eventPlayer + vect(0, eventPlayer.player_textPosition + 0.175, 0), 0.15, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    eventPlayer.player_textArray[2] = getLastCreatedEntity()
    createInWorldText(getAllPlayers(), l"Leader", eventPlayer + vect(0, eventPlayer.player_textPosition, 0), 1.2, Clip.SURFACES, WorldTextReeval.VISIBILITY_POSITION_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    eventPlayer.player_textArray[3] = getLastCreatedText()
    eventPlayer.player_invisible = 0


"""@Rule "|____________________ [GIVE/TAKE MODER] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| GIVE/TAKE MODER | [ONLY LEADER] / P.VARS: G,H,J,A /"
@Event eachPlayer
if eventPlayer.isHoldingButton(Button.CROUCH) and eventPlayer.isHoldingButton(Button.JUMP) and eventPlayer.player_isLeader == 1:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).player_selectedPhase > 0:
        goto lbl_0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).player_isLeader = 2
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.YELLOW, eventPlayer.getPlayerClosestToReticle(Team.ALL), 1)
    bigMessage(getAllPlayers(), "{} Raise {} -> Moderate, Congratulations!".format(eventPlayer, eventPlayer.getPlayerClosestToReticle(Team.ALL)))
    lbl_0:
    if eventPlayer.getPlayerClosestToReticle(Team.ALL).player_selectedPhase == 0:
        goto lbl_1
    eventPlayer.getPlayerClosestToReticle(Team.ALL).player_selectedPhase = 0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).player_isLeader = 0
    eventPlayer.getPlayerClosestToReticle(Team.ALL).player_invisible = 0
    destroyHudText(eventPlayer.getPlayerClosestToReticle(Team.ALL).player_textArray[2])
    destroyHudText(eventPlayer.getPlayerClosestToReticle(Team.ALL).player_textArray[3])
    destroyEffect(eventPlayer.getPlayerClosestToReticle(Team.ALL).player_textArray[4])
    destroyInWorldText(eventPlayer.getPlayerClosestToReticle(Team.ALL).player_textArray[5])
    eventPlayer.getPlayerClosestToReticle(Team.ALL).player_selectedMode = 1
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer, 1)
    playEffect(getAllPlayers(), DynamicEffect.BAD_PICKUP_EFFECT, Color.RED, eventPlayer.getPlayerClosestToReticle(Team.ALL), 1)
    eventPlayer.getPlayerClosestToReticle(Team.ALL).clearStatusEffect(Status.PHASED_OUT)
    bigMessage(getAllPlayers(), "{}: {} No Moderate!".format(eventPlayer, eventPlayer.getPlayerClosestToReticle(Team.ALL)))
    lbl_1:
