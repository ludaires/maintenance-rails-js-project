$(document).ready(() => {
    console.log("Loaded")
    indexEquipment()
})

function retriveUserId(){
  return $('#all_equipment').data('user-id')
}

function indexEquipment(){
    $('#all_equipment').on('click', function(event){
        event.preventDefault()
        let userId = retriveUserId()
        // append equipment to the url
        // history.pushState(null, null, 'users/2/equipment')
        fetch(`/users/${userId}/equipment.json`)
            .then(response => response.json())
            .then(allEquipment => {
                $('.container').html('')
                console.log(allEquipment)
                allEquipment.forEach(equipment => {
                    let newEquipment = new Equipment(equipment)
                    let equipmentHtml = newEquipment.formatIndex()
                    $('.container').append(equipmentHtml)
                    // console.log(newEquipment)
            })
        })
        $(document).on('click', ".show-equipment", function(e) {
            e.preventDefault()
            let id = $(this).attr('data-id')
            fetch(`/users/${userId}/equipment/${id}.json`)
                .then(res => res.json())
                .then(data => {
                    console.log(data)
                    $('.container').html('')
                    let newEquipment = new Equipment(data)
                    let equipmentHtml = newEquipment.formatShow()
                    $('.container').append(equipmentHtml)
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
    this.calibration_unit = equipment.calibration_unit
    // TODO: INSERT THE MAINTENANCES IN THE SHOW PAGE
    this.maintenances = equipment.maintenances
}

 Equipment.prototype.formatIndex = function() {
    let userId = retriveUserId()
    let equipmentHtml = (`
        <div class="pt-3 pb-2 mb-3 border-bottom">      
            <div class="table-responsive pt-2">
                <table class="table table-striped table-sm">
                    <thead>
                        <tr>
                        <th>ID</th>          
                        <th>Name</th>       
                        <th>Code</th>          
                        <th>Location</th>
                        <th>Uncertanty</th>
                        <th>Calibration Unit</th>     
                        </tr>
                    </thead>
                    <tbody>       
                        <tr>
                        <td>${this.id}</td>
                        <td><a href="/users/${userId}/equipment/${this.id}" data-id="${this.id}" class="show-equipment"</a>${this.name}</td>
                        <td>${this.code}</td>
                        <td>${this.location}</td>
                        <td>${this.uncertainty}</td>
                        <td>${this.calibration_unit}</td>
                        </tr>
                    </tbody>
                </table>
            </div>  
        </div>
    `)
    return equipmentHtml
 }

 Equipment.prototype.formatShow = function() {
     let showHtml = `
        <h3>${this.name} | ${this.code}</h3>
        <p>Location: ${this.location}</p>
        <p>Calibration Unit: ${this.calibration_unit}</p>
        <p>Calibration Start: ${this.calibration_start}</p>
        <p>Calibration End: ${this.calibration_end}</p>
        <p>Uncertainty: ${this.uncertainty}</p>
        <p>
     `
     return showHtml
 }