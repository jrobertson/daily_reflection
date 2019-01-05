#!/usr/bin/env ruby

# file: daily_reflection.rb

require 'wiki_md'


class DailyReflection < WikiMd
  using ColouredText

  attr_accessor :date

  def initialize(s, debug: false, date: Date.today, 
                title: 'My Daily Reflection')

    @date = date
    super(s, order: 'descending', debug: debug, title: title)

    create_day() unless found_today?

  end

  def add_entry(s)

    create_day() unless found_today?

    e = Entry.new(@dxsx.dx.all.first)
    e.body = e.body + "\n" + s
    update_index(@dx.all.first, e.tags.join(' '))
    save_files()

  end

  def find_today()
    r = self.find @date.strftime("%-d %b %Y")
    puts ('r: ' + r.inspect).debug if @debug
    r
  end

  def found_today?()
    self.find_today()
  end

  def create_day()

    date = @date.strftime("%-d %b %Y")
    self.create_section "# %s\n\n\n+ %s" % [date, @date.year]

  end

  def today()

    Entry.new(@dxsx.dx.all.first)

  end

end
