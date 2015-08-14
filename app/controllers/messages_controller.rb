class MessagesController < ApplicationController
   before_action :set_message, only: [:edit, :update]
   def destroy
    @message.destroy
    redirect_to root_path, notice: 'メッセージを削除しました'
  end

  def index
    # Messageを全て取得する。
    @messages = Message.all
    @message = Message.new
  end
    def edit
  end
  
 ## ここから追記
 def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end   
  def create
       @message = Message.new(message_params)
    if @message.save
      redirect_to root_path , notice: 'メッセージを保存しました'
    else
      # メッセージが保存できなかった時
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました。"
      render 'index'
   end 
  end 
  private
  def message_params
    params.require(:message).permit(:name, :body)
  end  
  def set_message
    @message = Message.find(params[:id])
  end
end  
