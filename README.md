# CoconaPatsGivesXp MOD for the game LonaRPG

## Why?

I'm a casual man, i see Cocona, i give Cocona headpats, why not gain XP for it? Why not make so it's a possible way to farm XP?

Also, it scales with how good you make the pats and your level.

High level, better pats, better reward.

You should get around 1k or 2k of xp normaly, but can go up 4k if you are high level or did the minigame good enought!

## Instalation

Download the file in the release, and extract it in your `LonaRPG/ModScripts/_Mods` folder

It should be: `LonaRPG/ModScripts/_Mods/CoconaPatsGivesXp`

Make sure the folder name is exact "CoconaPatsGivesXp"!

## Requirements

I tested only on the version i have: `B.0.10.8.05` but might work on other version.

## How it work, and how you can mod it yourself:

- look for the files "Data/HCGframes/event/HevCoconaHeadPat.rb" and "Data/HCGframes/event/HevCoconaHeadPatAgain.rb"
- look for the function "mini_game_ddr_cocona_headpat" in the code
- Make sure the result of the minigame is stored in a variable like this: "result = mini_game_ddr_cocona_headpat"
- Add the following block of code below the minigame:

```
if result >= 1 
	tmpExpFinal = ((result*700) + ($game_player.actor.level*30)).round
	$game_player.actor.gain_exp(tmpExpFinal)
	call_msg("You have gained #{tmpExpFinal} XP for petting the best girl!")
end
```

The result can be 0 if you fail... and if you fail, no reward! :C

If you dont like the message everytime saying the xp gained (call_msg), you can just remove call_msg or adding a # at the start of the "call_msg" line!

## Have ideas?

Feel free to tell me suggestions ^^ and all cudos to LonaRPG devs for this great game!
