require_dependency 'spree/admin/reports_controller'

Spree::Admin::ReportsController.class_eval do
  ADVANCED_REPORTS = [:unavailable_products]

  def unavailable_products

  end

  private 

  def self.init_decorator!
    advanced_reports = {}
    ADVANCED_REPORTS.each do |report|
      advanced_reports[report] = {name: I18n.t("advanced_reports.#{report}.name"), :description => I18n.t("advanced_reports.#{report}.description")}
    end

    Spree::Admin::ReportsController::AVAILABLE_REPORTS.merge!(advanced_reports)
  end

  self.init_decorator!
end
