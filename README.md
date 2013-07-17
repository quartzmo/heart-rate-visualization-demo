Heart RateVisualization Demo
=============================

A data visualization app created using Ruby 2.0.0, Rails 4.0.0, MySQL 5.6.12, and Highcharts 3.0.2.

## Performance challenges

The dataset used for this exercise (sorry, not included in this repo due to its size) consists of 10,000 Users, 51,878 HrmSessions, and 15,356,311 HrmDataPoints.

I used the `will_paginate` gem to improve the load time of the Users index view. With more time, I would add search and possibly sorting to make it easier to locate a specific User.

The HrmSessions index view (nested under each User) displays a number of values aggregated from a large number of associated HrmDataPoints, such as a weighted average heart rate. Since this is historical and presumably immutable data, I decided de-normalizing the schema would be the best short term solution to improving performance for this view. To populate the new fields such as `bpm_weighted_avg`, I wrote an ActiveRecord `before_save` callback on HrmSession, and started running it in Rails console... After watching it chug along for a bit, I had to kill it in the interest of time. It gave me enough data to keep developing, and although the ActiveRecord AREL operations that I quickly wrote could be greatly improved with native SQL, I still think the simple approach of storing calculated values at record insertion or via a batch job, using an ad-hoc "reporting" schema, is a straightforward, simple solution to this kind of problem.

## Animated data visualization

One requested feature for the app is a JavaScript-based visualization that would allow the user to 'replay' a session by animating the appearance of a series of graph points over the time interval captured in the data. Although the use of Backbone, Angular, or Ember was suggested, I decided to see what I could do with [Highcharts](http://www.highcharts.com/), which I have used with great success for interactive reporting and visualization. Unfortunately, although the [Spline updating each second](http://www.highcharts.com/demo/dynamic-update) demo got me off to a promising start, I ran into a bit of a wall trying to schedule the interval between new points using the actual session data. I think it would be worth spending a several more hours exploring the possibilities with Highcharts. My fallback plan would be to use Backbone (Angular support for animations is still in its early stages at this time), coding a solution myself at a much lower level, but I think the polish and breadth of Highcharts is hard to match.

## Conclusion

The suggested time for the exercise was 3 hours, but I spent more than 6 hours working on it, across several sessions. I have been waiting patiently for months for the chance to use Ruby 2.0 and Rails 4, and once started, I was curious to explore. For example, I added a few plugins such as `will_paginate` and [seyhunak/twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails) to see if they would work. There were very few issues, although I ran into trouble with Turbolinks and both the generated Bootstrap layout and Highcharts. The former loads the application JavaScript file(s) from within `body`, which defeats the purpose of (and breaks) Turbolinks. To get Highcharts to work correctly, I discovered that I needed to add the `jquery-turbolinks` gem.

Overall, this was an extremely fun and interesting exercise. I'm glad I had the opportunity to work on it.




