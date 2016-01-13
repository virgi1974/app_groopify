$(document).on('ready',function(){

  $(document).on('click','#pet-info',function(event){
    
    event.preventDefault();
    var $button = $(event.currentTarget);
    var pet_id = $button.attr('name');
    var data = {
      pet_id : pet_id
    }

    var request = $.get('/pets/' + pet_id ,data);

    request.fail(function () {
      alert('Couldn’t add your comment to the DB');
    });

    request.success(function (response) {
      console.log(response);
      preparePetInfo(response);
      $('#myModal').modal('show');
    }); 

    function preparePetInfo(pet){
      $('#pet-details').empty();   
      var htmlParts= [
        '<strong>Name </strong><p class="">'+ pet.name + '</p>',
        '<strong>Race </strong><p class="">'+ pet.race + '</p>',
        '<strong>Age </strong><p class="">'+ pet.age + '</p>',
      ];

      $('#pet-details').append(htmlParts.join('\n')); 
    
    };
          
  }); //click','#pet-info


});//document-ready