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
  var todayDate = new Date();
  todayDate.setHours(0,0,0,0);
  var eventData;

  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    plugins: ['interaction', 'timeGrid', 'dayGrid', 'list' ],
    defaultView: 'timeGrid',
    visibleRange: function(currentDate) {

      var startDate = new Date(currentDate.valueOf());
      var endDate = new Date(currentDate.valueOf());

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
      var title = "Booked"
      var eventData = {
        title: title,
        start: info.start,
        end: info.end
      }
      if (eventData.start < todayDate){
        alert("You can't choose a date that already past.");
        calendar.unselect();
        return
      }
      $('#newEvent').modal('show');
      $('#submit').unbind();
      $('#submit').on('click', function() {
      calendar.addEvent(eventData);
      $('#newEvent').modal('hide');
      });
  }, 
  // events: {
  //   url: "../schedules",
  //   method: "POST",
  //   data: eventData,
  //   dataType: 'json',
  //   success: function(json) {
  //   alert(json.msg);
  //   //calendar.addEvent(eventData);
  //   calendar.refetchEvents();
  //     }
  // },
  });
  calendar.render();
});


function changeFormatOfTime(time){
  var dt = new Date(time);
  var time = (dt.getUTCHours() < 10 ? '0' : '') + dt.getUTCHours() + ":" + (dt.getUTCMinutes() < 10 ? '0' : '') + dt.getUTCMinutes() + ":" + (dt.getUTCSeconds() < 10 ? '0' : '') + dt.getUTCSeconds();
  return time;
}






