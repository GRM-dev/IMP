class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  # POST /invite_user
  def invite_new
    headers['Last-Modified'] = Time.now.httpdate
   render layout: false
  end

  # POST /invite_user
  def invite_user
    ps = inv_params
    begin
      @user = User.find ps[:selected_mail_id].to_i
    rescue ActiveRecord::RecordNotFound => e
      @user = nil
    end
    if @user == nil
      if ps[:selected_mail_mail] =~ VALID_EMAIL_REGEX
        notice = 'Invited'
      else
        notice = 'Wrong email format'
      end
      respond_to do |format|
        format.js { flash[:notice] = notice}
        format.html {redirect_to dashboard_path, alert: 'Page not exists' }
      end
    else
      if @user.email == ps[:selected_mail_mail]
        notice = 'Added'
      else
        notice = 'Smth strange happen'
      end
      respond_to do |format|
        format.js { flash[:notice] = notice}
        format.html {redirect_to dashboard_path, alert: 'Page not exists' }
      end
    end
  end

  # GET /user_mails
  def user_mails
    @users = User.all
    respond_to do |format|
      format.json
      format.html {redirect_to dashboard_path, alert: 'Page not exists' }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
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
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to controller: :users, action: :show, id: @user.id, notice: 'User was successfully created.', locale: I18n.locale }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:visible_name, :email, :password)
    end
    
    def inv_params
      params.permit(:selected_mail_id, :selected_mail_mail)
    end
end
