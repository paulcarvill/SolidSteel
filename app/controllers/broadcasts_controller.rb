class BroadcastsController < ApplicationController
	before_action :set_broadcast, only: [:show, :edit]
	caches_page :index

	def index
		@broadcastsFirst = Broadcast.all.order(broadcast_date: :desc).first
		@broadcastsLast = Broadcast.all.order(broadcast_date: :desc).last
	end

	def show
	end

	def timeline
	  @broadcasts = Broadcast.all.order(broadcast_date: :desc).to_json
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcast
      @broadcast = Broadcast.find params[:id]
    end
end
