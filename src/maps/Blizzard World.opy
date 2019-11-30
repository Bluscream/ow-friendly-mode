#!define isCorrectMap() getCurrentMap() == Map.BLIZZ_WORLD or getCurrentMap() == Map.BLIZZ_WORLD_WINTER\

"""@Rule "|-----------------------------------------------------------------------------------| TELEPORTS"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| EFFECTS |"
@Event global
if (isCorrectMap()):
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.WHITE, vect(-83.608, 2.194, 100.341), 1, IconReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.WHITE, vect(7.141, -2.547, -24.617), 1, IconReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.WHITE, vect(2.966, 3.444, 64.509), 1, IconReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.GOOD_AURA, Color.WHITE, vect(-118.891, 1.19, 99.537), 1, IconReeval.VISIBILITY)


@Rule "| FROM SPAWN |"
@Event eachPlayer
if (isCorrectMap()):
    if (distance(eventPlayer, vect(-83.608, 2.194, 100.341)) <= 1.8 or distance(eventPlayer, vect(7.141, -2.547, -24.617)) <= 1.8):
        eventPlayer.teleport(vect(3.129, 2, 79.301))
        eventPlayer.setFacing(vectorTowards(vect(3.129, 3.444, 79.301), vect(3.121, 3.444, 78.419)), Relativity.TO_WORLD)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.WHITE, eventPlayer, 1)
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.WHITE, eventPlayer, 4)


@Rule "| TO LAST POINT |"
@Event eachPlayer
if (isCorrectMap()):
    if distance(eventPlayer, vect(2.966, 3.444, 64.509)) <= 1.8:
        eventPlayer.teleport(vect(-122.073, 0, 110.535))
        playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.WHITE, eventPlayer, 1)
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.WHITE, eventPlayer, 4)


@Rule "| FROM LAST POINT |"
@Event eachPlayer
if (isCorrectMap()):
    if distance(eventPlayer, vect(-118.891, 1.19, 99.537)) <= 1.8:
        eventPlayer.teleport(vect(3.129, 2, 79.301))
        eventPlayer.setFacing(vectorTowards(vect(3.129, 3.444, 79.301), vect(3.121, 3.444, 78.419)), Relativity.TO_WORLD)
        playEffect(getAllPlayers(), DynamicEffect.GOOD_PICKUP_EFFECT, Color.WHITE, eventPlayer, 1)
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.WHITE, eventPlayer, 4)


"""@Rule "|____________________ [SOUNDS] ____________________|"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| FROM SPAWN |"
@Event global
if (isCorrectMap()):
    if (any([distance(player, vect(-83.608, 2.194, 100.341)) <= 1.8 or distance(player, vect(7.141, -2.547, -24.617)) <= 1.8 for player in getAllPlayers()])):
        wait(0.06)
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(3.129, 3.444, 79.301), 80)


@Rule "| TO LAST POINT |"
@Event global
if (isCorrectMap()):
    if any([distance(player, vect(2.966, 3.444, 64.509)) <= 1.8 for player in getAllPlayers()]):
        wait(0.06)
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(-122.073, 1.294, 110.535), 80)


@Rule "| FROM LAST POINT |"
@Event global
if (isCorrectMap()):
    if any([distance(player, vect(-118.891, 1.191, 99.537)) <= 1.8 for player in getAllPlayers()]):
        wait(0.06)
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION_SOUND, Color.WHITE, vect(3.129, 3.444, 79.301), 80)


"""@Rule "|--------------------------------------------------------------------------------| ENTER PLACES"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| EFFECTS |"
@Event global
if (isCorrectMap()):
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, vect(-57.348, 2.19, 140.761), 0.8, IconReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, vect(-54.793, 1.712, 141.541), 0.8, IconReeval.VISIBILITY)
    createInWorldText(getAllPlayers(), l"Inside", vect(-57.348, 2.19, 140.761), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), l"Outside", vect(-54.793, 1.712, 141.541), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createEffect(getAllPlayers(), Effect.RING, Color.BLUE, vect(-12.527, -2.653, -30.934), 0.8, IconReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.RING, Color.RED, vect(-12.498, -2.556, -34.193), 0.8, IconReeval.VISIBILITY)
    createInWorldText(getAllPlayers(), l"Inside", vect(-12.527, -2.653, -30.934), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getAllPlayers(), l"Outside", vect(-12.498, -2.556, -34.193), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createEffect(getPlayers(Color.TEAM_2), Effect.RING, Color.BLUE, vect(-80.156, 2.232, 97.298), 0.8, IconReeval.VISIBILITY)
    createEffect(getPlayers(Color.TEAM_2), Effect.RING, Color.RED, vect(-83.774, 2.194, 96.151), 0.8, IconReeval.VISIBILITY)
    createInWorldText(getPlayers(Color.TEAM_2), l"Inside", vect(-80.156, 2.233, 97.298), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getPlayers(Color.TEAM_2), l"Outside", vect(-83.774, 2.194, 96.151), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createEffect(getPlayers(Color.TEAM_1), Effect.RING, Color.BLUE, vect(3.042, -2.547, -19.364), 0.8, IconReeval.VISIBILITY)
    createEffect(getPlayers(Color.TEAM_1), Effect.RING, Color.RED, vect(3.05, -2.547, -21.679), 0.8, IconReeval.VISIBILITY)
    createInWorldText(getPlayers(Color.TEAM_1), l"Inside", vect(3.042, -2.547, -19.364), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)
    createInWorldText(getPlayers(Color.TEAM_1), l"Outside", vect(3.05, -2.547, -21.679), 1.2, Clip.SURFACES, HudReeval.VISIBILITY_AND_STRING, Color.WHITE, SpecVisibility.DEFAULT)


@Rule "| ENTER BUILIDING 1 |"
@Event eachPlayer
if (isCorrectMap()):
    if distance(eventPlayer, vect(-57.348, 2.19, 140.761)) <= 1.55:
        eventPlayer.teleport(vect(-53.065, -0.2, 142.039))
        smallMessage(eventPlayer, l"Inside")


@Rule "| EXIT BUILIDING 1 |"
@Event eachPlayer
if (isCorrectMap()):
    if distance(eventPlayer, vect(-54.793, 1.2, 141.541)) <= 1.55:
        eventPlayer.teleport(vect(-59.237, 0.6, 140.196))
        smallMessage(eventPlayer, l"Outside")


@Rule "| ENTER OUT OF MAP GATES |"
@Event eachPlayer
if (isCorrectMap()):
    if distance(eventPlayer, vect(-12.527, -2.653, -30.934)) <= 1.55:
        eventPlayer.teleport(vect(-12.498, -4.1, -35.825))
        smallMessage(eventPlayer, l"Inside")


@Rule "| EXIT OUT OF MAP GATES |"
@Event eachPlayer
if (isCorrectMap()):
    if distance(eventPlayer, vect(-12.498, -2.556, -34.193)) <= 1.55:
        eventPlayer.teleport(vect(-12.581, -4, -29.561))
        smallMessage(eventPlayer, l"Outside")


@Rule "| ENTER TEAM 1 SPAWN |"
@Event eachPlayer
if (isCorrectMap()):
    if distance(eventPlayer, vect(-80.156, 2.232, 97.298)) <= 1.55 and eventPlayer.getTeam() == Color.TEAM_2:
        eventPlayer.teleport(vect(-84.938, 0.8, 95.778))
        smallMessage(eventPlayer, l"Inside")


@Rule "| EXIT TEAM 1 SPAWN |"
@Event eachPlayer
if (isCorrectMap()):
    if distance(eventPlayer, vect(-83.774, 2.194, 96.151)) <= 1.55 and eventPlayer.getTeam() == Color.TEAM_2:
        eventPlayer.teleport(vect(-78.062, 0.8, 97.734))
        smallMessage(eventPlayer, l"Outside")


@Rule "| ENTER TEAM 2 SPAWN |"
@Event eachPlayer
if (isCorrectMap()):
    if distance(eventPlayer, vect(3.042, -2.547, -19.364)) <= 1.55 and eventPlayer.getTeam() == Color.TEAM_1:
        eventPlayer.teleport(vect(3.035, -4, -23.567))
        smallMessage(eventPlayer, l"Inside")


@Rule "| EXIT TEAM 2 SPAWN |"
@Event eachPlayer
if (isCorrectMap()):
    if distance(eventPlayer, vect(3.05, -2.547, -21.679)) <= 1.55 and eventPlayer.getTeam() == Color.TEAM_1:
        eventPlayer.teleport(vect(3.055, -4, -17.117))
        smallMessage(eventPlayer, l"Outside")


"""@Rule "|---------------------------------------------------------------------------------| DANCE FLOOR"
@Event eachPlayer
@Team 1
@Slot 0
"""

@Rule "| EFFECTS | / G.VARS: A /"
@Event global
if (isCorrectMap()):
    createEffect(getAllPlayers(), Effect.SPARKLES, Color.RED, vect(3.007, 6.5, 41.956), 6, IconReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.SPARKLES, Color.PURPLE, vect(3.007, 4.5, 41.956), 6, IconReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.SPARKLES, Color.GREEN, vect(3.007, 2.5, 41.956), 6, IconReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.SPARKLES, Color.YELLOW, vect(3.007, 0.5, 41.956), 6, IconReeval.VISIBILITY)
    createEffect(getAllPlayers(), Effect.RING, Color.PURPLE, vect(3.007, 0.5, 41.956), A, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)
    createEffect(getAllPlayers(), Effect.LIGHT_SHAFT, Color.PURPLE, vect(3.007, -1, 41.956), A, EffectReeval.VISIBILITY_POSITION_AND_RADIUS)


@Rule "| LOOP EFFECTS |"
@Event global
if (isCorrectMap()):
    do:
        wait(0.365)
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.YELLOW, vect(3.007, 0.6, 41.956), 11)
        wait(0.365)
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.GREEN, vect(3.007, 0.6, 41.956), 12)
        wait(0.365)
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.PURPLE, vect(3.007, 0.6, 41.956), 13)
        wait(0.365)
        playEffect(getAllPlayers(), DynamicEffect.RING_EXPLOSION, Color.RED, vect(3.007, 0.6, 41.956), 14)
    while true


@Rule "| CHASE G.VAR A | / G.VARS: A /"
@Event global
if (isCorrectMap()):
    do:
        wait(3)
        chase(A, 7, duration=3, ChaseReeval.DESTINATION_AND_DURATION)
        wait(3)
        chase(A, 3.5, duration=3, ChaseReeval.DESTINATION_AND_DURATION)
    while true