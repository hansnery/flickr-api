class StaticPagesController < ApplicationController
  require 'flickr'

  def home
    flickr = Flickr.new ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET']
    unless params[:user_id].nil?
      begin
        @photos = flickr.photos.search(user_id: params[:user_id])
        @user = flickr.people.getInfo(user_id: params[:user_id])
      rescue Flickr::FailedResponse
        @user = nil
        @photos = flickr.photos.search(user_id: '194067800@N02')
      end
    end
  end
end
