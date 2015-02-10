class BroadcastsController < ApplicationController
	before_action :set_broadcast, only: [:show]

	def index
		@broadcasts = Broadcast.all.order(broadcast_date: :desc).to_json
	end

	def show
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_broadcast
      @broadcast = Broadcast.find params[:id]
    end
end
