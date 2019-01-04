#!/usr/bin/env ruby

# file: daily_reflection.rb

require 'wiki_md'


class DailyReflection < WikiMd

  attr_accessor :date

  def initialize(s, debug: false, date: Date.today, 
                title: 'My Daily Reflection')

    @date = date
    super(s, order: 'descending', debug: debug, title: title)

    # if the section for today doesn't exist create it

    create_day() unless found_today()

  end

  def add_entry(s)

    create_day() unless found_today()

    rx = @dxsx.dx.all.first
    lines = rx.x.lines
    lines.insert -3, s + "\n"
    rx.x = lines.join

  end

  def find_today()
    self.find @date.strftime("%-d %b %Y")
  end

  alias found_today find_today

  def create_day()

    date = @date.strftime("%-d %b %Y")
    self.create_section "# %s\n\n\n+ %s" % [date, @date.year]

  end

  def today()

    rx = @dxsx.dx.all.first

    def rx.body()
      x.lines[1..-2].join.strip
    end

    def rx.body=(s)
      text_entry = "%s\n\n%s\n\n%s" % [self.heading, s, self.footer]
      self.x = text_entry
    end

    def rx.footer()
      x.lines.last.chomp
    end

    def rx.footer=(s)
      a = x.lines
      a[-1] = s
      self.x = a.join
    end

    def rx.heading()
      x.lines.first.chomp
    end

    def rx.tags()
      footer[1..-1].strip.split
    end

    rx

  end

end
