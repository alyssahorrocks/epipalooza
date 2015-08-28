class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)

  validates(:name, :presence => true)
  validates(:name, :uniqueness => {:case_sensitive => false})

  before_save(:set_name)

  private

  define_method(:set_name) do
    self.name = (name.downcase().split().each() { |word| word.capitalize! }.join(" "))
  end

end
