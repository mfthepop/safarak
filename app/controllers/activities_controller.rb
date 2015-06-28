class ActivitiesController < ApplicationController
  require 'jalali_date_helper.rb'
  require 'jalali_date.rb'

  def index
    @activities = PublicActivity::Activity.order('created_at desc').where(owner_id: current_user.friend_ids, owner_type: "User" )
  end
end
