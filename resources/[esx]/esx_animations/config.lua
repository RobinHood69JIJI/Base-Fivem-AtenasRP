Config = {}

Config.Animations = {
	
	{
		name  = 'fiestas',
		label = 'Fiesta',
		items = {
	    	{label = "Fumar", type = "anim", data = {anim = "WORLD_HUMAN_SMOKING"}},
	    	{label = "Musico", type = "scenario", data = {anim = "WORLD_HUMAN_MUSICIAN"}},
	    	{label = "Dj", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@dj", anim = "dj"}},
	    	{label = "Cafe", type = "scenario", data = {anim = "WORLD_HUMAN_DRINKING"}},
	    	{label = "Cerveza", type = "scenario", data = {anim = "WORLD_HUMAN_PARTYING"}},
	    	{label = "Guitarra", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@air_guitar", anim = "air_guitar"}},
	    	{label = "Hacer el amor", type = "anim", data = {lib = "anim@mp_player_intcelebrationfemale@air_shagging", anim = "air_shagging"}},
	    	{label = "Rock'n'roll", type = "anim", data = {lib = "mp_player_int_upperrock", anim = "mp_player_int_rock"}},
	    	-- {label = "Fumer un joint", type = "scenario", data = {anim = "WORLD_HUMAN_SMOKING_POT"}},
	    	{label = "Drunk Standing", type = "anim", data = {lib = "amb@world_human_bum_standing@drunk@idle_a", anim = "idle_a"}},
	    	{label = "Vomiting", type = "anim", data = {lib = "oddjobs@taxi@tie", anim = "vomit_outside"}},
		}
	},

	{
		name  = 'saludos',
		label = 'Saludos',
		items = {
	    	{label = "Hola", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_hello"}},
	    	{label = "Ola", type = "anim", data = {lib = "mp_common", anim = "givetake1_a"}},
	    	{label = "Apreton de manos", type = "anim", data = {lib = "mp_ped_interaction", anim = "handshake_guy_a"}},
	    	{label = "Abrazarse", type = "anim", data = {lib = "mp_ped_interaction", anim = "hugs_guy_a"}},
	    	{label = "Saludar", type = "anim", data = {lib = "mp_player_int_uppersalute", anim = "mp_player_int_salute"}},
		}
	},

	{
		name  = 'trabajo',
		label = 'Trabajo',
		items = {
	    	{label = "Sospechoso : Rendirse", type = "anim", data = {lib = "random@arrests@busted", anim = "idle_c"}},
	    	{label = "Pescar", type = "scenario", data = {anim = "world_human_stand_fishing"}},
	    	{label = "Policia : Investigar", type = "anim", data = {lib = "amb@code_human_police_investigate@idle_b", anim = "idle_f"}},
	    	{label = "Policia : Usar Radio", type = "anim", data = {lib = "random@arrests", anim = "generic_radio_chatter"}},
	    	{label = "Policia : Trafico", type = "scenario", data = {anim = "WORLD_HUMAN_CAR_PARK_ATTENDANT"}},
	    	{label = "Policia : Prismaticos", type = "scenario", data = {anim = "WORLD_HUMAN_BINOCULARS"}},
	    	{label = "Agricultor : Plantar", type = "scenario", data = {anim = "world_human_gardener_plant"}},
	    	{label = "Mecanico : Arreflar Motor", type = "anim", data = {lib = "mini@repair", anim = "fixing_a_ped"}},
	    	{label = "Medico : Arrodillarse", type = "scenario", data = {anim = "CODE_HUMAN_MEDIC_KNEEL"}},
	    	{label = "Taxi : Hablar con el cliente", type = "anim", data = {lib = "oddjobs@taxi@driver", anim = "leanover_idle"}},
	    	{label = "Taxi : Dar factura", type = "anim", data = {lib = "oddjobs@taxi@cyi", anim = "std_hand_off_ps_passenger"}},
	    	{label = "Tendero : Dar", type = "anim", data = {lib = "mp_am_hold_up", anim = "purchase_beerbox_shopkeeper"}},
	    	{label = "Barman : Servir bebida", type = "anim", data = {lib = "mini@drinking", anim = "shots_barman_b"}},
	    	{label = "Periodista : Hacer fotos", type = "scenario", data = {anim = "WORLD_HUMAN_PAPARAZZI"}},
	    	{label = "Todos los trabajos : Portapapeles", type = "scenario", data = {anim = "WORLD_HUMAN_CLIPBOARD"}},
	    	{label = "Todos los trabajos : Martillar", type = "scenario", data = {anim = "WORLD_HUMAN_HAMMERING"}},
	    	{label = "Mimo : Sostener señal", type = "scenario", data = {anim = "WORLD_HUMAN_BUM_FREEWAY"}},
	    	{label = "Mimo : Estatua humana", type = "scenario", data = {anim = "WORLD_HUMAN_HUMAN_STATUE"}},
		}
	},

	{
		name  = 'humor',
		label = 'Divertido',
		items = {
	    	{label = "Aplaudir", type = "scenario", data = {anim = "WORLD_HUMAN_CHEERING"}},
	    	{label = "Super", type = "anim", data = {lib = "mp_action", anim = "thanks_male_06"}},
	    	{label = "Señalar", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_point"}},
	    	{label = "Ven aqui", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_come_here_soft"}}, 
	    	{label = "Dale", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_bring_it_on"}},
	    	{label = "Yo", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_me"}},
	    	{label = "Ya lo se", type = "anim", data = {lib = "anim@am_hold_up@male", anim = "shoplift_high"}},
	    	{label = "Exhausto", type = "scenario", data = {lib = "amb@world_human_jog_standing@male@idle_b", anim = "idle_d"}},
	    	{label = "Estoy en la mierda", type = "scenario", data = {lib = "amb@world_human_bum_standing@depressed@idle_a", anim = "idle_a"}},
	    	{label = "Palmada en la cara", type = "anim", data = {lib = "anim@mp_player_intcelebrationmale@face_palm", anim = "face_palm"}},
	    	{label = "Calmate ", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_easy_now"}},
	    	{label = "Que hice ?", type = "anim", data = {lib = "oddjobs@assassinate@multi@", anim = "react_big_variations_a"}},
	    	{label = "Temor", type = "anim", data = {lib = "amb@code_human_cower_stand@male@react_cowering", anim = "base_right"}},
	    	{label = "Pelea ?", type = "anim", data = {lib = "anim@deathmatch_intros@unarmed", anim = "intro_male_unarmed_e"}},
	    	{label = "No es posible !", type = "anim", data = {lib = "gestures@m@standing@casual", anim = "gesture_damn"}},
	    	{label = "Abarcar", type = "anim", data = {lib = "mp_ped_interaction", anim = "kisses_guy_a"}},
	    	{label = "Dedo de honor", type = "anim", data = {lib = "mp_player_int_upperfinger", anim = "mp_player_int_finger_01_enter"}},
	    	{label = "Tu mierdas", type = "anim", data = {lib = "mp_player_int_upperwank", anim = "mp_player_int_wank_01"}},
	    	{label = "Bala en cabeza", type = "anim", data = {lib = "mp_suicide", anim = "pistol"}},
		}
	},

	{
		name  = 'deporte',
		label = 'Deportes',
		items = {
	    	{label = "Estirar los musculos", type = "anim", data = {lib = "amb@world_human_muscle_flex@arms_at_side@base", anim = "base"}},
	    	{label = "Levantar pesas", type = "anim", data = {lib = "amb@world_human_muscle_free_weights@male@barbell@base", anim = "base"}},
	    	{label = "Hacer lagartijas", type = "anim", data = {lib = "amb@world_human_push_ups@male@base", anim = "base"}},
	    	{label = "Hacer abdominales", type = "anim", data = {lib = "amb@world_human_sit_ups@male@base", anim = "base"}},
	    	{label = "Hacer yoga", type = "anim", data = {lib = "amb@world_human_yoga@male@base", anim = "base_a"}},
		}
	},

	{
		name  = 'miscelaneo',
		label = 'Diversos',
		items = {
	    	{label = "Beber cafe ", type = "anim", data = {lib = "amb@world_human_aa_coffee@idle_a", anim = "idle_a"}},
	    	{label = "Sentarse", type = "anim", data = {lib = "anim@heists@prison_heistunfinished_biztarget_idle", anim = "target_idle"}},
	    	{label = "Apoyarse contra la pared", type = "scenario", data = {anim = "world_human_leaning"}},
	    	{label = "Tomar el sol hacia atras", type = "scenario", data = {anim = "WORLD_HUMAN_SUNBATHE_BACK"}},
	    	{label = "Tomar el sol hacia delante", type = "scenario", data = {anim = "WORLD_HUMAN_SUNBATHE"}},
	    	{label = "Limpiar", type = "scenario", data = {anim = "world_human_maid_clean"}},
	    	{label = "Barbacoa", type = "scenario", data = {anim = "PROP_HUMAN_BBQ"}},
	    	{label = "Buscar", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_bj_to_prop_female"}},
	    	{label = "Hacerse un selfie", type = "scenario", data = {anim = "world_human_tourist_mobile"}},
	    	{label = "Escuchar la pared", type = "anim", data = {lib = "mini@safe_cracking", anim = "idle_base"}}, 
		}
	},

	{
		name  = 'attitudees',
		label = 'Maneras de caminar',
		items = {
	    	{label = "Normal M", type = "attitude", data = {lib = "move_m@confident", anim = "move_m@confident"}},
	    	{label = "Normal F", type = "attitude", data = {lib = "move_f@heels@c", anim = "move_f@heels@c"}},
	    	{label = "Hombre deprimido", type = "attitude", data = {lib = "move_m@depressed@a", anim = "move_m@depressed@a"}},
	    	{label = "Mujer deprimida", type = "attitude", data = {lib = "move_f@depressed@a", anim = "move_f@depressed@a"}},
	    	{label = "Negocios", type = "attitude", data = {lib = "move_m@business@a", anim = "move_m@business@a"}},
	    	{label = "Determinado", type = "attitude", data = {lib = "move_m@brave@a", anim = "move_m@brave@a"}},
	    	{label = "Casual", type = "attitude", data = {lib = "move_m@casual@a", anim = "move_m@casual@a"}},
	    	{label = "Comi demasiado", type = "attitude", data = {lib = "move_m@fat@a", anim = "move_m@fat@a"}},
	    	{label = "Hipster", type = "attitude", data = {lib = "move_m@hipster@a", anim = "move_m@hipster@a"}},
	    	{label = "Herido", type = "attitude", data = {lib = "move_m@injured", anim = "move_m@injured"}},
	    	{label = "Tengo prisa", type = "attitude", data = {lib = "move_m@hurry@a", anim = "move_m@hurry@a"}},
	    	{label = "Obrero", type = "attitude", data = {lib = "move_m@hobo@a", anim = "move_m@hobo@a"}},
	    	{label = "Triste", type = "attitude", data = {lib = "move_m@sad@a", anim = "move_m@sad@a"}},
	    	{label = "Musculoso", type = "attitude", data = {lib = "move_m@muscle@a", anim = "move_m@muscle@a"}},
	    	{label = "Conmocionado", type = "attitude", data = {lib = "move_m@shocked@a", anim = "move_m@shocked@a"}},
	    	{label = "Sombrio", type = "attitude", data = {lib = "move_m@shadyped@a", anim = "move_m@shadyped@a"}},
	    	{label = "Zumbado", type = "attitude", data = {lib = "move_m@buzzed", anim = "move_m@buzzed"}},
	    	{label = "Apurado", type = "attitude", data = {lib = "move_m@hurry_butch@a", anim = "move_m@hurry_butch@a"}},
	    	{label = "Orgulloso", type = "attitude", data = {lib = "move_m@money", anim = "move_m@money"}},
	    	{label = "Carrera corta", type = "attitude", data = {lib = "move_m@quick", anim = "move_m@quick"}},
	    	{label = "Come hombres", type = "attitude", data = {lib = "move_f@maneater", anim = "move_f@maneater"}},
	    	{label = "Picaro", type = "attitude", data = {lib = "move_f@sassy", anim = "move_f@sassy"}},	
	    	{label = "Arrogante", type = "attitude", data = {lib = "move_f@arrogant@a", anim = "move_f@arrogant@a"}},
		}
	},
	{
		name  = 'porn',
		label = 'NSFW',
		items = {
	    	{label = "Hombre recibiendo en el coche", type = "anim", data = {lib = "oddjobs@towing", anim = "m_blow_job_loop"}},
	    	{label = "Mujer recibiendo en el coche", type = "anim", data = {lib = "oddjobs@towing", anim = "f_blow_job_loop"}},
	    	{label = "Hombre debajo en el coche", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_sex_loop_player"}},
	    	{label = "Mujer encima en el coche", type = "anim", data = {lib = "mini@prostitutes@sexlow_veh", anim = "low_car_sex_loop_female"}},
	    	{label = "Rascarse los huevos", type = "anim", data = {lib = "mp_player_int_uppergrab_crotch", anim = "mp_player_int_grab_crotch"}},
	    	{label = "Prostituta 1", type = "anim", data = {lib = "mini@strip_club@idles@stripper", anim = "stripper_idle_02"}},
	    	{label = "Prostituta 2", type = "scenario", data = {anim = "WORLD_HUMAN_PROSTITUTE_HIGH_CLASS"}},
	    	{label = "Prostituta 3", type = "anim", data = {lib = "mini@strip_club@backroom@", anim = "stripper_b_backroom_idle_b"}},
	    	{label = "Strip Tease 1", type = "anim", data = {lib = "mini@strip_club@lap_dance@ld_girl_a_song_a_p1", anim = "ld_girl_a_song_a_p1_f"}},
	    	{label = "Strip Tease 2", type = "anim", data = {lib = "mini@strip_club@private_dance@part2", anim = "priv_dance_p2"}},
	    	{label = "Stip Tease de rodillas", type = "anim", data = {lib = "mini@strip_club@private_dance@part3", anim = "priv_dance_p3"}},
			}
	},

}