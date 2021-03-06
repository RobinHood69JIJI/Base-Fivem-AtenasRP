Config = {}
Config.Locale = 'es'
Config.adminRanks = { -- change this as your server ranking ( default are : superadmin | admin | moderator )
				'admin',
				'moderator',
				'superadmin',
				'owner',
            }

Config.Lang              = 'en'    --Set lang (fr-en)
Config.ForceSteam        = true    --Set to false if you not use steam auth
--LANGUAGE
Config.TextFr = {
	start         = "La BanList et l'historique a ete charger avec succes",
	starterror    = "ERREUR : La BanList ou l'historique n'a pas ete charger nouvelle tentative.",
	banlistloaded = "La BanList a ete charger avec succes.",
	historyloaded = "La BanListHistory a ete charger avec succes.",
	loaderror     = "ERREUR : La BanList n a pas été charger.",
	cmdban        = "/sqlban (ID) (Durée en jours) (Raison)",
	cmdbanoff     = "/sqlbanoffline (Permid) (Durée en jours) (Raison)",
	cmdhistory    = "/sqlbanhistory (Steam name) ou /sqlbanhistory 1,2,2,4......",
	noreason      = "Raison Inconnue",
	during        = " pendant : ",
	noresult      = "Il n'y a pas autant de résultats !",
	isban         = " a été ban",
	isunban       = " a été déban",
	invalidsteam  =  "Vous devriez ouvrir steam",
	invalidid     = "ID du joueur incorrect",
	invalidname   = "Le nom n'est pas valide",
	invalidtime   = "Duree du ban incorrecte",
	alreadyban    = " étais déja bannie pour : ",
	yourban       = "Vous avez ete ban pour : ",
	yourpermban   = "Vous avez ete ban permanent pour : ",
	youban        = "Vous avez banni : ",
	forr          = " jours. Pour : ",
	permban       = " de facon permanente pour : ",
	timeleft      = ". Il reste : ",
	toomanyresult = "Trop de résultats, veillez être plus précis.",
	day           = " Jours ",
	hour          = " Heures ",
	minute        = " Minutes ",
	by            = "par",
	ban           = "Bannir un joueurs qui est en ligne",
	banoff        = "Bannir un joueurs qui est hors ligne",
	bansearch     = "Trouver l'id permanent d'un joueur qui est hors ligne",
	dayhelp       = "Nombre de jours",
	reason        = "Raison du ban",
	permid        = "Trouver l'id permanent avec la commande (sqlsearch)",
	history       = "Affiche tout les bans d'un joueur",
	reload        = "Recharge la BanList et la BanListHistory",
	unban         = "Retirez un ban de la liste",
	steamname     = "(Nom Steam)",
}


Config.TextEn = {
	start         = "BanList y BanListHistory se cargaron correctamente.",
	starterror    = "ERROR: BanList and BanListHistory failed to load, please retry.",
	banlistloaded = "BanList cargada con éxito.",
	historyloaded = "BanListHistory se cargó correctamente.",
	loaderror     = "ERROR: La BanList no se pudo cargar.",
	cmdban        = "/sqlban (ID) (Duración en días) (Motivo de prohibición)",
	cmdhistory    = "/sqlbanhistory Ejemplo: /sqlbanhistory 1,2,2,4......",
	forcontinu    = " dias. Para continuar, ejecute /sqlreason [razón]",
	noreason      = "No se proporcionó ninguna razón.",
	during        = " durante: ",
	noresult      = "No se han encontrado resultados.",
	isban         = " fue baneado",
	isunban       = " fue desbaneado",
	invalidsteam  = "Debes usar Steam para unirte al sevidor.",
	invalidid     = "ID no encontrada",
	invalidname   = "The specified name is not valid",
	invalidtime   = "Duración del ban inválida",
	alreadyban    = " estas baneado por : ",
	yourban       = " Fuiste baneado. Razon: ",
	yourpermban   = "Has sido baneado PERMANENTEMENTE de Atenas Community: ",
	youban        = "Has sido baneado de Atenas Community: ",
	forr          = " días. Razon: ",
	permban       = " permanentemente por: ",
	timeleft      = ". Tiempo restante: ",
	toomanyresult = "Demasiados resultados, sea más específico para acortar los resultados.",
	day           = " días ",
	hour          = " horas ",
	minute        = " minutos ",
	by            = "por",
	ban           = "Banea gordamente a un jugador",
	banoff        = "Ban an offline player",
	dayhelp       = "Duration (days) of ban",
	reason        = "Razón",
	history       = "Muestra todas las prohibiciones anteriores para un determinado jugador.",
	reload        = "Actualiza la lista de prohibiciones y el historial.",
	unban         = "Unban a un jugador.",
	steamname     = "Nombre de Steam"
}
