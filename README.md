# sample-web-testing

## Overview
There is a sample of _business-oriented tests_ as they should be. Tests are written in a declarative manner, they interact with page elements as an real user does and should be consider as a last source of project specifications. No duplicated testcases in any other separated source - all specifications should be placed under `features` repository.

The framework is written in Ruby and used such extensions:
 - [cucumber](https://github.com/cucumber/cucumber) - a collaboration tool with executive specs;
 - [watir](http://watir.github.io) - most popular framework to interact with browser elements (built on top of WebDriver interface);
 - [watirsome](https://github.com/p0deje/watirsome) - page-object pattern implementation for watir framework;
 - [rspec-expectations](https://github.com/rspec/rspec-expectations) - lib from popular BDD framework which lets a describing expressions of expected outcomes on an object in an example.

## Slides

Slides related to the project are available [here](https://www.slideshare.net/korvinua/endtoend-webtesting-based-on-rubycucumberwatirwatirsomerspecexpectation-technologies).

## Website sample

As a website sample I use http://automationpractice.com. It's a full featured e-commerce website simulator.

We would test product selection and making order there.

![website sample](https://d1ro8r1rbfn3jf.cloudfront.net/ms_44580/Rqj9w5v4QgabCeyBzpxh6G1heHuqs7/My%2BStore%2B2017-06-07%2B12-59-48.png?Expires=1496916007&Signature=FtQY7lqpzvbC8G2EA3at0UBLvSpBCdhil8ACbNd0TsJJE4KTwFXycPDoYzUhsC2MX9~5ikLHlo97Q1puZ4t3uN2wxN~LGH~Q6fuUP2v37A1V0GYY0GD-5EwlAG7jJqcdijzmSWrs~-1YIK0zJpwaJpRi9QXnEf7uSdM~O6Zk1yQqxuDegOSvSGhtUU8bdpB-AMLBAlwBLFZ~RrjpD1OLiWYBiUNm8Lv82ZK1fjkTLEwBncXf37W9Qnao~9JMGDaU5tH1wRwIO45Twz22WMB8WO0CmN06~9cBZ3qiOpT5u0EqRoTOoiXtt9FCPioWk6aXJThJL7yo2j3vn8JwPVhe6w__&Key-Pair-Id=APKAJHEJJBIZWFB73RSA)

## Test structure
```
├── config # storage of different config files
    ├── cucumber.yml # cucumber profiles
    ├── settings.yml # storage for custom config data such as browser type or base url
├── features # storage of test scenarios
    ├── lib # custom libs
        ├── helper.rb # storage of basic helper methods
        ├── page.rb # abstract class for page object models
    ├── pages # implementations of page object models
    ├── steps # storage of test step definitions
    ├── support # storage of cucumber env files and hooks preloaded for every test run
├── report.html # auto-generated html-report
```
## Preparation

### Installing Ruby
The framework requires Ruby version 2.4.1. The simplest way to manage ruby version is using [rbenv](https://github.com/rbenv/rbenv)

#### Installing rbenv on OS X systems
```
$ brew update
$ brew install rbenv
$ brew install ruby-build
$ rbenv init # and follow instructions from console output
$ rbenv install -l # list all available for installation ruby versions
$ rbenv install 2.4.1
```
(for Linux distributions - follow [official guide](https://github.com/rbenv/rbenv#basic-github-checkout))

After navigation to the project root directory, rbenv will recognize specified ruby version in `.ruby-version` file and switch on it. To check the its success, perform in console:
```
$ rbenv version
2.4.1 (set by /Users/<username>/gems-ui-test/.ruby-version)
```
If you see output like this - everything is fine.

### Installing Ruby gems
I recommend to use `bundler` to manage Ruby gems. First of all, you're need to install bundler gem itself:

```
gem install bundler
```
After this, you can use `bundler` to manage all other gems for the project:
```
bundler install
```

Now, you are ready to run our samples of business-oriented tests.

## Run features

To run features, go to the project dir in console and perform:
```
bundle exec cucumber
```

_**Nota bene**: we specify `bundle exec` before actual ruby command to be sure that will be used proper version of the gem (specified in Gemfile)_

It will run scenarios described in [sample_shopping_declarative.feature](features/sample_shopping_declarative.feature) due to [default cucumber setting](config/cucumber.yml:1). The result will be shown in console. Due to default setting for this project, cucumber will also duplicate results in _report.html_ file. You can learn more about how to run specific feature/scenario in [cucumber wiki](https://github.com/cucumber/cucumber/wiki/Running-Features). Don't forget - cucumber [profiles](https://github.com/cucumber/cucumber/wiki/cucumber.yml) and [tags](https://github.com/cucumber/cucumber/wiki/Tags) gives additional abilities for test running.

**So, enjoy your testing! Feel free to report an github issue if you have any questions.**


## TODO
- add CI
- add rubycop
