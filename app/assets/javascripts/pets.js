$(document).on('ready',function(){

  $(document).on('click','#pet-info',function(event){

    event.preventDefault();
    var $button = $(event.currentTarget);
    var petId = $button.attr('name');
    var logedUserId = parseInt($button.attr('data-user'));
    
    var data = {
      petId : petId
    }

    var request = $.get('/pets/' + petId ,data);

    request.fail(function () {
      alert('Couldn’t add your comment to the DB');
    });

    request.success(function (response) {
      preparePetInfo(response);
      $('#myModal').modal('show');
    }); 

    function preparePetInfo(pet){
      $('#pet-details').empty();   
      var htmlParts= [
        '<strong>Name </strong><p>'+ pet.name + '</p>',
        '<strong>Race </strong><p>'+ pet.race + '</p>',
        '<strong>Age </strong><p>'+ pet.age + '</p>',
      ];

      htmlParts = checkSelfUser(pet,htmlParts);
      $('#pet-details').append(htmlParts.join('\n')); 
    };
      
    function checkSelfUser(pet,htmlParts){
      if (pet.user_id === logedUserId) {
        var htmlButtons= [
        '<a class="btn btn-warning btn-block" href="/pets/' +pet.id + '/edit">EDIT</a>',
        '<a data-method="delete" class="btn btn-danger btn-block" href="/pets/' +pet.id + '">DELETE</a>'
        ];
        return htmlParts.concat(htmlButtons);
      }else{
        return htmlParts;
      };
    }
          
  }); //click','#pet-info
});//document-ready