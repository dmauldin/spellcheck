application: Spellcheck API code exercise
author: David Mauldin <dmauldin@gmail.com>

= What it does

Provides JSON response indicating if a word is correctly spelled according to
a specific set of criteria.  If the word is not an exact match, but some number
of matches are found, they are returned as suggestions.  If no matches are found,
a 404 will be returned.  Please see exercise_sheet.txt for detailed logic.

= Requirements

This was written using Ruby 2.3.0 and while I'd love to test it on 1.9.2, I
can't seem to (easily) compile that early a version on my system (OS X 10.10).

= How to run

bundle install
bundle exec rails server -p 8080
