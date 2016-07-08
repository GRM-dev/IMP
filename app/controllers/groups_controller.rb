class GroupsController < ApplicationController
  before_action :require_user
  before_action :set_group, only: [:edit, :update, :destroy]
  before_action :set_groups, only: [:manage, :index_for_dashboard, :remove_group]

  def new
    @group = Group.new
    render layout: false
  end

  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html { redirect_to controller: :groups, action: :index_for_dashboard, id: group.id, notice: 'Group was successfully created.', locale: I18n.locale }
        format.json { render :index_for_dashboard, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    render layout: false
  end

  def update

    respond_to do |format|
      if group.update(group_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :index_for_dashboard, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def index_for_dashboard
    render layout: false
  end

  def manage

    render layout: false
  end

  def remove_group

    render layout: false
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def set_groups
      @groups = current_dashboard.groups
    end

    def group_params
      @params.require(:group).permit(:name)
    end
end
