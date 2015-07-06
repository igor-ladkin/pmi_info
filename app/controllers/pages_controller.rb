class PagesController < ApplicationController
  def index
  end

  def search
    unless params[:s].present?
      flash[:warning] = 'Please enter lastname or couple letters lastname starts with.'
      redirect_to root_path
      return true
    end

    force_update_flag = params.fetch(:force, 'false') == 'true'

    @holders = Holder.lastname_starts_with params[:s]
    force_update = force_update_flag || @holders.empty?

    return render :search unless force_update

    @holders = Holder.refresh_info_for params[:s]
  end
end
