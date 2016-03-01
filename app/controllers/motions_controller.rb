class MotionsController < ApplicationController
	before_action :authenticate_current_user
	def index
		respond_with User.find(current_user.id).motions
	end

	def create
		
		respond_with Motion.create(motion_params.merge(user_id: current_user.id))
	end


    private

    def motion_params
    	params.require(:motion).permit(:date, :steps)
    end
end
