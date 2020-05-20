// $(document).ready(function() {
//   $(".fc-time-grid-container").css("height", $(".fc-slats").height());
// });

var todayDate = new Date();
// todayDate.setHours(0,0,0,0);

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
        defaultTimedEventDuration: '00:15:00',
        slotDuration: '00:15:00',
        slotLabelInterval: 15,
        minTime: "10:00:00",
        maxTime: "18:00:00",
        events: window.location.pathname + "/schedules",
        displayEventTime: false,
        eventAfterRender: function (event, element, view) {
          var todayDate = new Date();
          var date = changeFormatOfTime(todayDate)
          var eventDate = changeFormatOfTime(event.start)
          if (eventDate < date ) {
              element.css('background-color', 'grey');
          } else if (eventDate == date) {
              element.css('background-color', 'red');
          } else if (eventDate > date) {
              element.css('background-color', 'green');
          }
      },
        select: function(start, end) {
          $(".fc-highlight").css("background", "green");
          var title = "Booked";
          var eventData = {
            title: title,
            start: moment(start).format('Y-MM-DD HH:mm:ss'), 
            end: moment(end).format('Y-MM-DD HH:mm:ss')
          }
          if (eventData.start < moment(todayDate).format('Y-MM-DD HH:mm:ss')){
            alert("You can't choose a date that already past.");
            $('#calendar').fullCalendar("unselect")
            return
          }
          $('#newEvent').modal('show');
          $('#submit').unbind();
          $('#submit').on('click', function() {
            $.ajax({
              url: window.location.pathname + "/schedules",
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
        eventClick: function(schedule, jsEvent, view) {
          id = schedule.id
          $('#newEvent').modal('show');
          $('#submit').unbind();
          $('#submit').on('click', function() {
            $.ajax({
              url: window.location.pathname + "/schedules/"+id,
              type: "DELETE",
              success: function() {
                $("#calendar").fullCalendar("removeEvents",schedule.id);
                $("#calendar").fullCalendar("refetchEvents");
              }
            });
          $('#newEvent').modal('hide');
          });
        }
      });
    })
  };
  $(document).on('turbolinks:load', initialize_calendar);

  function changeFormatOfTime(str){
    var date = new Date(str),
    mnth = ("0" + (date.getMonth() + 1)).slice(-2),
    day = ("0" + date.getDate()).slice(-2);
  return [date.getFullYear(), mnth, day].join("-");
  }