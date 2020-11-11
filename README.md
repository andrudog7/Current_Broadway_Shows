# CurrentBroadwayShows

Welcome to the Broadway CLI Application!

This app will allow users to access information on current Broadway Shows in New York.  They will be able to select a specific show based on a few different cateogries including (Musicals, Plays, Top 5 Grossing Current Shows, Cheapest Shows, etc.)

## Installation

Run the program locally on your CLI by following these steps:
#1. Clone the repo from https://github.com/andrudog7/current_broadway_shows
#2. In the terminal, navigate to the 'cli-application' folder
#3. Make sure Ruby is installed on your computer
#4. Run bundle install to install the program's gems
#5. To start the program type 'ruby bin/current_broadway_shows'
#6. Follow the instructions in the Terminal.

OR 

Add this line to your application's Gemfile:

```ruby
gem 'Current_Broadway_Shows'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install Current_Broadway_Shows

The following gems are needed to successfully run this CLI and are required in the bin/librarian folder: nokogiri, open-uri and pry.
To install:
gem install nokogiri
gem install open-uri
gem install pry

## Usage

To execute this CLI, type ruby bin/current_broadway_shows into the terminal. You will be greeted with category options to view Broadway Shows.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

This project is intended to be a welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Current_Broadway_Shows. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/Current_Broadway_Shows/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CurrentBroadwayShows project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/Current_Broadway_Shows/blob/master/CODE_OF_CONDUCT.md).
