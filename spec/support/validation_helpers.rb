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

RSpec::Matchers.define :validate_generic_attribute do |attribute, message|
 match do |model|
   model.valid?
   expect(model.errors.has_key?(attribute)).to be_truthy and model.errors[attribute].first.include?(message)
 end
end

RSpec::Matchers.define :validate_integer_attribute do |attribute|
 match do |model|
   model.valid?
   expect(model.errors.has_key?(attribute)).to be_truthy and model.errors[attribute].any?{|error| error.include?("an integer")}
 end
end

RSpec::Matchers.define :validate_length_attribute do |attribute, length|
 match do |model|
   model.valid?
   expect(model.errors.has_key?(attribute)).to be_truthy and model.errors[attribute].any?{|error| error.include?("is the wrong length (should be #{length} characters)")}
 end
end



