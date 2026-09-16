portrait_hide
wait(20)
portrait_off


$story_stats["ForceChcgMode"] = 1
chcg_background_color(0,100,200,80)
basicX = 80



$game_NPC_actors["Cocona"].stat["EventExt1Race"] = "Lona"
$game_NPC_actors["Cocona"].stat["EventExt1"] = "HeadPat1"
$game_NPCLayerMain.prtmood("CoconaHeadFocus_flirty")
$game_portraits.setRprt("NPCLayerMain")
$game_NPCLayerMain.portrait.update
call_msg("CompCocona:Cocona/HeatPatA_7")
$game_NPCLayerMain.prtmood("CoconaHeadFocus_triumph")
$game_portraits.rprt.shake
SndLib.sound_equip_armor
call_msg("CompCocona:Cocona/HeatPatB_2")


result = mini_game_ddr_cocona_headpat(300,true)

#0 failed
#1 okay
#2 great
#>=3 feverMode  if arousal >= will || arousal >= will * 0.5

#------------------------------------------------------------- UPDATE BY MOD: Cocona XP Headpat Farm
if result >= 1 # only recieves if you pat her good enought!
	tmpExpFinal = ((result*700) + ($game_player.actor.level*30)).round
	$game_player.actor.gain_exp(tmpExpFinal)
	call_msg("You have gained #{tmpExpFinal} XP for petting the best girl!")
end
#-------------------------------------------------------------

#if result == 3 && $game_NPC_actors["Cocona"].arousal >= $game_NPC_actors["Cocona"].will
#	result = 4
#elsif result == 3 && $game_NPC_actors["Cocona"].arousal >= $game_NPC_actors["Cocona"].will * 0.5
#	result = 3
#elsif result == 3
#	result = 2
#end


p result
$game_NPC_actors["Cocona"].stat["EventExt1"] = "HeadPat1"
case result 
	when 0 #failed
		$game_NPCLayerMain.prtmood("CoconaHeadFocus_flirty")
		call_msg("CompCocona:Cocona/HeatPatB_failed_3")
		
		$game_NPCLayerMain.prtmood("CoconaHeadFocus_triumph")
		call_msg("CompCocona:Cocona/HeatPatB_failed_4")
	when 1,2 #success origianl.  shes happy
		$game_NPCLayerMain.prtmood("CoconaHeadFocus_triumph")
		call_msg("CompCocona:Cocona/HeatPatB_success_3")
		
		$game_NPCLayerMain.prtmood("CoconaHeadFocus_triumph")
		$game_portraits.rprt.shake
		
		call_msg("CompCocona:Cocona/HeatPatB_success_4")
		
		$game_NPC_actors["Cocona"].map_token.npc_story_mode(true)
		$game_NPC_actors["Cocona"].map_token.jump_to($game_NPC_actors["Cocona"].map_token.x,$game_NPC_actors["Cocona"].map_token.y)
		call_msg("CompCocona:Cocona/HeatPat_End")
		wait(20)
		$game_NPC_actors["Cocona"].map_token.npc_story_mode(false)
		
	when 3 #gets wet
		$game_NPC_actors["Cocona"].add_state("EffectWet") if $game_NPC_actors["Cocona"].source_actor.stat["EffectWet"] == 0
		$game_NPCLayerMain.prtmood("CoconaHeadFocus_lewd")
		$game_portraits.rprt.shake
		call_msg("CompCocona:Cocona/HeatPatB_wet_3")
	else # 5  #orgasm
		$game_NPCLayerMain.prtmood("CoconaHeadFocus_pain")
		$game_portraits.rprt.shake
		call_msg("CompCocona:Cocona/HeatPatB_orgasm_3")
		$game_NPCLayerMain.prtmood("CoconaHeadFocus_sexhurt")
		$game_portraits.rprt.shake
		call_msg("CompCocona:Cocona/HeatPatB_orgasm_4")
end

$game_NPC_actors["Cocona"].map_token.refresh
$game_NPC_actors["Cocona"].map_token.actor.checkOev_NPC_actor(parallel=false)
$game_NPC_actors["Cocona"].event_key_cleaner
$story_stats["ForceChcgMode"] = 0
portrait_off
eventPlayEnd

