## hacknation
Application for Cognizant Hacknation

## DB Setup
```
git pull origin master
bundle install
sudo service postgresql start
sudo -su postgre psql
CREATE ROLE hacknation WITH LOGIN CREATEDB PASSWORD 'hacknation';
bundle exec rake db:create db:migrate db:seed
bundle exec rails s
```

### AdminLTE
Add this line to your application's Gemfile:
```bash
gem 'adminlte2-rails'
gem 'bootstrap_form'
gem 'bootstrap-sass'
```
And then execute:

```bash
$ bundle
```
Then, generate the default template:

```bash
$ bin/rails generate admin_lte2
```
###Plugins
By default, there's no plugin installed. However, I've created a generator to help you install them.

```bash
$ rails g admin_lte2_plugins PLUGIN_NAME
```
###Plugins Available:
    jVectorMap (j_vector_map)
    ChartJS (chart_js)
    Sparkline (sparkline)
    Bootstrap Slider (bootstrap_slider)
    Bootstrap WYSIHTML5 (bootstrap_wysihtml5)
    Full Calendar (fullcalendar)
    Knob (knob)
    TimePicker (timepicker)
    Pace (pace)
    MorrisJS (morris)
    Date Range Picker (daterangepicker)
    Color Picker (colorpicker)
    Date Picker (datepicker)
    slimScroll (slimScroll)
    iCheck (icheck)
    Toastr (toastr)
