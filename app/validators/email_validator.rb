class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "is not an email") unless
      value =~ /\A[A-Z0-9_\.&%\+\-']+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2,13})\z/i
  end
end
