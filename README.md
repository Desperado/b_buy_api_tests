### About

Good example of Rest API test framework in BDD format, based on [Cucumber](https://cucumber.io/) with Cucumber API Steps
Tests are provided against open Best Buy API playground, which have many examples of rich RESTful API

### Installation

#### MacOS

Please Install *Xcode Commandline tools* and `gpg` before `rvm`

```
xcode-select --install
brew install gpg
```

Please install [rvm](http://rvm.io/) with Ruby version 2.4.1 or higher
after that in checked out directory please do the following to install the dependencies:
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.4.1
```

Checkout and cd to repository contents, then do:

```
source /<your_local_dir>/.rvm/scripts/rvm
rvm use 2.4.1
gem install bundler
bundle install
```

### Testing

#### Running api tests
The tool used to run API tests is [Cucumber](https://cucumber.io/)
```
cucumber --format pretty
```

To execute just one Test Scenario you need to run:
```
cucumber features/storesApi.feature --format pretty
```


To get also html output format, please run
```
cucumber --format pretty --format html --out report/report.html
```