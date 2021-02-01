# rubocop:disable Layout/LineLength
require 'telegram/bot'

require_relative 'tips_tricks_list'

token = 

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    
    when '/start'   
    bot.api.send_message(chat_id: message.chat.id,
                         text: "Hello #{message.from.first_name}, I'm Budgetbot. I can help you calculate your monthly budget and provide you with financial tips and tricks.")
    bot.api.send_message(chat_id: message.chat.id, text: "What can I do for you today? \n /Budget \n /Tips")

    when '/Tips'
      tip = RandomTipsTricks.new
      bot.api.send_message(chat_id: message.chat.id, text: tip.random_tips_tricks)
      bot.api.send_message(chat_id: message.chat.id, text: "What would you like to do next? \n /Budget \n /Tips")
      
    when '/Budget'
      bot.api.send_message(chat_id: message.chat.id, text: "Select 'Income' to enter your incomes earned. \n /Expenses")

    when '/Income'
        bot.api.send_message(chat_id: message.chat.id, text: "Enter your basic salary amount.")

    when '/Expenses'
        tip = RandomTipsTricks.new
        bot.api.send_message(chat_id: message.chat.id, text: "Your total income is $#{tip.total_income}")
        bot.api.send_message(chat_id: message.chat.id, text: "Select the expense you want to enter: \n /Rent \n /Food \n /Transportation \n /Bills \n /AdditionalExpenses")
    
    when '/Rent'
        bot.api.send_message(chat_id: message.chat.id, text: "Enter the amount you pay for this expense.")
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Expenses' to view the list of expenses. \n /BackToExpenses")

    when '/Food'
        bot.api.send_message(chat_id: message.chat.id, text: "Enter the amount you pay for this expense.")
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Expenses' to view the list of expenses. \n /BackToExpenses")

    when '/Transportation'
        bot.api.send_message(chat_id: message.chat.id, text: "Enter the amount you pay for this expense.")
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Expenses' to view the list of expenses. \n /BackToExpenses")

    when '/Bills'
        bot.api.send_message(chat_id: message.chat.id, text: "Enter the amount you pay for this expense.")
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Expenses' to view the list of expenses. \n /BackToExpenses")

    when '/AdditionalExpenses'
        bot.api.send_message(chat_id: message.chat.id, text: "Select the expense you want to enter: \n /Rent \n /Food \n /Transportation \n /Bills \n /AdditionalExpenses")
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Expenses' to view the list of expenses. \n /BackToExpenses")

    when '/BackToExpenses'
        $expense.push(message.text.to_i)
        bot.api.send_message(chat_id: message.chat.id, text: "Select the expense you want to enter: \n /Rent \n /Food \n /Transportation \n /Bills \n /AdditionalExpenses")
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Calculate' when you are finished entering your expenses: \n /Calculate")
    
    when '/Calculate'
        tip = RandomTipsTricks.new
        bot.api.send_message(chat_id: message.chat.id, text: "Your total expense is $#{tip.total_expense}")

   # else
     #$income.push(message.text.to_i)
     #bot.api.send_message(chat_id: message.chat.id, text: "You typed #{$income}")
     #bot.api.send_message(chat_id: message.chat.id, text: "Enter any additional income earned.")
    # bot.api.send_message(chat_id: message.chat.id, text: "Select 'Expenses' when you have no more incomes to enter. \n /Expenses")

    # case message.text
    # when '/hello'
    # else
    #     $additional_income = message.text.to_i
    #     bot.api.send_message(chat_id: message.chat.id, text: "You typed #{$additional_income}")
    end
  end
end

# rubocop:enable Layout/LineLength
