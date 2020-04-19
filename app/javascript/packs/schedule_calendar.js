// var start_time, end_time;
// $.ajax({
//   type: "GET",
//   url: "/clinics/get_clinic_variable",
//   dataType: "json",
//   success: function (response) {
//     var $clinics = response['clinics'];
//     //console.log($clinics[1].id);
//     start_time = changeFormatOfTime($clinics[0].start);
//     end_time = changeFormatOfTime($clinics[0].end);
//     console.log(end_time);
//   } 
// });

$(document).on("turbolinks:load", function(){

  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    plugins: ['interaction', 'timeGrid', 'dayGrid', 'list' ],
    defaultView: 'timeGrid',
    visibleRange: function(currentDate) {
      // Generate a new date for manipulating in the next step
      var startDate = new Date(currentDate.valueOf());
      var endDate = new Date(currentDate.valueOf());

      // Adjust the start & end dates, respectively
      startDate.setDate(startDate.getDate()); 
      endDate.setDate(endDate.getDate() + 4); 

      return { start: startDate, end: endDate };
    },
    selectable: true,
    minTime: '10:00:00',
    maxTime: '18:00:00',
    defaultTimedEventDuration: '00:15:00',
    slotDuration: '00:15:00',
    slotLabelInterval: 15,
    header: {
      left: 'prev,next,today',
      center: 'title',
      right: 'timeGridDay,timeGridWeek,listDay'
    },
    // dateClick: function(info) {
    //   alert('clicked ' + info.dateStr);
    // },
    select: function(info) {
      $('#newEvent').modal('show');
      $('#submit').unbind();
      $('#submit').on('click', function() {
        var title = "Booked"
        if (title) {
            calendar.addEvent({
            title: title,
            start: info.start,
          });
          $('#newEvent').modal('hide');
          }
        else {
          $('#newEvent').modal('hide');
        }
      });
    },
  });
  calendar.render();
});

// var newEvent = function(start) {
//   $('#newEvent').modal('show');
//   $('#submit').unbind();
//   $('#submit').on('click', function() {
//   var title = "Booked"
//   if (title) {
//     calendar.addEvent({
//       title: 'Booked',
//       start: date,
//       allDay: true
//     });
//     $('#newEvent').modal('hide');
//     }
//   else {
//     $('#newEvent').modal('hide');
//   }
//   });
// }

function changeFormatOfTime(time){
  var dt = new Date(time);
  var time = (dt.getUTCHours() < 10 ? '0' : '') + dt.getUTCHours() + ":" + (dt.getUTCMinutes() < 10 ? '0' : '') + dt.getUTCMinutes() + ":" + (dt.getUTCSeconds() < 10 ? '0' : '') + dt.getUTCSeconds();
  return time;
}






