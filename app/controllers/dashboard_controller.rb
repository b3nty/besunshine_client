class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def conf
    @zoom_client = Zoom.new
    @user_id = @zoom_client.user_list['users'][0]['id']
    @meeting_list = @zoom_client.meeting_list(user_id: @user_id)
  end

  def meeting_create
    @zoom_client = Zoom.new
    @user_id = @zoom_client.user_list['users'][0]['id']

    @zoom_client.meeting_create(user_id: @user_id)
    respond_to do |format|
      begin
        flash[:success] = 'Votre réunion Zoom a bien été créée'
        format.html { redirect_to conf_dashboard_index_path }
        format.js { head :no_content }
      rescue Zoom::Error => exception
        flash[:alert] = 'Une erreur est survenue, veillez contactez l\'administrateur'
        format.html { redirect_to conf_dashboard_index_path }
        format.js { head :no_content }
      end
    end
  end

  def meeting_delete
    @zoom_client = Zoom.new
    @zoom_client.meeting_delete(meeting_id: params[:value])
    respond_to do |format|
      begin
        flash[:success] = 'Votre réunion Zoom a bien été créée'
        format.html { redirect_to conf_dashboard_index_path }
        format.js { head :no_content }
      rescue Zoom::Error => exception
        flash[:alert] = 'Une erreur est survenue, veillez contactez l\'administrateur'
        format.html { redirect_to conf_dashboard_index_path }
        format.js { head :no_content }
      end
    end
  end
end
