require_relative '../../../level_1/translation_service'

class MessagesController < ApplicationController

  include Translation

  before_action :set_message, only: :show

  def index
    @messages = Message.all
    @tags = Tag.all
  end

  def show
    @translation = translate('to_piou', @message.content)
  end

  def create
    content = params[:content]
    tag_id = params[:tag_id]
    @message = Message.create(
      content:,
      tag_id:,
      user: current_user
    )
    if @message.save
      redirect_to message_path(@message)
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end
end
