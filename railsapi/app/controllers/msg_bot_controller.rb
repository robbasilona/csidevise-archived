class MsgBotController < ApplicationController
  def receiveMsg
      @message = params[:message]
      @reply = EvacCenter.get_result(@message)
      render text: @reply
  end
end
