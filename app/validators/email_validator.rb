# frozen_string_literal: true

# Allow email: true as a validation for attributes
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    rgexp = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    message = options[:message] || 'is not an email'
    record.errors[attribute] << message unless value.match?(rgexp)
  end
end
