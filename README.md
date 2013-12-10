Spree Advanced Reporting
========================

This is a gem that serves as the basic framework to add new reports to Spree Admin.

NOTE: 

This gem requires that the following pull request be accepted into Spree Core.

https://github.com/spree/spree/pull/4087

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
  before_filter :advanced_report_setup, only: [:index]

  ...

  def advanced_report_setup
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
