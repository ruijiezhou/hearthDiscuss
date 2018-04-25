class RepliesController < ApplicationController

	before_action :authenticate_user!
	before_action :set_reply, only: [:edit, :update, :show, :destroy]
	before_action :set_discussion, ony: [:create, :edit, :show, :update, :destroy]

	def create
		@reply = @discussion.replies.create(params[:reply]).permit(:reply, :discussion_id)
		@reply.user_id = current_user.id 

		respond+to do |format|
			if @reply.save
				format.html { redirect_to discussion_path(@discussion) }
				format.js # render create.js.erb

			else
				format.html { redirect_to discussion_path(@discussion), notice: 'Reply did not save. Please try again.' }
				format.js
			end
		end
	end

	def new
	end

	def destroy
		@reply = @discussion.replies.find(params[:id])
		@replyl.destroy
		redirect_to discussion_path(@discussion)

	end

	def edit

		@discussion = Discussion.find(params[:discussion_id])
		@reply = @discussion.replies.find(params[:id])
	end

	def update
		@reply = @discussion.replies.find(params[:id])
		respond_to do |format|
			if @reply.update(reply_params)
				format.html { redirect_to discussion_path(@discussion), notice: 'Reply was successfully updated.' }
			else
				format.html {render :edit }
				format.jason {render json: @reply.errors, status: unprocessable_entity }
			end
		end
	end


	private

	def set_discussion
		@duscussion = Discussion.find(params[:discussion_id])

	end

	def set_reply
		@reply = Reply.find(params[:id])
	end

	def reply_params
		params.require(:reply).permit(:reply)
	end



end