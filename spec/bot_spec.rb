require_relative '../lib/tips_tricks_list'
require_relative '../lib/income_expenses_calculations'

describe RandomTipsTricks do
    describe '#random_tips_tricks' do
      it 'gives a random quote from an array of quotes' do
        randomTips = RandomTipsTricks.new
        expect((randomTips.random_tips_tricks).class).to eq(String)
      end
    end
end

describe Calculations do
    describe '#total_income' do
      it 'calculates annd outputs the total income entered by a user' do
        cal = Calculations.new
        expect((cal.total_income).class).to eq(Integer)
      end
    end

    describe '#total_expense' do
    it 'calculates annd outputs the total expenses entered by a user' do
      cal = Calculations.new
      expect((cal.total_expense).class).to eq(Integer)
    end
  end

  describe '#left_over' do
  it 'calculates annd outputs the difference between the total income and total expenes entered by a user' do
    cal = Calculations.new
    expect((cal.left_over).class).to eq(Integer)
  end
end
end
