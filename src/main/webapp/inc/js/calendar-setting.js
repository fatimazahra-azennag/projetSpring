jQuery(document).ready(function(){
	jQuery("#add-event").submit(function(){
		
		var values = {};
		$.each($('#add-event').serializeArray(), function(i, field) {
			values[field.name] = field.value;
		});
		console.log(
			values
		);
	});
});  

let ev =  [
	{
		title: 'Projet JEE',
		description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
		start: '2021-02-22',
		end: '2021-02-22',
		className: 'fc-bg-default',
		icon : "rocket"
		
	},
	{
		title: 'Achitecture des ordinateurs',
		description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
		start: '2021-02-22',
		end: '2021-02-22',
		className: 'fc-bg-default',
		icon : "laptop"
		
	},
	{
		title: 'TCP/IP',
		description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
		start: '2021-02-09',
		end: '2021-02-09',
		className: 'fc-bg-default',
		icon : "network-wired"
		
	},
	{
		title: 'Technologie Web',
		description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
		start: '2021-02-11',
		end: '2021-02-11',
		className: 'fc-bg-blue',
		icon : "file-code"
	},
	{
		title: 'Compilation',
		description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
		start: '2021-02-17',
		end: '2021-02-17',
		className: 'fc-bg-default',
		icon : "laptop-code"
	},
	{
		title: 'Génie Logiciel',
		description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eu pellentesque nibh. In nisl nulla, convallis ac nulla eget, pellentesque pellentesque magna.',
		start: '2021-02-15',
		end: '2021-02-15',
		className: 'fc-bg-blue',
		icon : "map-signs"
		
	}
]


function getEvents(){
	let events = []
	let i=0
	$(".user_events").each((index)=>{
		evt = {
		id: $(".event_id").eq(index).text(),
			title: $(".event_name").eq(index).text(),
			description:$(".event_description").eq(index).text(),
			type: $(".event_type").eq(index).text(),
			start: $(".event_start").eq(index).text(),
			end: $(".event_end").eq(index).text(),
			className: $(".event_class").eq(index).text(),
			icon: $(".event_icon").eq(index).text()
			
			
		}
		events[i]=evt
		i +=1
	});
	return events;
}

ev = getEvents();



$(".datetimepicker").datepicker({ dateFormat: 'yy-mm-dd' });

(function () {
	'use strict';
	// ------------------------------------------------------- //
	// Calendar
	// ------------------------------------------------------ //
	jQuery(function() {
		// page is ready
		jQuery('#calendar').fullCalendar({
			themeSystem: 'bootstrap4',
			// emphasizes business hours
			businessHours: false,
			defaultView: 'month',
			// event dragging & resizing
			editable: true,
			// header
			header: {
				left: 'title',
				center: 'month,agendaWeek,agendaDay',
				right: 'today prev,next'
			},
			events:ev,
			dayClick: function() {
				jQuery('#modal-view-event-add').modal();
			},
			eventClick: function(event, jsEvent, view) {
				jQuery('.event-icon').html("<i class='fas fa-"+event.icon+"'></i>");
				jQuery('.event-title').html(event.title);
				jQuery('.event-body').html(event.description);
				jQuery('.eventUrl').attr('href',event.url);
				
				if(event.type==="todo"){
					jQuery('.delete_form').removeClass("d-none");
					jQuery('.suppr').attr('name','calendar_todo_id');
					jQuery('.delete_form').attr('action','/ensiasdocs/todo/calendardelete');
				}
				else{
					if(jQuery('#acc').text()==='true'){
						jQuery('.suppr').attr('name',event.type);
						jQuery('.delete_form').attr('action','/ensiasdocs/calendrier');
					}
					else{
						jQuery('.delete_form').addClass("d-none");
					}
				}
				jQuery('.suppr').attr('value',event.id);
				jQuery('#modal-view-event').modal();
			},
		})
});

})(jQuery);