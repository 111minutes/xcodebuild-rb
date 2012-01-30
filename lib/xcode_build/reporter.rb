require_relative "reporting/build_reporting"
require_relative "reporting/clean_reporting"

module XcodeBuild
  class Reporter
    include Reporting::BuildReporting
    include Reporting::CleanReporting
    
    attr_accessor :delegate

    def initialize(delegate = nil)
      @delegate = delegate
    end

    private

    def notify(event, *args)
      return unless @delegate
      @delegate.send(event, *args) if @delegate.respond_to?(event)
    end
  end
end