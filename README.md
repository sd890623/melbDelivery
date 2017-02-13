# 送餐网客户系统
参考[墨尔本送餐](http://melbsc.com.au/)

## Ruby version ##
2.3.1

## Development ##
0. Get rails (for a quick start, you can run `gem install rails`)
1. Run `bundle install --without production`
2. Run `bundle exec rake db:migrate`
3. Run `bundle exec rails server` to start the service

## Testing ##

### Unit Test###
```sh
bundle exec rake db:migrate RAILS_ENV=test
rspec spec
```

