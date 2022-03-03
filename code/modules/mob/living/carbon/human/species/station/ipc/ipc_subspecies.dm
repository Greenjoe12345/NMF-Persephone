/datum/species/machine/shell
	name = SPECIES_IPC_SHELL
	hide_name = TRUE
	short_name = "jak"
	name_plural = "Shells"
	bodytype = BODYTYPE_HUMAN
	default_genders = list(MALE, FEMALE)
	selectable_pronouns = list(MALE, FEMALE, PLURAL, NEUTER)

	burn_mod = 1.2
	grab_mod = 1

	blurb = "IPCs, or Integrated Positronic Chassis, are humanoid robots with a Positronic Brain as their core processor.\
Designed in 2632 to exploit openings in the market, the \"Shell\" model is a specific style of frame with an expensive synth-flesh outer casing.\
Shells are popular in a variety of situations, though their high market cost sees them as rarer amongst less affluent or more dangerous regions.\
Despite their lifelike appearance, shells can be identified as synthetics at close inspection, even discernable in crowds with the right equipment.\
The additional weight of the synthetic skin on the original Titan frame reduces the efficacy of the unit's already strained coolant systems, increasing charge consumption."

	num_alternate_languages = 3

	icobase = 'icons/mob/human_races/human/r_human.dmi'
	deform = 'icons/mob/human_races/ipc/robotic.dmi'
	preview_icon = 'icons/mob/human_races/ipc/shell_preview.dmi'

	light_range = 0
	light_power = 0
	unarmed_types = list(
		/datum/unarmed_attack/punch/ipc,
		/datum/unarmed_attack/stomp/ipc,
		/datum/unarmed_attack/kick/ipc,
		/datum/unarmed_attack/bite
	)

	eyes = "eyes_s"
	show_ssd = "completely quiescent"

	heat_level_1 = 500
	heat_level_2 = 1000
	heat_level_3 = 2000

	heat_discomfort_level = 400
	heat_discomfort_strings = list(
		"Your CPU temperature probes warn you that you are approaching critical heat levels!",
		"Your synthetic flesh crawls in the heat, swelling into a disgusting morass of plastic."
		)

	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE | HAS_EYE_COLOR | HAS_FBP | HAS_SKIN_PRESET | HAS_UNDERWEAR | HAS_SOCKS | HAS_LIPS

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/ipc/shell),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/ipc/shell),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/ipc/shell),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/ipc/shell),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/ipc/shell),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/ipc/shell),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/ipc/shell),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/ipc/shell),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/ipc/shell),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/ipc/shell),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/ipc/shell)
		)

	base_color = "#25032"
	character_color_presets = list("Dark" = "#000000", "Warm" = "#250302", "Cold" = "#1e1e29")

	sprint_temperature_factor = 1.3
	move_charge_factor = 0.85

	inherent_verbs = list(
		/mob/living/carbon/human/proc/self_diagnostics,
		/mob/living/carbon/human/proc/check_tag,
		/mob/living/carbon/human/proc/tie_hair)

	bodyfall_sound = /decl/sound_category/bodyfall_sound

allowed_accents = list(ACCENT_RHEA, ACCENT_INTER, ACCENT_EARTH, ACCENT_LUNA, ACCENT_MARS, ACCENT_GALACTIC, ACCENT_TTS, ACCENT_TUQ)

/datum/species/machine/shell/get_species(var/reference, var/mob/living/carbon/human/H, var/records)
	if(reference)
		return src
	// it's illegal for shells in Tau Ceti space to not have tags, so their records would have to be falsified
	if(records && !H.internal_organs_by_name[BP_IPCTAG])
		return "Human"
	return name

/datum/species/machine/shell/get_light_color()
	return

/datum/species/machine/shell/handle_death(var/mob/living/carbon/human/H)
	return

/datum/species/machine/shell/rogue
	name = SPECIES_IPC_SHELL_ROGUE
	short_name = "roguejak"
	name_plural = "Rogue Shells"

	spawn_flags = IS_RESTRICTED

	break_cuffs = TRUE

	has_organ = list(
		BP_BRAIN   = /obj/item/organ/internal/mmi_holder/posibrain,
		BP_CELL    = /obj/item/organ/internal/cell,
		BP_EYES  = /obj/item/organ/internal/eyes/optical_sensor,
		"surge"   = /obj/item/organ/internal/surge/advanced
	)

	unarmed_types = list(
		/datum/unarmed_attack/stomp/ipc,
		/datum/unarmed_attack/kick/ipc,
		/datum/unarmed_attack/terminator,
		/datum/unarmed_attack/bite/strong)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/leap,
		/mob/living/carbon/human/proc/self_diagnostics
		)

/datum/species/machine/shell/rogue/check_tag(var/mob/living/carbon/human/new_machine, var/client/player)
	return

/datum/species/machine/industrial
	name = SPECIES_IPC_G1
	short_name = "ind"
	name_plural = "Industrials"
	bald = 1
	bodytype = BODYTYPE_IPC_INDUSTRIAL
	mob_size = 12

	unarmed_types = list(/datum/unarmed_attack/industrial, /datum/unarmed_attack/palm/industrial)

	brute_mod = 0.8
	burn_mod = 1.1

	grab_mod = 0.8 // Big, easy to grab onto
	resist_mod = 10 // Good luck wrestling against this powerhouse.

	slowdown = 4

	allowed_accents = list(ACCENT_RHEA, ACCENT_INTER, ACCENT_EARTH, ACCENT_LUNA, ACCENT_MARS, ACCENT_GALACTIC, ACCENT_TTS, ACCENT_TUQ)

	blurb = "IPCs, or Integrated Positronic Chassis, are humanoid robots with a Positronic Brain as their core processor. \
Following the success of the Xion frame, Titan Universal Manufacturing designed a new IPC model intended for other extreme environments and heavy workloads. \
Designed for extra durability and increased weight loads, the first generation heavy Industrial was considered a success, though it possessed some issues. \
A limited power cell and actuators designed for heavy lifting over locomotion resulted in a slow and frequently charging machine. \
A special addition to the chassis makes up for these drawbacks; the ability to simply slot a suit cooling unit onto the model's back \
and make use of its built-in heat transferal conduits, allowing the Industrial frame to perform EVA without any extra peripherals such as a voidsuit. \
Its sturdy and reliable frame, strength, and easy temperature control make the G1 a frequent sight in both heavy industry and \
frontier operations since their release in 2595. Due to their design for hard simple labor, G1s are rarely seen as self-owned."

	icobase = 'icons/mob/human_races/ipc/r_industrial.dmi'
	deform = 'icons/mob/human_races/ipc/r_industrial.dmi'
	preview_icon = 'icons/mob/human_races/ipc/industrial_preview.dmi'

	eyes = "eyes_industry"
	show_ssd = "completely quiescent"

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/ipc/industrial),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/ipc/industrial),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/ipc/industrial),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/ipc/industrial),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/ipc/industrial),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/ipc/industrial),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/ipc/industrial),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/ipc/industrial),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/ipc/industrial),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/ipc/industrial),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/ipc/industrial)
		)

	flags = IS_IPC | ACCEPTS_COOLER
	appearance_flags = HAS_EYE_COLOR | HAS_UNDERWEAR | HAS_SOCKS

	heat_level_1 = 800
	heat_level_2 = 1600
	heat_level_3 = 3200

	heat_discomfort_level = 700

	sprint_speed_factor = 1.4
	sprint_temperature_factor = 0.9
	move_charge_factor = 1.1

	inherent_verbs = list(
		/mob/living/carbon/human/proc/self_diagnostics,
		/mob/living/carbon/human/proc/check_tag
		)

/datum/species/machine/industrial/get_light_color()
	return LIGHT_COLOR_TUNGSTEN

/datum/species/machine/industrial/handle_death(var/mob/living/carbon/human/H)
	return

/datum/species/machine/terminator
	name = SPECIES_IPC_TERMINATOR
	short_name = "hks"
	name_plural = "HKs"
	bald = 1
	bodytype = BODYTYPE_IPC_INDUSTRIAL

	blurb = "\[REDACTED\]"

	icobase = 'icons/mob/human_races/ipc/r_terminator.dmi'
	deform = 'icons/mob/human_races/ipc/r_terminator.dmi'

	light_range = 0
	light_power = 0

	unarmed_types = list(/datum/unarmed_attack/terminator)
	rarity_value = 20

	language = LANGUAGE_TERMINATOR
	name_language = LANGUAGE_TERMINATOR

	eyes = "eyes_terminator"
	has_floating_eyes = 1

	brute_mod = 0.3
	burn_mod = 0.5

	grab_mod = 0.9
	resist_mod = 10

	flash_mod = 0
	siemens_coefficient = 0
	break_cuffs = TRUE
	mob_size = 20

	show_ssd = "laying inert, its activation glyph dark"

	death_sound = 'sound/effects/bang.ogg'
	death_message = "collapses to the ground with a CLUNK, and begins to beep ominously."
	death_message_range = 7

	heat_level_1 = 1500
	heat_level_2 = 2000
	heat_level_3 = 5000

	body_temperature = null
	passive_temp_gain = 0

	flags = IS_IPC | ACCEPTS_COOLER
	spawn_flags = IS_RESTRICTED
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_SOCKS
	vision_flags = DEFAULT_SIGHT | SEE_MOBS

	reagent_tag = IS_MACHINE

	inherent_verbs = list(
		/mob/living/carbon/human/proc/self_destruct,
		/mob/living/carbon/human/proc/detonate_flechettes,
		/mob/living/carbon/human/proc/state_laws,
		/mob/living/carbon/human/proc/self_diagnostics
	)

	has_organ = list(
		BP_BRAIN = /obj/item/organ/internal/mmi_holder/posibrain/terminator,
		"shielded cell" = /obj/item/organ/internal/cell/terminator,
		BP_EYES = /obj/item/organ/internal/eyes/optical_sensor/terminator,
		"data core" = /obj/item/organ/internal/data,
		"surge"   = /obj/item/organ/internal/surge/advanced
	)

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/terminator),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/terminator),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/terminator),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/terminator),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/terminator),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/terminator),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/terminator),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/terminator),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/terminator),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/terminator),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/terminator)
		)


	heat_discomfort_level = 2000
	heat_discomfort_strings = list(
		"Your CPU temperature probes warn you that you are approaching critical heat levels!"
		)
	stamina	= -1
	sprint_speed_factor = 1.25
	sprint_cost_factor = 1
	slowdown = 1

	sprint_temperature_factor = 0.6
	move_charge_factor = 0.3

/datum/species/machine/terminator/get_light_color()
	return

/datum/species/machine/terminator/handle_death(var/mob/living/carbon/human/H)
	..()
	playsound(H.loc, 'sound/items/countdown.ogg', 125, 1)
	spawn(15)
		explosion(H.loc, -1, 1, 5)
		H.gib()

// -- Branded units --

/datum/species/machine/industrial/hephaestus
	name = SPECIES_IPC_G2
	short_name = "hif"
	bodytype = BODYTYPE_IPC_INDUSTRIAL

	icobase = 'icons/mob/human_races/ipc/r_ind_hephaestus.dmi'
	deform = 'icons/mob/human_races/ipc/r_ind_hephaestus.dmi'
	preview_icon = 'icons/mob/human_races/ipc/ind_hephaestus_preview.dmi'

	eyes = "heph_eyes"

	unarmed_types = list(/datum/unarmed_attack/industrial/heavy, /datum/unarmed_attack/palm/industrial)

	slowdown = 6
	brute_mod = 0.7
	grab_mod = 0.7 // Bulkier and bigger than the G1
	resist_mod = 12 // Overall stronger than G1

	heat_level_1 = 1000
	heat_level_2 = 2000
	heat_level_3 = 4000

	heat_discomfort_level = 900

	inherent_verbs = list(
		/mob/living/carbon/human/proc/self_diagnostics,
		/mob/living/carbon/human/proc/check_tag
	)

	examine_color = "#688359"

	allowed_accents = list(ACCENT_RHEA, ACCENT_INTER, ACCENT_EARTH, ACCENT_LUNA, ACCENT_MARS, ACCENT_GALACTIC, ACCENT_TTS, ACCENT_TUQ)

	blurb = "IPCs, or Integrated Positronic Chassis, are humanoid robots with a Positronic Brain as their core processor. \
An extremely durable and heavy Industrial model branded by Titan Universal Manufacturing, rolled out in 2623. \
The second-generation industrial frame made multiple improvements over the previous model, featuring thicker plating and an improved power cell. \
Its actuators struggle to carry the immense weight, making the unit quite slow. \
This chassis is seen in roles where it is too dangerous or inefficient to use a less durable alternative. Popular roles include engineering, security, \
and mining. While this unit still possesses built-in cooling conduits, the \
increased plating proved a difficult challenge for the engineers to develop good cooling, so the unit suffers somewhat from increased heat loads. \
Overtaxing its hardware will quickly lead to overheating. Like its predecessor, the G2 is common in the frontier and rarely self-owned."

	has_limbs = list(
		BP_CHEST  = list("path" = /obj/item/organ/external/chest/ipc/industrial/hephaestus),
		BP_GROIN  = list("path" = /obj/item/organ/external/groin/ipc/industrial/hephaestus),
		BP_HEAD   = list("path" = /obj/item/organ/external/head/ipc/industrial/hephaestus),
		BP_L_ARM  = list("path" = /obj/item/organ/external/arm/ipc/industrial/hephaestus),
		BP_R_ARM  = list("path" = /obj/item/organ/external/arm/right/ipc/industrial/hephaestus),
		BP_L_LEG  = list("path" = /obj/item/organ/external/leg/ipc/industrial/hephaestus),
		BP_R_LEG  = list("path" = /obj/item/organ/external/leg/right/ipc/industrial/hephaestus),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/ipc/industrial/hephaestus),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/ipc/industrial/hephaestus),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/ipc/industrial/hephaestus),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/ipc/industrial/hephaestus)
	)


/datum/species/machine/industrial/hephaestus/get_light_color(mob/living/carbon/human/H)
	if (istype(H))
		return rgb(H.r_eyes, H.g_eyes, H.b_eyes)

/datum/species/machine/industrial/xion
	name = SPECIES_IPC_XION
	short_name = "xmf"
	bodytype = BODYTYPE_IPC_INDUSTRIAL

	icobase = 'icons/mob/human_races/ipc/r_ind_xion.dmi'
	deform = 'icons/mob/human_races/ipc/r_ind_xion.dmi'
	preview_icon = 'icons/mob/human_races/ipc/ind_xion_preview.dmi'

	unarmed_types = list(
		/datum/unarmed_attack/industrial/xion,
		/datum/unarmed_attack/palm/industrial
	)

	brute_mod = 0.9
	grab_mod = 0.9
	resist_mod = 8

	heat_level_1 = 700
	heat_level_2 = 1400
	heat_level_3 = 2800

	heat_discomfort_level = 600
	slowdown = 3

	eyes = "xion_eyes"
	flags = IS_IPC
	passive_temp_gain = 0

	examine_color = "#bc4b00"

	allowed_accents = list(ACCENT_RHEA, ACCENT_INTER, ACCENT_EARTH, ACCENT_LUNA, ACCENT_MARS, ACCENT_GALACTIC, ACCENT_TTS, ACCENT_TUQ)

	blurb = "IPCs, or Integrated Positronic Chassis, are humanoid robots with a Positronic Brain as their core processor. \
The \"Xion\" model is the first specialized Titan Universal Manufacturing IPC. \
Designed to handle the extreme conditions of Titan, the Xion frame is capable of efficiently operating in lower temperatures without risk of damage to its \
systems, allowing them to maintain and service Titans automated structures with little upkeep. \
Sturdy and strong, this chassis is quite powerful and equally durable, with an ample power cell and improved \
actuators for carrying the increased weight of the body. Designed for cooler environments, the Xion suffers in warmer climates. \
Upgrades to their meek cooling systems are considered necessary for operation at room temperature and even then cause the Xion to be more sluggish. \
T.U.M. first produced these frames for its own use only in 2590, starting the export of the specialized IPC in 2598."


	has_limbs = list(
		BP_CHEST  = list("path" = /obj/item/organ/external/chest/ipc/industrial/xion),
		BP_GROIN  = list("path" = /obj/item/organ/external/groin/ipc/industrial/xion),
		BP_HEAD   = list("path" = /obj/item/organ/external/head/ipc/industrial/xion),
		BP_L_ARM  = list("path" = /obj/item/organ/external/arm/ipc/industrial/xion),
		BP_R_ARM  = list("path" = /obj/item/organ/external/arm/right/ipc/industrial/xion),
		BP_L_LEG  = list("path" = /obj/item/organ/external/leg/ipc/industrial/xion),
		BP_R_LEG  = list("path" = /obj/item/organ/external/leg/right/ipc/industrial/xion),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/ipc/industrial/xion),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/ipc/industrial/xion),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/ipc/industrial/xion),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/ipc/industrial/xion)
	)

/datum/species/machine/industrial/xion/remote
	name = SPECIES_IPC_XION_REMOTE
	short_name = "rem_xmf"

	spawn_flags = IS_RESTRICTED

	has_organ = list(
		BP_BRAIN   = /obj/item/organ/internal/mmi_holder/circuit,
		BP_CELL    = /obj/item/organ/internal/cell,
		BP_EYES  = /obj/item/organ/internal/eyes/optical_sensor,
		BP_IPCTAG = /obj/item/organ/internal/ipc_tag
	)

/datum/species/machine/industrial/xion/get_light_color(mob/living/carbon/human/H)
	if (istype(H))
		return rgb(H.r_eyes, H.g_eyes, H.b_eyes)

/datum/species/machine/zenghu
	name = SPECIES_IPC_ZENGHU
	short_name = "zhf"
	bodytype = BODYTYPE_IPC_ZENGHU

	icobase = 'icons/mob/human_races/ipc/r_ind_zenghu.dmi'
	deform = 'icons/mob/human_races/ipc/r_ind_zenghu.dmi'
	preview_icon = 'icons/mob/human_races/ipc/ind_zenghu_preview.dmi'

	eyes = "zenghu_eyes"
	brute_mod = 1.5

	slowdown = -0.8
	sprint_speed_factor = 0.6
	sprint_cost_factor = 2
	move_charge_factor = 2

	grab_mod = 1.1 // Smooth, fast
	resist_mod = 4 // Not super strong, but still rather strong

	allowed_accents = list(ACCENT_RHEA, ACCENT_INTER, ACCENT_EARTH, ACCENT_LUNA, ACCENT_MARS, ACCENT_GALACTIC, ACCENT_TTS, ACCENT_TUQ)

	appearance_flags = HAS_EYE_COLOR | HAS_UNDERWEAR | HAS_SOCKS

	examine_color = "#ff00ff"

	blurb = ""

	has_limbs = list(
		BP_CHEST  = list("path" = /obj/item/organ/external/chest/ipc/industrial/zenghu),
		BP_GROIN  = list("path" = /obj/item/organ/external/groin/ipc/industrial/zenghu),
		BP_HEAD   = list("path" = /obj/item/organ/external/head/ipc/industrial/zenghu),
		BP_L_ARM  = list("path" = /obj/item/organ/external/arm/ipc/industrial/zenghu),
		BP_R_ARM  = list("path" = /obj/item/organ/external/arm/right/ipc/industrial/zenghu),
		BP_L_LEG  = list("path" = /obj/item/organ/external/leg/ipc/industrial/zenghu),
		BP_R_LEG  = list("path" = /obj/item/organ/external/leg/right/ipc/industrial/zenghu),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/ipc/industrial/zenghu),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/ipc/industrial/zenghu),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/ipc/industrial/zenghu),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/ipc/industrial/zenghu)
	)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/self_diagnostics,
		/mob/living/carbon/human/proc/check_tag
		)


/datum/species/machine/zenghu/get_light_color(mob/living/carbon/human/H)
	if (istype(H))
		return rgb(H.r_eyes, H.g_eyes, H.b_eyes)

/datum/species/machine/bishop
	name = SPECIES_IPC_BISHOP
	short_name = "bcf"
	bodytype = BODYTYPE_IPC_BISHOP

	icobase = 'icons/mob/human_races/ipc/r_ind_bishop.dmi'
	deform = 'icons/mob/human_races/ipc/r_ind_bishop.dmi'
	preview_icon = 'icons/mob/human_races/ipc/ind_bishop_preview.dmi'

	eyes = "bishop_eyes"
	eyes_icon_blend = ICON_MULTIPLY

	brute_mod = 1.2
	grab_mod = 1.1
	resist_mod = 4
	num_alternate_languages = 3

	appearance_flags = HAS_EYE_COLOR | HAS_UNDERWEAR | HAS_SOCKS

	examine_color = "#00afea"

	blurb = "IPCs, or Integrated Positronic Chassis, are humanoid robots with a Positronic Brain as their core processor. \
Cutting-edge technology in power management means this frame can operate longer while running more demanding processing algorithms than most. \
This extreme push to minimize power draw means this frame can be equipped with all sorts of extra equipment such as a holographic \
faceplate, flashing status displays and embedded lights solely meant for show and, most importantly, secondary processing and storing capacities. \
Like other Taylor models, this frame suffers the same common criticism leveled against almost all Taylor frames, \
the shiny chrome and glass meant to put all of this tech on display mean it's exposed and fragile. \
It's because of their pursuit of cutting edge and specialization designs that these frames often suffer from issues with reliability \
and struggle to safely perform the same work as cheaper, more rugged frames. However, due to their additional tech supporting their positronic brain, \
Bishops are excellent for mental tasks such as accounting or science. Ever since their introduction in \
2614, Bishop Frames are a common sight where mental faculties are key. Most Bishop Frames end up Independent due to the nature of their work."

	has_limbs = list(
		BP_CHEST  = list("path" = /obj/item/organ/external/chest/ipc/industrial/bishop),
		BP_GROIN  = list("path" = /obj/item/organ/external/groin/ipc/industrial/bishop),
		BP_HEAD   = list("path" = /obj/item/organ/external/head/ipc/industrial/bishop),
		BP_L_ARM  = list("path" = /obj/item/organ/external/arm/ipc/industrial/bishop),
		BP_R_ARM  = list("path" = /obj/item/organ/external/arm/right/ipc/industrial/bishop),
		BP_L_LEG  = list("path" = /obj/item/organ/external/leg/ipc/industrial/bishop),
		BP_R_LEG  = list("path" = /obj/item/organ/external/leg/right/ipc/industrial/bishop),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/ipc/industrial/bishop),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/ipc/industrial/bishop),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/ipc/industrial/bishop),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/ipc/industrial/bishop)
	)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/self_diagnostics,
		/mob/living/carbon/human/proc/check_tag
		)


	allowed_accents = list(ACCENT_RHEA, ACCENT_INTER, ACCENT_EARTH, ACCENT_LUNA, ACCENT_MARS, ACCENT_GALACTIC, ACCENT_TTS, ACCENT_TUQ)

/datum/species/machine/bishop/get_light_color(mob/living/carbon/human/H)
	if (istype(H))
		return rgb(H.r_eyes, H.g_eyes, H.b_eyes)

/datum/species/machine/unbranded
	name = SPECIES_IPC_UNBRANDED
	short_name = "unbran"
	name_plural = "Unbranded Frames"

	blurb = "A simple and archaic robotic frame, used mostly as a temporary body before posibrains are transferred to any specialized chassis."

	icobase = 'icons/mob/human_races/ipc/robotic.dmi'
	deform = 'icons/mob/human_races/ipc/robotic.dmi'
	eyes = "eyes_s"

	bald = 1
	grab_mod = 1.1 //pity points - geeves

	appearance_flags = HAS_EYE_COLOR
	spawn_flags = IS_RESTRICTED

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/ipc/unbranded),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/ipc/unbranded),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/ipc/unbranded),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/ipc/unbranded),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/ipc/unbranded),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/ipc/unbranded),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/ipc/unbranded),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/ipc/unbranded),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/ipc/unbranded),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/ipc/unbranded),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/ipc/unbranded)
	)

	inherent_verbs = list(
		/mob/living/carbon/human/proc/self_diagnostics,
		/mob/living/carbon/human/proc/check_tag
		)

/datum/species/machine/unbranded/remote
	name = SPECIES_IPC_UNBRANDED_REMOTE
	short_name = "rem_unbran"
	name_plural = "Remote Unbranded Frames"

	spawn_flags = IS_RESTRICTED

	has_organ = list(
		BP_BRAIN   = /obj/item/organ/internal/mmi_holder/circuit,
		BP_CELL    = /obj/item/organ/internal/cell,
		BP_EYES  = /obj/item/organ/internal/eyes/optical_sensor,
		BP_IPCTAG = /obj/item/organ/internal/ipc_tag
	)

/datum/species/machine/unbranded/get_light_color(mob/living/carbon/human/H)
	if (istype(H))
		return rgb(H.r_eyes, H.g_eyes, H.b_eyes)
