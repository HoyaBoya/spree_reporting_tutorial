Spree::Admin::ReportsController.class_eval do
  before_filter :advanced_report_setup, only: [:index]

  def unavailable_products
    params[:q] = {} unless params[:q]

    if params[:q][:created_at_gt].blank?
      params[:q][:created_at_gt] = Time.zone.now.beginning_of_month
    else
      params[:q][:created_at_gt] = Time.zone.parse(params[:q][:created_at_gt]).beginning_of_day rescue Time.zone.now.beginning_of_month
    end

    if params[:q] && !params[:q][:created_at_lt].blank?
      params[:q][:created_at_lt] = Time.zone.parse(params[:q][:created_at_lt]).end_of_day rescue ""
    end

    params[:q][:available_on_null] = true

    params[:q][:s] ||= "created_at desc"

    @search = Spree::Product.ransack(params[:q])
    @products = @search.result
  end

  protected

  def advanced_report_setup
    Spree::Admin::ReportsController.add_available_report! :unavailable_products
  end
end
