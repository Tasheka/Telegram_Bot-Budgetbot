# rubocop:disable Style/GlobalVars

class Calculations
  $income = []

  $expense = []

  $countIncome = 0

  $count = $countIncome

  def total_income
    $income[0..$countIncome].sum
  end

  def total_expense
    $expense[$countIncome..$count].sum
  end

  def left_over
    $income[0..$countIncome].sum - $expense[$countIncome..$count].sum
  end
end

# rubocop:enable Style/GlobalVars
