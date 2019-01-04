# Introducing the daily_reflection gem

The daily_reflection is intended at the very least to help make it easier for you to recall what you did on any particular day.

Possible questions to ask yourself when creating valuable daily entries:

* In summary, what did you do today?
* What activities did you spend the most time on today? 
* What went well? 
* What didn't go so well?
* What could you do to improve the situation?




    require 'daily_reflection'


    s=<<EOF
    &lt;?dynarex schema="sections[title]/section(x)" format_mask="[!x]"?&gt;
    title: My Daily Refection

    --#

    # 4 Jan 2019

    * Collected the car from the garage.
    * Published the daily_reflection gem to rubygems.org

    + car mot gem daily_reflection ruby

    # 3 Jan 2019

    * Took the car to the garage for its yearly MOT
    * Took notes about the new project called daily_reflectionthat I wanted to publish as a gem

    + car mot project daily_reflection
    EOF

    dr = DailyReflection.new s, debug: true
    puts dr.to_s


Output:

<pre>
&lt;?dynarex schema="sections[title]/section(x)" format_mask="[!x]"?&gt;
title: My Daily Refection
--#
# 4 Jan 2019

* Collected the car from the garage.
* Published the daily_reflection gem to rubygems.org

+ car mot gem daily_reflection ruby

# 3 Jan 2019

* Took the car to the garage for its yearly MOT
* Took notes about the new project called daily_reflectionthat I wanted to publish as a gem

+ car mot project daily_reflection
</pre>


    dr.add_entry '* Purchased a new bicycle'
    puts dr.to_s

Output:

<pre>
&lt;?dynarex schema="sections[title]/section(x)" format_mask="[!x]"?&gt;
title: My Daily Refection
--#
# 4 Jan 2019

* Collected the car from the garage.
* Published the daily_reflection gem to rubygems.org
* Purchased a new bicycle

+ car mot gem daily_reflection ruby

# 3 Jan 2019

* Took the car to the garage for its yearly MOT
* Took notes about the new project called daily_reflectionthat I wanted to publish as a gem

+ car mot project daily_reflection
</pre>

    r = dr.today
    #=> #<RecordX:47153239496560 @h={:x=>"# 4 Jan 2019\n\n* Collected the car...

    r.heading #=> "# 4 Jan 2019" 

    r.body
    #=> "* Collected the car from the garage.\n* Published the daily_reflecti...

    r.body = r.body + ' and a new helmet'
    r.footer = '+ bicycle'
    puts dr.to_s

Output:

<pre>
&lt;?dynarex schema="sections[title]/section(x)" format_mask="[!x]"?&gt;
title: My Daily Refection
--#
# 4 Jan 2019

* Collected the car from the garage.
* Published the daily_reflection gem to rubygems.org
* Purchased a new bicycle and a new helmet

+ bicycle

# 3 Jan 2019

* Took the car to the garage for its yearly MOT
* Took notes about the new project called daily_reflectionthat I wanted to publish as a gem

+ car mot project daily_reflection
</pre>

The gem is ideally suited for use on the backend of a webserver to allow editing the document from a web page.

Notes:

* Date headings are automatically created
* The tag line appears on the very last line of each entry and is identified by a + sign in the 1st column
* If no tag is given a tag will automatically be generated which is the current year
* All entries are stored in 1 file Markdown file in reverse chronological order.


## Resources

* daily_reflection https://rubygems.org/gems/daily_reflection

daily_reflection gem gtd wiki_md
