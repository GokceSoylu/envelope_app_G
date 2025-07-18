class TransactionsController < ApplicationController
  def move
    @envelopes = Envelope.all
    @incomes = Income.all
  end
  def do_move
    income=Income.first
    envelope=Envelope.find(params[:envelope_id])
    amount = params[:amount].to_d
    if income.amount >= amount
      income.update(amount: income.amount - amount)
      envelope.update(amount: envelope.amount + amount)
      redirect_to envelopes_path notice: "Income successfully moved to envelope"
    else
      redirect_to envelopes_path alert: "not enough income available"
    end
  end
  def spend
    @envelopes = Envelope.all
  end

  def do_spend
    envelope=Envelope.find(params[:envelope_id])
    amount = params[:amount].to_d
    if envelope.amount >= amount
      envelope.update(amount: envelope.amount - amount)
      redirect_to envelopes_path notice: "spending recordeed successfull"
    else
      redirect_to envelopes_path alert: "not enough balance int envelope"
    end
  end
end
