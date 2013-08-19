$(document).ready(function () {

  var show_chart = function() {
    var symbol = $(this).val();
    $.ajax({
      dataType: 'json',
      type: 'get',
      url: '/stocks/quotes/' + symbol
    }).done(process_chart);

  };


  var process_chart = function (prices) {

$('#myfirstchart').empty();



        new Morris.Line({
      // ID of the element in which to draw the chart.


      element: 'myfirstchart',
      // Chart data records -- each entry in this array corresponds to a point on
      // the chart.
      data: prices,
      // The name of the data record attribute that contains x-values.
      xkey: 'date',
      // A list of names of data record attributes that contain y-values.
      ykeys: ['price'],
      // Labels for the ykeys -- will be displayed when you hover over the
      // chart.
      labels: ['Value']
    });
  };


  $('input[type="checkbox"]').change(show_chart);







 //$(check_box).true(show_chart)

  //show_chart();

});

