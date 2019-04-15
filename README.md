###About

Good example of Rest API test framework in BDD format, based on [Cucumber](https://cucumber.io/) with Cucumber API Steps
Tests are provided against open Best Buy API playground, which have many examples of rich RESTful API

###Installation
Please install [rvm](http://rvm.io/) with Ruby version 2.4.1 or higher
after that in checked out directory please do the following to install the dependencies:
```
bundle install
```

###Testing

####Running api tests
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