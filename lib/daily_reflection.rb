#!/usr/bin/env ruby

# file: daily_reflection.rb

require 'wiki_md'


class DailyReflection < WikiMd
  using ColouredText

  attr_accessor :date

  def initialize(s=nil, debug: false, date: Date.today, 
                period: :daily, 
                 title: "My #{period.to_s.capitalize} Reflection" )

    @date, @period = date, period
    super(s, order: 'descending', debug: debug, title: title)

    check_period_entry()

  end

  def add_entry(s)

    check_period_entry()

    e = Entry.new(@dxsx.dx.all.first)
    e.body = e.body + "\n" + s
    update_index(@dx.all.first, e.tags.join(' '))
    save_files()

  end

  def find_date(d)
    self.find d.strftime("%-d %b %Y")    
  end


  def create_day()
    create_date_entry(@date)
  end
  
  def create_week()

    d = @date
    d += 1 until d.wday == 0     

    create_date_entry(d)                                                   

  end
  
  def create_month()
    create_date_entry(Date.civil(@date.year, @date.month, -1))
  end
  
  def create_year()
    create_date_entry(Date.new(@date.year+1,1,1)-1)
  end
  
  def today()
    Entry.new(@dxsx.dx.all.first)
  end
                                                      
  private
  
  def check_period_entry()
    
    case @period.to_sym
    when :daily
      
      create_day() unless find_date(@date)
      
    when :weekly
      
      d = @date
      d += 1 until d.wday == 0   
      create_week() unless find_date(d)
      
    when :monthly
      
      d = Date.civil(@date.year, @date.month, -1)
      create_month() unless find_date(d)
      
    when :yearly
      
      create_year() unless find_date(Date.new(@date.year+1,1,1)-1)
      
    end
      
  end
                                                      
  def create_date_entry(d)
    self.create_section "# %s\n\n\n+ %s" % [d.strftime("%-d %b %Y"), d.year]
  end

end
