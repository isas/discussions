ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:default] = "%d.%m.%Y %H:%M:%S"
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:default] = "%d.%m.%Y"

# https://rails.lighthouseapp.com/projects/8994/tickets/340-yaml-activerecord-serialize-and-date-formats-problem
class Date
  def to_yaml(opts={})
    YAML::quick_emit(self, opts) do |out|
      out.scalar("tag:yaml.org,2002:timestamp", self.to_s(:db), :plain)
    end
  end
end