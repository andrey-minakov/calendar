require 'date'

module Subject
    def initialize
      @observers = []
    end
    def add_observer(observer)
      @observers << observer
    end
    def delete_observer(observer)
      @observer.delete(observer)
    end
    def notify_observers
      @observers.each do |observer|
        observer.update(self)
      end
    end
  end

  class Calendar
    include Subject

    def initialize
      super
      @events = []
    end

    def add_event(event)
      @events << event
      notify_observers
    end

    def last_event
      @events.last
    end
  end

 class Event
   attr_reader :name, :date

   def initialize(name, date)
     @name = name
     @date = date
   end
 end

 class Person
   def update(calendar)
     puts calendar.last_event.name
     puts calendar.last_event.date.to_time.strftime('%B %e at %l:%M %p')
   end
 end

calendar = Calendar.new
person = Person.new
event = Event.new('Party', Date.today)

calendar.add_observer(person)
calendar.add_event(event)
