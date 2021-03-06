Config = {}

Config.ServerPlayers = 1024   --This is for the menu of players.
Config.Speednoclip = 3.0  -- Only that format, 1.0, 2.0, 3.6, etc.

--Mythic Notifications.
Config.Mythic = true -- Default ESX

--Clothes
Config.StaffClothes = {
    male = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 379,   ['torso_2'] = 1,
        ['arms'] = 8,
    },
    female = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 4,   ['torso_2'] = 14,
        ['arms'] = 4,
        ['pants_1'] = 25,   ['pants_2'] = 1,
        ['shoes_1'] = 16,   ['shoes_2'] = 4,
    }
}
--

--Spanish, si quieres en espaΓ±ol descomenta todo esto y comenta lo de abajo en ingles--

Config.Language = {
--     --First Menu
     personal = "Opciones Personales π€΅",
--     server = "Opciones del Servidor π»",
     players = "Opciones del Jugador βΉοΈββοΈ",

--     --Personal Options Menu
     godmode = "Modo Dios π΄",
     invisible = "Invisible π»",
--     tpm = "TPM π",
     copycoords = "Copiar Coordenadas π",
     opencar = "Abrir Coche π",
--     noclip = "noclip π½",
     repair = "Reparar π§",
     staffclothes = "Ropa de Staff π‘οΈ",
     civilclothes = "Ropa de Civil π",
    
--     --Personal Options Notifications
 
     activegod = "Activaste el modo Dios. π",
     delgod = "Desactivaste el modo Dios. π’",
     activeinvi = "Eres invisible. π»",
     delinvi = "Ya no eres invisible.  π§",
     donetpm = "Fuiste teletransportado al punto marcado. π",
     nopoint = "Marca un punto. π§ͺ",
     caropen = "Abriste el Coche. π§",
     nosit = "Necesitas estar en un coche. π‘",
     fixcar = "Reparaste el auto. π",
     actinoclip = "Activaste el noclip.  π½", 
     delnoclip = "Desactivaste el noclip.  π½",
     copycoord = "Tus coordenadas se copiaron en el portapapeles.",
     clothesstaff = "Te pusiste tu ropa de Staff.",
     clothescivil = "Te pusiste tu ropa de Civil.",

     --Server Options Menu
--     deleteveh = "Borrar todos los Vehiculos π",
--     deleteobj = "Borrar todos los Objetos π¦",
--     deleteped = "Borrar todos los peds πΆ",
--     clearchat = "Borrar Chat π¬",
--     makeannounce = "Enviar Anuncio π’ ",
--     reviveall = "Revivir a todos π",
--     insertannounce = "Inserta un anuncio π’",
--     noannounce = "El anuncio no puede estar vacio.",
     --Server Options Notifiactins

--     delallveh = "Borraste todos los vehiculos. π",
--     delallobj = "Borraste todos los Objetos. π¦",
--     delallpeds = "Borraste todos los Peds. πΆ",
--     delallchat = "Borraste todo el chat. π¬",

     --Player Options Menu
     listplayers = "Jugadores ",
     job = "Nombre del Trabajo",
     jobgrade = "Rango del Trabajo",
     kick = "Kickear Jugador",
     changename = "Cambiar Nombre del Jugador",
     givemoney = "Dar Dinero",
     revplayer = "Revivir Jugador",
     setjob = "Cambiar Trabajo",
     dock = "Hacer CK",
     reason = "Ingresa una razΓ³n",
     insertreason = "Inserta una razΓ³n.",
     newname = "Ingresa un nombre.",
     newlastname = "Ingresa un apellido.",
     noname = "Ingresa un nombre.",
     nolast = "Ingresa un apellido valido.",
     donename = "Se cambio el nombre y apellido del jugador.",
     insertaccount = "Inserta una cuenta",
     insertmount = "Inserta un monto",
     nomount = "El monto no puede estar vacio.",
     nuevonombre = "Cambiaste el nombre del jugador al: ",

     ---Player Options Notifications
     confirmck = "Necesitas poner si o yes.",
     yesck = "Ck Realizado con Exito.",
     nock = "Inserta si o yes para realizar el CK",
     yesrev = "Reviviste a todos.",
     norev = "Inserta si o yes para revivir a todos.",
     confrev = "Necesitas poner si o yes.",
     yesorno = "Para confirmar escribe si o yes.",
     nonull = "El grado no puede estar vacio.",
 }


---Ingles version, to work this you need to comment all of Config.Language was is in spanish--
--[[Config.Language = {
    --First Menu
    personal = "Personal Options π€΅",
    server = "Server Options π»",
    players = "Player Options βΉοΈββοΈ",

    --Personal Options Menu
    godmode = "God Mode π΄",
    invisible = "Invisible π»",
    tpm = "TPM π",
    copycoords = "Copy Coordinates π",
    opencar = "Open Car π",
    noclip = "noclip π½",
    repair = "Fix Car π§",
    staffclothes = "Staff Clothes π‘οΈ",
    civilclothes = "Civilian clothes π",
    
    --Personal Options Notifications
 
    activegod = "You activated God mode. π",
    delgod = "You deactivated God mode. π’",
    activeinvi = "You're invisible. π»",
    delinvi = "You are no longer invisible.  π§",
    donetpm = "You were teleported to the marked point. π",
    nopoint = "Select a point π§ͺ",
    caropen = "You opened the car. π§",
    nosit = "You need to be in a car. π‘",
    fixcar = "You repaired the car. π",
    actinoclip = "You activated the noclip.  π½", 
    delnoclip = "You disabled the noclip.  π½",
    copycoord = "Your coordinates were copied to the clipboard.",
    clothesstaff = "You put on your Staff clothes.",
    clothescivil = "You put on your Civilian clothes.",

    --Server Options Menu
    deleteveh = "Delete all Vehicles π",
    deleteobj = "Delete all Objects π¦",
    deleteped = "Delete all peds πΆ",
    clearchat = "Delete Chat π¬",
    makeannounce = "Send Announcement π’ ",
    reviveall = "Revive all π",
    insertannounce = "Insert an Announcement π’",
    noannounce = "The Announcement cannot be empty.",
    --Server Options Notifiactins

    delallveh = "You deleted all the vehicles. π",
    delallobj = "You deleted all the Objects. π¦",
    delallpeds = "You erased all the Peds. πΆ",
    delallchat = "You deleted all the chat. π¬",

    --Player Options Menu
    listplayers = "Players ",
    job = "Name of the job",
    jobgrade = "Job Range",
    kick = "Kick Player",
    changename = "Change Player Name",
    givemoney = "Give money",
    revplayer = "Revive Player",
    setjob = "Change Job",
    dock = "Do Ck",
    reason = "Enter a reason",
    insertreason = "Enter a reason",
    newname = "Please enter a name.",
    newlastname = "Please enter a last name.",
    noname = "Please enter a name.",
    nolast = "Please enter a valid last name.",
    donename = "The player's first and last name was changed.",
    insertaccount = "Insert an account",
    insertmount = "Insert an amount",
    nomount = "The amount cannot be empty.",
    nuevonombre = "You changed the player's name to:",

    ---Player Options Notifications
    confirmck = "You need to put yes or si.",
    yesck = "Ck Successfully Done.",
    nock = "Insert yes or si to perform the CK",
    yesrev = "You revived everyone.",
    norev = "Insert yes or si to revive everyone.",
    confrev = "You need to put yes or si.",
    yesorno = "To confirm write yes or si.",
    nonull = "The degree cannot be empty.",
}]]--

