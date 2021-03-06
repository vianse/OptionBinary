class TradesController < ApplicationController
  before_action :authenticate_user!
  #before_action :all_trades, only: [:index, :create, :update, :destroy]
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def index
    #@trades = Trade.all
    #@trades = Trade.user_trades(current_user.id)

    @trades = Trade.user_trades(current_user.id).paginate(:page => params[:page], :per_page => 10)
    #respond_with(@trades)
  end

  def show
    respond_with(@trade)
  end

  def new
    
    @brokerAccount = BrokerAccount.user_brokerAccounts(current_user.id)
    @strategy = Strategy.user_strategies(current_user.id)

    #logger.debug @nombre
    @trade = Trade.new
    respond_with(@trade)
  end

  

  def edit
    @brokerAccount = BrokerAccount.user_brokerAccounts(current_user.id)
    @strategy = Strategy.user_strategies(current_user.id)
  end

  def create
    @trade = Trade.new(trade_params)
    #@trade.save
    #respond_with(@trade)

    #if @trade.save
        #format.html { redirect_to '/dashboard/', notice: 'Post was successfully updated.' }
        #format.json { render :show, status: :ok, location: '/dashboard' }
    #end
  end

  def update
    @trade.update(trade_params)
    respond_with(@trade)
  end

  def destroy
    
    @trade.destroy
    respond_to do |format|
      format.html { redirect_to trades_url, notice: 'Trade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    #def all_trades
    #  @trades = Trade.user_trades(current_user.id)
    #end

    def set_trade
      @trade = Trade.find(params[:id])
    end

    def trade_params
      params.require(:trade).permit(:User_id, :BrokerAccount_id, :Strategy_id, :Azzet_id, :Option, :Amount, :OnProfit, :OnLoss, :Payout, :Result, :UseMartingale, :UseCompoundInterest, :Position)
    end

end
