module MobileApp::EventsHelper
	def calendar(date = Date.today, &block)
    Calendar.new(self, date, block).calendar_with_header
  end

  def calendar_weeks(date = Date.today, &block)
    Calendar.new(self, date, block).week_rows
  end

  def new_calendar(date = Date.today, &block)
    Calendar.new(self, date, block)
  end


  def link_for_event
  end

  class Calendar < Struct.new(:view, :date, :callback)
    HEADER_SHORT = %w[Dom Lun Mar Mie Jue Vie Sab]
    HEADER_LONG = %w[Domingo Lunes Martes Miercoles Jueves Viernes Sabado]
    START_DAY = :sunday

    delegate :content_tag, :link_to, :mobile_app_events_url ,to: :view

    def calendar_with_header
    	content_tag :div, class: "calendar-body" do
    		table_with_headers
    	end
    end

    def table_with_headers
      content_tag :table, class: "calendar-days" do
        table_headers + table_body
      end
    end

    def table_headers
      content_tag :thead do
        header_long + header_short
      end
    end

    def table_body
      content_tag :tbody, class: "week-rows", :id=>"week-rows" do
        week_rows
      end
    end

     def header_long
      content_tag :tr, class: "calendar-header calendar-header-long",:data=>{:role=>"header"} do
        HEADER_LONG.map { |day| content_tag :th, day }.join.html_safe
      end
    end

    def header_short
      content_tag :tr,class: "calendar-header calendar-header-short",:data=>{:role=>"header"} do
        HEADER_SHORT.map { |day| content_tag :th, day }.join.html_safe
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :tr do
          week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def day_cell_link(day)
      if day.month != date.month
        content_tag :div, class: "day-buttom" do
          view.capture(day, &callback)
        end
      else
        link_to "#events-date", :data=>{:backend=>mobile_app_events_url(:date_at=>day)}, :class=>"day-link backend-link" do
          content_tag :div, class: "day-buttom day-buttom-link" do
            view.capture(day, &callback)
          end
        end
      end
    end

    def day_cell(day)
        content_tag :td, class: day_classes(day) do
          day_cell_link(day)
        end
    end

    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << "notmonth" if day.month != date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
  end
end