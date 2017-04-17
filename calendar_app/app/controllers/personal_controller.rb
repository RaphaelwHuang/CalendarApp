class PersonalController < EventsController
  @events = Event.all
end