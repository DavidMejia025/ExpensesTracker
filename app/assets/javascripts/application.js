// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

// $( document ).ready(function() {
//   $(".modal-body").submit(function(e){
//     e.preventDefault();
//     console.log( "ready!" );
//     $('.type_field').css('border-color', '')
//     $('.date_field').css('border-color', '')
//     $('.concept_field').css('border-color', '')
//     $('.category_field').css('border-color', '')
//     $('.amount_field').css('border-color', '')
//
//     var type = $('.type_field').val();
//     console.log(type)
//     var date = $('.date_field').val();
//     var concept = $(".concept_field").val();
//     var category = $('.category_field').val();
//     var amount = $('.amount_field').val();
//     var completed = true
//
//
//     if(type.length > 0){
//     }else{
//       $('.type_field').css('border-color','#FF0000')
//       completed = false
//     }
//     if(concept.length > 0){
//     }else{
//       $('.concept_field').css('border-color','#FF0000')
//       completed = false
//     }
//     if(category.length > 0){
//     }else{
//       $('.category_field').css('border-color','#FF0000')
//       completed = false
//     }
//     // if(amount === 123 ){
//     // }else{
//     //   $('.amount_field').css('border-color','#FF0000')
//     //   completed = false
//     // }
//
//     data = {expense: {"type_of_trans":type,
//                   "date":date,
//                   "concept":concept,
//                   "category":category,
//                   "amount":amount}}
//
//     console.log(completed)
//     if (completed === true){
//       alert("completed")
//       $.ajax({
//         url:"http://localhost:3000/expenses",
//         type:"POST",
//         data:data,
//         datatype:"json",
//       }).done(function(data){
//         alert("hola mundo respuesta")
//         $(".modal-body").modal('hide')
//       })
//     }
//   })
// })
// <script type="text/javascript">
  $( document ).ready(function() {
    console.log( "ready!" );
  window.onload = function () {
    var datas = $('.data_information').data('datas')
    var chart = new CanvasJS.Chart("chartContainer", {
      theme: "dark2",
      title:{
        text: "Expenses last 3 months"
      },
      data: [
      {
        // Change type to "doughnut", "line", "splineArea", etc.
        type: "column",
        dataPoints: datas

      }
      ]
    });
    chart.render();

    var datas = $('.data_information2').data('datas')
    var chart = new CanvasJS.Chart("chartContainer2", {
      theme: "dark2",
      title:{
        text: "Expenses last 3 months"
      },
      data: [
        {
          // Change type to "doughnut", "line", "splineArea", etc.
          type: "column",
          dataPoints: datas[0]

        },
        {
          // Change type to "doughnut", "line", "splineArea", etc.
          type: "column",
          dataPoints: datas[1]

        },
        {
          // Change type to "doughnut", "line", "splineArea", etc.
          type: "column",
          dataPoints: datas[2]

        }
      ]
    });
    chart.render();


    var datas = $('.data_information3').data('datas')
    var chart = new CanvasJS.Chart("divchart", {
      theme: "dark2",
      title:{
        text: "Expenses last 3 months"
      },
      data: [
        {
          // Change type to "doughnut", "line", "splineArea", etc.
          type: "doughnut",
          dataPoints: datas
        }
      ]
    });
    chart.render();

    var datas = $('.data_information4').data('datas')
    console.log(datas)
    var chart = new CanvasJS.Chart("month-acc", {

      theme: "dark2",
      title:{
        text: "Two months expenses record"
      },
      data: [
        {
          // Change type to "doughnut", "line", "splineArea", etc.
          type: "area",
          markerType: "none",
          dataPoints: datas[1]
        },
        {
          // Change type to "doughnut", "line", "splineArea", etc.
          type: "area",
          color: "rgba(40,175,101,0.6)",
          markerType: "none",
          dataPoints: datas[0]
        }
      ]

    });
    chart.render();
  }
});

  // </script>
