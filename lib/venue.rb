class Venue < ActiveRecord::Base
  has_and_belongs_to_many(:bands)

  validates(:name, :presence => true)

  before_save(:set_name)

  private

  define_method(:set_name) do
    self.name = (name.downcase().split().each() { |word| word.capitalize! }.join(" "))
  end

end
