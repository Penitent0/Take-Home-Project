class ErrorsSerializer 
  def self.parse_errors(errors)
    {
      error: errors.full_messages.map do |error|
        {
          message: error
        }
      end
    }
  end
end