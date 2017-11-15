require_relative('models/bounty_data')
require('pry-byebug')

bounty1 = Bounty.new(
  {
    'name' => 'Krisz',
    'species' => 'Human',
    'bounty_value' => '50',
    'homeworld' => 'Earth'
  }
)

bounty2 = Bounty.new(
  {
    'name' => 'George',
    'species' => 'Klingon',
    'bounty_value' => '100',
    'homeworld' => 'Kronos'
  }
)
bounty3 = Bounty.new(
    {
    'name' => 'Ruby',
    'species' => 'Orc',
    'bounty_value' => '200',
    'homeworld' => 'Arda'
  }
)


# bounty1.save
# bounty2.save
# bounty3.save

#bounty1.update

# bounty3.delete
p Bounty.find(8)
