class PagesController < ApplicationController
  before_action :check_format_for_search, only: :search

  def index
  end

  def search
    force_update_flag = params.fetch(:force, 'false') == 'true'

    @holders = Holder.lastname_starts_with params[:s]
    force_update = force_update_flag || @holders.empty?

    return render :search unless force_update

    @holders = Holder.refresh_info_for params[:s]

    if @holders.empty?
      flash[:alert] = 'There are no holders with that lastname.'
      redirect_to root_path
      return true
    end

    @holders
  end

  private

  def check_format_for_search
    unless params[:s] =~ /\A[a-z ,.'-]+\z/i
      flash[:warning] = 'Please enter lastname or couple letters lastname starts with.'
      redirect_to root_path
      return true
    end

    true
  end
end
