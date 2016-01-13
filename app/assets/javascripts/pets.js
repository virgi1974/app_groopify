$(document).on('ready',function(){
  // (function loadSelectedMapInfo(){

  //     var request = $.get('/maps/' + mapId + '/info');

  //     request.fail(function () {
  //       alert('Couldn’t get you maps from the DB');
  //     });

  //     request.done(function (info_user) {
  //       addUserInfo(info_user);
  //     })

  //     function addUserInfo(user){

  //         var htmlParts = [
  //           '<section class="col-md-12 map-info">',
  //             '<div>',
  //               '<h3 class="description-header"><strong>' + user.description + '</strong></h3>',
  //               '<span class="info"><strong>username</strong>&nbsp;&nbsp;&nbsp;' + user.name + '</span>&nbsp;&nbsp;&nbsp;',
  //               '&nbsp;&nbsp;&nbsp;<span><strong>email</strong>&nbsp;&nbsp;&nbsp;&nbsp;' + user.email + '</span>',
  //           '</section>'   
  //       ];
  //       $('#user-info').append(htmlParts.join('\n'));

  //     };//addUserInfo
  // })(); 


$(document).on('click','#pet-info',function(event){
event.preventDefault();
  var $button = $(event.currentTarget);

  var pet_id = $button.attr('name');
  console.log(pet_id);


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

       var htmlParts= [
              '<p class="">'+ pet.name + '</p>',
              '<p class="">'+ pet.race + '</p>',
              '<p class="">'+ pet.age + '</p>',
          ];

          $('#pet-details').append(htmlParts.join('\n')); 
  
    };
        
}); 


});//document-ready









 





