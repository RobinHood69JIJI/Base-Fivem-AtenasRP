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

--Spanish, si quieres en español descomenta todo esto y comenta lo de abajo en ingles--

Config.Language = {
--     --First Menu
     personal = "Opciones Personales 🤵",
--     server = "Opciones del Servidor 💻",
     players = "Opciones del Jugador ⛹️‍♂️",

--     --Personal Options Menu
     godmode = "Modo Dios 👴",
     invisible = "Invisible 👻",
--     tpm = "TPM 🚀",
     copycoords = "Copiar Coordenadas 📍",
     opencar = "Abrir Coche 🚗",
--     noclip = "noclip 👽",
     repair = "Reparar 🔧",
     staffclothes = "Ropa de Staff 🛡️",
     civilclothes = "Ropa de Civil 👕",
    
--     --Personal Options Notifications
 
     activegod = "Activaste el modo Dios. 😎",
     delgod = "Desactivaste el modo Dios. 😢",
     activeinvi = "Eres invisible. 👻",
     delinvi = "Ya no eres invisible.  🧑",
     donetpm = "Fuiste teletransportado al punto marcado. 🚀",
     nopoint = "Marca un punto. 🧪",
     caropen = "Abriste el Coche. 🔧",
     nosit = "Necesitas estar en un coche. 💡",
     fixcar = "Reparaste el auto. 🚗",
     actinoclip = "Activaste el noclip.  👽", 
     delnoclip = "Desactivaste el noclip.  👽",
     copycoord = "Tus coordenadas se copiaron en el portapapeles.",
     clothesstaff = "Te pusiste tu ropa de Staff.",
     clothescivil = "Te pusiste tu ropa de Civil.",

     --Server Options Menu
--     deleteveh = "Borrar todos los Vehiculos 🚗",
--     deleteobj = "Borrar todos los Objetos 📦",
--     deleteped = "Borrar todos los peds 👶",
--     clearchat = "Borrar Chat 💬",
--     makeannounce = "Enviar Anuncio 📢 ",
--     reviveall = "Revivir a todos 😇",
--     insertannounce = "Inserta un anuncio 📢",
--     noannounce = "El anuncio no puede estar vacio.",
     --Server Options Notifiactins

--     delallveh = "Borraste todos los vehiculos. 🚗",
--     delallobj = "Borraste todos los Objetos. 📦",
--     delallpeds = "Borraste todos los Peds. 👶",
--     delallchat = "Borraste todo el chat. 💬",

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
     reason = "Ingresa una razón",
     insertreason = "Inserta una razón.",
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
    personal = "Personal Options 🤵",
    server = "Server Options 💻",
    players = "Player Options ⛹️‍♂️",

    --Personal Options Menu
    godmode = "God Mode 👴",
    invisible = "Invisible 👻",
    tpm = "TPM 🚀",
    copycoords = "Copy Coordinates 📍",
    opencar = "Open Car 🚗",
    noclip = "noclip 👽",
    repair = "Fix Car 🔧",
    staffclothes = "Staff Clothes 🛡️",
    civilclothes = "Civilian clothes 👕",
    
    --Personal Options Notifications
 
    activegod = "You activated God mode. 😎",
    delgod = "You deactivated God mode. 😢",
    activeinvi = "You're invisible. 👻",
    delinvi = "You are no longer invisible.  🧑",
    donetpm = "You were teleported to the marked point. 🚀",
    nopoint = "Select a point 🧪",
    caropen = "You opened the car. 🔧",
    nosit = "You need to be in a car. 💡",
    fixcar = "You repaired the car. 🚗",
    actinoclip = "You activated the noclip.  👽", 
    delnoclip = "You disabled the noclip.  👽",
    copycoord = "Your coordinates were copied to the clipboard.",
    clothesstaff = "You put on your Staff clothes.",
    clothescivil = "You put on your Civilian clothes.",

    --Server Options Menu
    deleteveh = "Delete all Vehicles 🚗",
    deleteobj = "Delete all Objects 📦",
    deleteped = "Delete all peds 👶",
    clearchat = "Delete Chat 💬",
    makeannounce = "Send Announcement 📢 ",
    reviveall = "Revive all 😇",
    insertannounce = "Insert an Announcement 📢",
    noannounce = "The Announcement cannot be empty.",
    --Server Options Notifiactins

    delallveh = "You deleted all the vehicles. 🚗",
    delallobj = "You deleted all the Objects. 📦",
    delallpeds = "You erased all the Peds. 👶",
    delallchat = "You deleted all the chat. 💬",

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

