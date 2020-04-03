// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    plugins: ['interaction', 'timeGrid', 'dayGrid', 'list' ],
    defaultView: 'timeGrid',
    visibleRange: function(currentDate) {
      // Generate a new date for manipulating in the next step
      var startDate = new Date(currentDate.valueOf());
      var endDate = new Date(currentDate.valueOf());
  
      // Adjust the start & end dates, respectively
      startDate.setDate(startDate.getDate()); // One day in the past
      endDate.setDate(endDate.getDate() + 6); // Two days into the future
  
      return { start: startDate, end: endDate };
    },
    selectable: true,
    defaultTimedEventDuration: '00:15:00',
    minTime: "08:00:00",
    maxTime: "17:00:00",
    slotDuration: '00:15:00',
    slotLabelInterval: 15,
    selectable: true,
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'timeGridDay,timeGridWeek,listDay'
    },
    dateClick: function(info) {
      alert('clicked ' + info.dateStr);
    },
    select: function(info) {
      alert('selected ' + info.startStr + ' to ' + info.endStr);
    }
  });

  calendar.render();
});



