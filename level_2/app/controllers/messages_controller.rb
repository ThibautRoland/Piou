require_relative '../../../level_1/translation_service'

class MessagesController < ApplicationController

  include Translation

  before_action :set_message, only: :show

  def index
    @messages = Message.all
  end

  def show
    @translation = translate('to_piou', @message.content)
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end
end
