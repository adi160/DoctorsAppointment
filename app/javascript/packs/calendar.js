// $(document).ready(function() {
//   $(".fc-time-grid-container").css("height", $(".fc-slats").height());
// });
  // $(".showCalender").on("click", function(){
  //   // document.addEventListener('DOMContentLoaded', function() {

  //     var calendarEl = document.getElementById('calendar');
      
  //     var calendar = new FullCalendar.Calendar(calendarEl, {
  //       plugins: ['interaction', 'timeGrid', 'dayGrid', 'list' ],
  //       defaultView: 'timeGrid',
  //       visibleRange: function(currentDate) {
  //         // Generate a new date for manipulating in the next step
  //         var startDate = new Date(currentDate.valueOf());
  //         var endDate = new Date(currentDate.valueOf());
      
  //         // Adjust the start & end dates, respectively
  //         startDate.setDate(startDate.getDate()); 
  //         endDate.setDate(endDate.getDate() + 4); 
      
  //         return { start: startDate, end: endDate };
  //       },
  //       selectable: true,
  //       minTime: '10:00:00',
  //       maxTime: '14:00:00',
  //       defaultTimedEventDuration: '00:15:00',
  //       slotDuration: '00:15:00',
  //       slotLabelInterval: 15,
  //       selectable: true,
  //       header: {
  //         left: 'prev,next,today',
  //         center: 'title',
  //         right: 'timeGridDay,timeGridWeek,listDay'
  //       },
  //       dateClick: function(info) {
  //         alert('clicked ' + info.dateStr);
  //       },
  //       select: function(info) {
  //         alert('selected ' + info.startStr + ' to ' + info.endStr);
  //         console.log(info);
  //       },
  //     });
      
  //     calendar.render();
  //     });
  // });
  // });
  var todayDate = new Date();
  todayDate.setHours(0,0,0,0);
  var initialize_calendar;
  initialize_calendar = function() {
    $('#calendar').each(function(){
      var calendar = $(this);
      calendar.fullCalendar({
        header: {
          left: 'prev,next today',
          center: 'title',
          right: 'month,agendaWeek,agendaDay'
        },
        defaultView: 'agendaWeek',
        selectable: true,
        selectHelper: true,
        editable: true,
        eventLimit: true,
        events: '/schedules',
  
        select: function(start, end) {
          var title = "Booked"
          var eventData = {
            title: title,
            start: moment(start).format('Y-MM-DD HH:mm:ss'),
            end: moment(end).format('Y-MM-DD HH:mm:ss')
          }
          if (eventData.start < todayDate){
            alert("You can't choose a date that already past.");
            $('#calendar').fullCalendar("unselect")
            return
          }
          $('#newEvent').modal('show');
          $('#submit').unbind();
          $('#submit').on('click', function() {
            $.ajax({
              url: "../schedules",
              type: "POST",
              data: eventData,
              success: function() {
                $("#calendar").fullCalendar("renderEvent", eventData, true);
                $("#calendar").fullCalendar("refetchEvents");
              }
            });
          $('#newEvent').modal('hide');
          });
        },
      });
    })
  };
  $(document).on('turbolinks:load', initialize_calendar);