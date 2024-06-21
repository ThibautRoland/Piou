require_relative '../../../level_1/traduction'

class MessagesController < ApplicationController

  include Translation

  before_action :set_message, only: :show
  before_action :authenticate_user!

  def index
    @messages = Message.all
    @tags = Tag.all
  end

  def show
    @translation = Translation.encode(@message.content)
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

  def messages_by_tag
    @tag_name = params[:name]
    tag = Tag.find_by(tag: @tag_name)
    @messages = tag ? Message.where(tag:) : nil
    @emoji = ''
    @emoji = '🔑' if @tag_name == 'secret'
    @emoji = '🤣' if @tag_name == 'rigolo'
    @emoji = '⚠' if @tag_name == 'urgent'

  end

  private

  def set_message
    @message = Message.find(params[:id])
  end
end
