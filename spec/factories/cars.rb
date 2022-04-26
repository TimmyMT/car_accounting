FactoryBot.define do
  factory :car do
    user
    number { 'а123бв02' }
    manufacturer { 'Volkswagen' }
    model { ['golf', 'jetta', 'passat'].sample }
  end
end