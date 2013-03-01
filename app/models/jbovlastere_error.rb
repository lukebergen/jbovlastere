class JbovlastereError < StandardError

  def initialize(msg)
    super(msg)
  end

  class ApiKeyNotFound < JbovlastereError
    def initialize(msg = "Api token not found")
      super(msg)
    end
  end
  class ApiKeyNotSupplied < JbovlastereError
    def initialize(msg = "Api token not supplied")
      super(msg)
    end
  end

end