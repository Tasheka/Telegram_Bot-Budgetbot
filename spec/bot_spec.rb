require_relative '../lib/tips_tricks_list'
require_relative '../lib/income_expenses_calculations'

describe RandomTipsTricks do
  describe '#output_tip' do
    it 'gives a random quote from an array of quotes' do
      random_tips = RandomTipsTricks.new
      expect(random_tips.output_tip.class).to eq(String)
    end

    it 'does not return a number' do
        random_tips = RandomTipsTricks.new
        expect(random_tips.output_tip.class).not_to eq(Integer)
    end
  end
end

describe Calculations do
  describe '#total_income' do
    it 'calculates and outputs the total income entered by a user' do
      cal = Calculations.new
      expect(cal.total_income.class).to eq(Integer)
    end

    it 'calculates and outputs the total income entered by a user' do
        cal = Calculations.new
        expect(cal.total_income.class).not_to eq(String)
    end
  end

  describe '#total_expense' do
    it 'calculates and outputs the total expenses entered by a user' do
      cal = Calculations.new
      expect(cal.total_expense.class).to eq(Integer)
    end

    it 'calculates and outputs the total expenses entered by a user' do
        cal = Calculations.new
        expect(cal.total_expense.class).not_to eq(String)
    end
  end

  describe '#left_over' do
    it 'calculates and outputs the difference between the total income and total expense entered by a user' do
      cal = Calculations.new
      expect(cal.left_over.class).to eq(Integer)
    end

    it 'calculates and outputs the difference between the total income and total expense entered by a user' do
        cal = Calculations.new
        expect(cal.left_over.class).not_to eq(String)
    end
  end
end
