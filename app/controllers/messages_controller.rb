class MessagesController < ApplicationController
  before_action :signed_in_administrator, only:
          [:new, :im, :destory]

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to controlpanel_path
  end

  def show
    @message = Message.find(params[:id])
    @message.viewed = true
    @message.save

    @from_member = Administrator.find(@message.from_member)
    @to_member =   Administrator.find(@message.to_member)
  end

  def destroy
    Message.find(params[:id]).destroy
    redirect_to im_path
  end

  def im
    @messages ||= Message.find_by_sql(["
      SELECT *
      FROM MESSAGES
      WHERE to_member = ?", current_administrator.id])
  end

  def imsended
    @messages ||= Message.find_by_sql(["
      SELECT *
      FROM MESSAGES
      WHERE from_member = ?", current_administrator.id])
  end

  private def message_params
    params.require(:message).permit(:from_member, :to_member, :theme, :text)
  end
end
