# rubocop:disable Layout/LineLength

class RandomTipsTricks

    $tips_and_tricks = [
      "Stick to a budget: \n An important step to get ahead financially is to budget. You cannot know where your money is going if you do not budget.",
      "Have a savings plan: \n Pay yourself first. If you wait until you have met all of your other financial obligations before seeing what is left over for saving, chances are, you will never have a healthy savings account. Set aside a minimum of 5% of your salary for savings",
      "Don’t Make Impulse Purchases: \n The next time you see something you just ‘have’ to buy, wait a week before you hand over your cash. The time will give you room for some perspective. Then, if you still want to buy it, you’ll know it’s definitely worth your money.",
      "Cut Back on Expenses: \n It doesn’t matter how much you earn if you spend it all. So, try to cut back on expenses to boost the amount of money you can save and invest each month.",
      "Find Ways to Increase Your Income: \n Find a way to make more money to improve your financial situation."
    ]

    $income = []

    $expense = []

    $count = 0

    #counter = $count

  def random_tips_tricks
    $tips_and_tricks[rand(0..4)]
  end

  def total_income
    $income.sum
  end

  def total_expense
    $expense[0..$count-1].sum
  end

end

# rubocop:enable Layout/LineLength
