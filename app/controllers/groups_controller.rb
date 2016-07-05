class GroupsController < ApplicationController
  before_action :require_user

  def index_for_dashboard

    render layout: false
  end

  def manage

    render layout: false
  end

  def add_group

    render layout: false
  end

  def remove_group

    render layout: false
  end
end
