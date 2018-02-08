var initialize_calendar;
initialize_calendar = function() {
    $('.calendar').each(function(){
        var calendar = $(this);
        calendar.fullCalendar({
            header: {
            },
            selectable: true,
            selectHelper: true,
            editable: true,
            eventLimit: true,
            events: '/events.json',

            select: function(start, end, jsEvent, view) {
                $.getScript('/events/new', function() {
                    $("#event_start").val(moment(start).format());
                    $("#event_end").val(moment(end).format());
                });


                calendar.fullCalendar('unselect');
            },

            eventDrop: function(event, delta, revertFunc) {
                event_data = {
                    event: {
                        id: event.id,
                        start: event.start.format(),
                        end: event.end.format()
                    }
                };
                $.ajax({
                    url: event.update_url,
                    data: event_data,
                    type: 'PATCH'
                });
            },

            eventClick: function(event, jsEvent, view) {
                $.getScript(event.edit_url, function() {});
            }
        });
    });
};
$(document).on('ready', initialize_calendar);