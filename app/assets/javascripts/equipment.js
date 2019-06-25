$(document).ready(() => {
    console.log("Loaded")
    indexEquipment()
})

function indexEquipment(){
    $('#all_equipment').on('click', function(event){
        event.preventDefault()
        fetch(`/users/2/equipment.json`)
            .then(response => response.json())
            .then(allEquipment => {
                allEquipment.forEach(equipment => {
                    console.log(equipment)
                })
            })
    })
}


function Equipment(equipment) {
    this.id = equipment.id
    this.name = equipment.name
    this.code = equipment.code
    this.location = equipment.location
    this.uncertainty = equipment.uncertainty
}


