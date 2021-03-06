class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end
  
  def search
    # Need to not include members who are already selected. Maybe pass in those already selected? Or do some join magic
    @users = User.where("firstname LIKE ? OR lastname LIKE ?", "%"+params[:search]+"%", "%"+params[:search]+"%");
#     Need to filter out ones that already listed.
    exclude = params[:exclude]
    exclude = exclude.split(",")
    if exclude.length > 0
      @users = @users.reject{ |e| exclude.include? e.id.to_s}
    end
    respond_to do |format|
      format.json  { render :json => @users}
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end
  
  def update_profile 
    @user = User.find_by_id(params[:id])
    if user_params[:firstname]
      @user.firstname = user_params[:firstname]
    end
    if user_params[:lastname]
      @user.lastname = user_params[:lastname]
    end
    if user_params[:email]
      @user.email = user_params[:email]
    end
    if user_params[:password]
      if User.validate(@user,user_params[:password])
        if user_params[:password] == user_params[:password_confirmation]
          @user.password = user_params[:password]
        end
      end
    end
    respond_to do |format|
      if @user.save({validate: false})
        format.json { render :json => @user, status: :ok}
      else
        format.json { render :json => @user.errors, status: :unprocessable_entity}
      end
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    respond_to do |format|
      @user = User.new(user_params)
      if @user.save
        # redirect_to root_url, :flash => { :signup_notice => "Thank you for signing up! You can log in now." }
        format.html { redirect_to root_url, :flash => { :signup_notice => "Thank you for signing up! You can log in now." } }
        format.js   { render :js => "dat.ui.openLogin();" }

      else
        # redirect_to root_url(:anchor => "intro_signup"), :flash => { :signup_error => "There was an error. Please make sure all fields are correct." }
        format.html { redirect_to root_url(:anchor => "intro_signup"), :flash => { :signup_error => "There was an error. Please make sure all fields are correct." } }
        format.js   { render :js => "dat.ui.scrollToSignup();" }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :firstname, :lastname, :is_admin, :is_editor, :is_viewer)
    end
end
