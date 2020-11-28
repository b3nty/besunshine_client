class Admin::UsersController < Admin::AdminController

  def index
    @users = User.all.sort_by{ |m| m.firstname.downcase }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to admin_users_path
    else
      render action: :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params_user)
      redirect_to admin_users_path
    else
      render action: :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  def methode_check
    @user = User.find(params[:id])
    if @user.update_attributes(activated: !@user.activated)
      redirect_to admin_users_path
    else
      render action: :new
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :lastname, :firstname, :password)
  end

end
