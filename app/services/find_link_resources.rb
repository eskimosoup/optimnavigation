class FindLinkResources

  attr_reader :klass

  def initialize(klass)
    begin
      @klass = klass.constantize
    rescue NameError
      @klass = nil
    end
  end

  def call
    return nil if klass.nil?
    klass.pluck(:name, :id)
  end

end