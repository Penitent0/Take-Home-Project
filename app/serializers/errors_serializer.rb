class ErrorsSerializer 
  def self.parse_error(error)
    {
      error: 
        {
          message: error.message
        }
      end
    }
  end
end