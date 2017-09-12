class Cms::ActivityCategoriesController < ApplicationController
  before_filter :staff!

  def index
    @activity_categories = ActivityCategory.order(order_number: :asc)
  end

  def update
  end

  def update_order_numbers
    params[:activity_categories].each { |ac| ActivityCategory.find(ac['id']).update(order_number: ac['order_number'])}
    render json: {activity_categories: ActivityCategory.order(order_number: :asc)}
  end

  def create
    ActivityCategory.create(params[:activity_category].permit(:name, :order_number))
    return redirect_to cms_activity_categories_path
  end

  def destroy
  end
end