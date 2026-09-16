$imported ||= {}
$imported[:CoconaPatsGivesXp] = "ModScripts/_Mods/CoconaPatsGivesXp/"

# Cocona gives high XP when patted!
$mod_load_script["Data/HCGframes/event/HevCoconaHeadPat.rb"] = "#{$imported[:CoconaPatsGivesXp]}Scripts/HevCoconaHeadPat.rb"
$mod_load_script["Data/HCGframes/event/HevCoconaHeadPatAgain.rb"] = "#{$imported[:CoconaPatsGivesXp]}Scripts/HevCoconaHeadPatAgain.rb"