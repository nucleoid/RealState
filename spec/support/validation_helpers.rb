   RSpec::Matchers.define :require_attribute do |attribute|
  match do |model|
    model.valid?
    expect(model.errors.has_key?(attribute)).to be_truthy and model.errors[attribute].first.include?("blank")
  end
end

RSpec::Matchers.define :require_enum_value do |attribute|
  match do |model|
    model.valid?
    expect(model.errors.has_key?(attribute)).to be_truthy and model.errors[attribute].first.include?("is not included in the list")
  end
end