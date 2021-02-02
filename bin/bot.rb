# rubocop:disable Layout/LineLength
# rubocop:disable  Metrics/BlockLength

require 'telegram/bot'

require_relative '../lib/tips_tricks_list'
require_relative '../lib/income_expenses_calculations'

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
      bot.api.send_message(chat_id: message.chat.id, text: "Select 'Income' to enter your incomes earned. \n /Income")

    when '/Income'
      bot.api.send_message(chat_id: message.chat.id, text: "Select the income you want to enter: \n /PrimaryIncome \n /AdditionalIncome")

    when '/PrimaryIncome'
      bot.api.send_message(chat_id: message.chat.id, text: 'Enter your primary income.')
      bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Incomes' to view the list of incomes. \n /BackToIncomes")
      $countIncome += 1

    when '/AdditionalIncome'
      bot.api.send_message(chat_id: message.chat.id, text: 'Enter your additional income.')
      bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Incomes' to view the list of incomes. \n /BackToIncomes")
      $countIncome += 1

    when '/BackToIncomes'
      bot.api.send_message(chat_id: message.chat.id, text: "Select the income you want to enter: \n /PrimaryIncome \n /AdditionalIncome")
      bot.api.send_message(chat_id: message.chat.id, text: "Select 'Total Income' when you are finished entering your incomes: \n /TotalIncome")

    when '/TotalIncome'
      calc = Calculations.new
      bot.api.send_message(chat_id: message.chat.id, text: "Your total income is $#{calc.total_income}")
      bot.api.send_message(chat_id: message.chat.id, text: "Select 'Expenses' to enter your expenses. \n /Expenses")

    else
      $income.push(message.text.to_i)

      case message.text
      when '/Expenses'
        bot.api.send_message(chat_id: message.chat.id, text: "Select the expense you want to enter: \n /Rent \n /Food \n /Transportation \n /Bills \n /AdditionalExpenses")

      when '/Rent'
        bot.api.send_message(chat_id: message.chat.id, text: 'Enter the amount you pay for rent.')
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Expenses' to view the list of expenses. \n /BackToExpenses")
        $count += 1

      when '/Food'
        bot.api.send_message(chat_id: message.chat.id, text: 'Enter the amount you pay for food.')
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Expenses' to view the list of expenses. \n /BackToExpenses")
        $count += 1

      when '/Transportation'
        bot.api.send_message(chat_id: message.chat.id, text: 'Enter the amount you pay for transportation.')
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Expenses' to view the list of expenses. \n /BackToExpenses")
        $count += 1

      when '/Bills'
        bot.api.send_message(chat_id: message.chat.id, text: 'Enter the amount you pay for bills')
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Expenses' to view the list of expenses. \n /BackToExpenses")
        $count += 1

      when '/AdditionalExpenses'
        bot.api.send_message(chat_id: message.chat.id, text: 'Enter the amount you pay for additional expenses')
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Back to Expenses' to view the list of expenses. \n /BackToExpenses")
        $count += 1

      when '/BackToExpenses'
        bot.api.send_message(chat_id: message.chat.id, text: "Select the expense you want to enter: \n /Rent \n /Food \n /Transportation \n /Bills \n /AdditionalExpenses")
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Total Expenses' when you are finished entering your expenses: \n /TotalExpenses")

      when '/TotalExpenses'
        calc = Calculations.new
        bot.api.send_message(chat_id: message.chat.id, text: "Your total expense is $#{calc.total_expense}")
        bot.api.send_message(chat_id: message.chat.id, text: "Select 'Calculate Budget' to calculate your monthly budget. \n /CalculateBudget")

      when '/CalculateBudget'
        calc = Calculations.new
        bot.api.send_message(chat_id: message.chat.id, text: "Your total income is $#{calc.total_income}")
        bot.api.send_message(chat_id: message.chat.id, text: "Your total expense is $#{calc.total_expense}")
        bot.api.send_message(chat_id: message.chat.id, text: "This month  after clearing your expenses, you will be left with $#{calc.left_over}.")
        bot.api.send_message(chat_id: message.chat.id, text: "What else can I do for you today? \n /Budget \n /Tips")

      else
        $expense.push(message.text.to_i)
      end
    end
  end
end

# rubocop:enable Layout/LineLength
# rubocop:enable  Metrics/BlockLength
