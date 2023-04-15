# Rotten

Rotten is a Ruby gem that allows users to search for details about movies and TV shows from the popular movie review website, Rotten Tomatoes. With Rotten, users can search for a specific movie or TV show and receive information such as the title, release year, cast, and Rotten Tomatoes score. This gem provides an easy-to-use interface for developers who want to integrate Rotten Tomatoes data into their Ruby applications. Simply install the gem and you can start using Rotten to access Rotten Tomatoes data in your code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rotten'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rotten

## Usage
```ruby
require 'rotten'
```
Search details such as rotten tomatoes id, year, cast, score by giving title
```ruby
search_results = Rotten::SearchResults.new("Star Wars").search
# {:movies=>[{:name=>"Star Wars: The Rise of Skywalker", :castItems=>["Carrie Fisher", "Mark Hamill", "Adam Driver"], :year=>"2019", :meterScore=>"52", :meterClass=>"rotten", :url=>"/m/star_wars_the_rise_of_skywalker"}, {:name=>"Star wars resistance: The recruit", :castItems=>["Unknown Actor"], :year=>"2018", :meterScore=>"", :meterClass=>"", :url=>"/m/star_wars_la_resistencia_the_recruit"}, {:name=>"Star Wars: The Last Jedi", :castItems=>["Mark Hamill", "Carrie Fisher", "Adam Driver"], :year=>"2017", :meterScore=>"91", :meterClass=>"certified-fresh", :url=>"/m/star_wars_the_last_jedi"}, {:name=>"Star Wars: The Force Awakens", :castItems=>["Harrison Ford", "Mark Hamill", "Carrie Fisher"], :year=>"2015", :meterScore=>"93", :meterClass=>"certified-fresh", :url=>"/m/star_wars_episode_vii_the_force_awakens"}, {:name=>"Star Wars Rebels: Spark of Rebellion", :castItems=>["Freddie Prinze Jr.", "Vanessa Marshall", "Taylor Gray"], :year=>"2014", :meterScore=>"", :meterClass=>"", :url=>"/m/star-wars-secrets-of-the-rebellion"}, {:name=>"Star Wars: The Clone Wars", :castItems=>["Matt Lanter", "Ashley Eckstein", "James Arnold Taylor"], :year=>"2008", :meterScore=>"18", :meterClass=>"rotten", :url=>"/m/clone_wars"}, {:name=>"Star Wars: Episode III -- Revenge of the Sith", :castItems=>["Ewan McGregor", "Natalie Portman", "Hayden Christensen"], :year=>"2005", :meterScore=>"79", :meterClass=>"certified-fresh", :url=>"/m/star_wars_episode_iii_revenge_of_the_sith"}, {:name=>"Star Wars: Revelations", :castItems=>["Gina Hernandez", "Frank Hernandez", "Joe Lancaster"], :year=>"2005", :meterScore=>"", :meterClass=>"", :url=>"/m/star-wars-revelations"}, {:name=>"Star Wars: Empire of Dreams", :castItems=>["Robert Clotworthy", "George Lucas", "Ralph McQuarrie"], :year=>"2004", :meterScore=>"", :meterClass=>"", :url=>"/m/star_wars_empire_of_dreams"}, {:name=>"Star Wars: Episode II -- Attack of the Clones", :castItems=>["Ewan McGregor", "Natalie Portman", "Hayden Christensen"], :year=>"2002", :meterScore=>"65", :meterClass=>"fresh", :url=>"/m/star_wars_episode_ii_attack_of_the_clones"}], :tvSeries=>[{:title=>"Star Wars: Young Jedi Adventures", :castItems=>[], :startYear=>"2023", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_young_jedi_adventures"}, {:title=>"Star Wars: Tales of the Jedi", :castItems=>[], :startYear=>"2022", :endYear=>"", :meterScore=>"100", :meterClass=>"fresh", :url=>"/tv/star_wars_tales_of_the_jedi"}, {:title=>"Star Wars: The Bad Batch", :castItems=>[], :startYear=>"2021", :endYear=>"", :meterScore=>"88", :meterClass=>"fresh", :url=>"/tv/star_wars_the_bad_batch"}, {:title=>"Star Wars Vintage: Clone Wars 2D Micro-Series", :castItems=>[], :startYear=>"2021", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_vintage_clone_wars_2d_micro_series"}, {:title=>"Star Wars: Visions", :castItems=>[], :startYear=>"2021", :endYear=>"", :meterScore=>"96", :meterClass=>"fresh", :url=>"/tv/star_wars_visions"}, {:title=>"Star Wars: Galaxy of Sounds", :castItems=>[], :startYear=>"2021", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_galaxy_of_sounds"}, {:title=>"Star Wars: Vehicle Flythroughs", :castItems=>[], :startYear=>"2021", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_vehicle_flythroughs"}, {:title=>"Star Wars: Jedi Temple Challenge", :castItems=>[], :startYear=>"2020", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_jedi_temple_challenge"}, {:title=>"Star Wars: Blips", :castItems=>[], :startYear=>"2019", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_blips"}, {:title=>"Star Wars Resistance", :castItems=>[], :startYear=>"2018", :endYear=>"", :meterScore=>"92", :meterClass=>"fresh", :url=>"/tv/star_wars_resistance"}]}
```
To get only movies
```ruby
search_results[:movies]
# [{:name=>"Star Wars: The Rise of Skywalker", :castItems=>["Carrie Fisher", "Mark Hamill", "Adam Driver"], :year=>"2019", :meterScore=>"52", :meterClass=>"rotten", :url=>"/m/star_wars_the_rise_of_skywalker"}, {:name=>"Star wars resistance: The recruit", :castItems=>["Unknown Actor"], :year=>"2018", :meterScore=>"", :meterClass=>"", :url=>"/m/star_wars_la_resistencia_the_recruit"}, {:name=>"Star Wars: The Last Jedi", :castItems=>["Mark Hamill", "Carrie Fisher", "Adam Driver"], :year=>"2017", :meterScore=>"91", :meterClass=>"certified-fresh", :url=>"/m/star_wars_the_last_jedi"}, {:name=>"Star Wars: The Force Awakens", :castItems=>["Harrison Ford", "Mark Hamill", "Carrie Fisher"], :year=>"2015", :meterScore=>"93", :meterClass=>"certified-fresh", :url=>"/m/star_wars_episode_vii_the_force_awakens"}, {:name=>"Star Wars Rebels: Spark of Rebellion", :castItems=>["Freddie Prinze Jr.", "Vanessa Marshall", "Taylor Gray"], :year=>"2014", :meterScore=>"", :meterClass=>"", :url=>"/m/star-wars-secrets-of-the-rebellion"}, {:name=>"Star Wars: The Clone Wars", :castItems=>["Matt Lanter", "Ashley Eckstein", "James Arnold Taylor"], :year=>"2008", :meterScore=>"18", :meterClass=>"rotten", :url=>"/m/clone_wars"}, {:name=>"Star Wars: Episode III -- Revenge of the Sith", :castItems=>["Ewan McGregor", "Natalie Portman", "Hayden Christensen"], :year=>"2005", :meterScore=>"79", :meterClass=>"certified-fresh", :url=>"/m/star_wars_episode_iii_revenge_of_the_sith"}, {:name=>"Star Wars: Revelations", :castItems=>["Gina Hernandez", "Frank Hernandez", "Joe Lancaster"], :year=>"2005", :meterScore=>"", :meterClass=>"", :url=>"/m/star-wars-revelations"}, {:name=>"Star Wars: Empire of Dreams", :castItems=>["Robert Clotworthy", "George Lucas", "Ralph McQuarrie"], :year=>"2004", :meterScore=>"", :meterClass=>"", :url=>"/m/star_wars_empire_of_dreams"}, {:name=>"Star Wars: Episode II -- Attack of the Clones", :castItems=>["Ewan McGregor", "Natalie Portman", "Hayden Christensen"], :year=>"2002", :meterScore=>"65", :meterClass=>"fresh", :url=>"/m/star_wars_episode_ii_attack_of_the_clones"}]
```
To get only tvseries
```ruby
search_results[:tvSeries]
# [{:title=>"Star Wars: Young Jedi Adventures", :castItems=>[], :startYear=>"2023", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_young_jedi_adventures"}, {:title=>"Star Wars: Tales of the Jedi", :castItems=>[], :startYear=>"2022", :endYear=>"", :meterScore=>"100", :meterClass=>"fresh", :url=>"/tv/star_wars_tales_of_the_jedi"}, {:title=>"Star Wars: The Bad Batch", :castItems=>[], :startYear=>"2021", :endYear=>"", :meterScore=>"88", :meterClass=>"fresh", :url=>"/tv/star_wars_the_bad_batch"}, {:title=>"Star Wars Vintage: Clone Wars 2D Micro-Series", :castItems=>[], :startYear=>"2021", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_vintage_clone_wars_2d_micro_series"}, {:title=>"Star Wars: Visions", :castItems=>[], :startYear=>"2021", :endYear=>"", :meterScore=>"96", :meterClass=>"fresh", :url=>"/tv/star_wars_visions"}, {:title=>"Star Wars: Galaxy of Sounds", :castItems=>[], :startYear=>"2021", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_galaxy_of_sounds"}, {:title=>"Star Wars: Vehicle Flythroughs", :castItems=>[], :startYear=>"2021", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_vehicle_flythroughs"}, {:title=>"Star Wars: Jedi Temple Challenge", :castItems=>[], :startYear=>"2020", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_jedi_temple_challenge"}, {:title=>"Star Wars: Blips", :castItems=>[], :startYear=>"2019", :endYear=>"", :meterScore=>"", :meterClass=>"", :url=>"/tv/star_wars_blips"}, {:title=>"Star Wars Resistance", :castItems=>[], :startYear=>"2018", :endYear=>"", :meterScore=>"92", :meterClass=>"fresh", :url=>"/tv/star_wars_resistance"}]
```

Search score, meteclass, year, votes by using rotten tomatoes id
```ruby
search_results = Rotten::MovieDetails.new("/m/star_wars_the_rise_of_skywalker").details
# {:name=>"Star Wars: The Rise of Skywalker", :year=>"2019", :meterScore=>"52", :meterClass=>"rotten", :votes=>{"All Critics"=>522, "Top Critics"=>88, "Fresh"=>270, "Rotten"=>252}, :url=>"/m/star_wars_the_rise_of_skywalker"}

search_results[:votes]
# {"All Critics"=>522, "Top Critics"=>88, "Fresh"=>270, "Rotten"=>252}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rotten-tomatoes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Rotten::Tomatoes project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/rotten-tomatoes/blob/master/CODE_OF_CONDUCT.md).
