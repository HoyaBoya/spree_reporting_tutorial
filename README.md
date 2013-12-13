Spree Reporting Tutorial
========================

This is a gem that serves as a tutorial to add new reports to Spree Admin. It adds a simple report "Unavailable Products" to the existing "Sales Total" report that comes from a basic Spree installation.

Running Tests
=============

1) Generate the dummy test app.

```
bundle exec rake test_app
```

2) Run the tests.

```
bundle exec rake spec
```

Build and Install The Gem
=========================

```
bundle exec rake install
```

Adding A Report
===============

There are several things that need to be done in order to create a new report in Spree.

1) Register your report in the Spree::Admin::ReportsController decorator so shows up in /admin/reports. Currently this is done in a before_filter to work around issues with Spree.t text localization.

```
Spree::Admin::ReportsController.class_eval do
  before_filter :advanced_reporting_setup, only: [:index]

  ...

  def advanced_reporting_setup
    Spree::Admin::ReportsController.add_available_report! :unavailable_products
  end
end
```

2) Create the controller action that will handle the report.

```
Spree::Admin::ReportsController.class_eval do

  ...

  def my_report
    @products = Spree::Product.all
  end

  ...

end
```

3) Add the routes to config/routes.rb. These routes will be added in addition to the existing Spree routes and they should not interfere with each other. You must create a GET and POST route for the rendering and form-submission interactions

```
Spree::Core::Engine.routes.prepend do
  namespace :admin do
    resources :reports, :only => [] do
      collection do

        ...

        get   :my_report
        post  :my_report

        ...

      end
    end
  end
end

```

4) Build the report template. This is your standard ERB happiness!

5) Write tests. There are sample tests derived from the "Sales Total" tests in Spree Core.
