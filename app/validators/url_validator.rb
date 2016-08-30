class UrlValidator < ActiveModel::EachValidator
  REGEX = /^(?:https?:\/\/\.?)(?:[A-Z0-9.-:\-]{1,})\.[0-9A-Z?;~&%#=\-_\.\/:\*\+\[\]]{2,}$/i


  def validate_each(record, attribute, value)
    unless value.blank? || value.match(REGEX)
      record.errors[attribute] << (options[:message] || "isn't a valid url")
    end
  end
end
