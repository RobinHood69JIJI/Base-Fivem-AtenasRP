
let vehActive = false
let o2 = true
let territorie = true
$("body").hide()

test = function() {
    if (!vehActive) {
        vehActive = true
        $("#hud").animate({"left": '-10vh'},350 );
        $("#hudcar").animate({"bottom": '0.7vh'},350 );
    } else {
        vehActive = false
        $("#hud").animate({"left": '1vh'},350 );
        $("#hudcar").animate({"bottom": '-10vh'},350 );
    } 
}

window.addEventListener('message', function (event) {
    let data = event.data

    if (data.active== true) {
        $("body").show("slow")
        return
    } else if (data.active == false) {
        $("body").hide("slow")
        return
    }

    if (data.o2 == false) {
        if (o2) {
            o2 = false
            $("#o2").hide("normal") 
        }
    } else {
        if (!o2) {
            o2 = true
            $("#o2").show("normal") 
        }
        $('#o2val').html(Math.round(data.o2))
    }
    
    if (data.veh == true) {
        if (!vehActive) {
            vehActive = true
            $("#hud").animate({"left": '-10vh'},200 );
            $("#hudcar").animate({"bottom": '0.2vh'},350 );
            if (territorie) {
                $("#territorie").hide()
                $("#territorie1").show("fast")
            }
        }
    } else {
        if (vehActive) {
            vehActive = false
            $("#hud").animate({"left": '1vh'},350 );
            $("#hudcar").animate({"bottom": '-10vh'},350 );
            if (territorie) {
                $("#territorie1").hide() 
                $("#territorie").show("fast")
            }
        }
    }

    if (data.values) {
        $('#healtval').html(Math.round(data.values.health))
        $('#shieldval').html(Math.round(data.values.shield))
        $('#hungerval').html(Math.round(data.values.hunger))
        $('#waterval').html(Math.round(data.values.thirst))
        $('#stressval').html(Math.round(data.values.stress))
        $('#idval').html(Math.round(data.values.id))
        $('#healtval1').html(Math.round(data.values.health))
        $('#shieldval1').html(Math.round(data.values.shield))
        $('#hungerval1').html(Math.round(data.values.hunger))
        $('#waterval1').html(Math.round(data.values.thirst))
        $('#stressval1').html(Math.round(data.values.stress))
        $('#fuelval1').html(Math.round(data.values.fuel))
    }
});