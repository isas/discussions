 module ErrorsHelper
 
 def custom_error_messages_for(records, options={})
    error_messages = parse_error_messages(records, options)
    if error_messages.present?
      html = "<ul>"
      error_messages.each do |msg, attrs|
        error_message = "#{attrs.sort.to_sentence(:last_word_connector => ' and ')} #{msg}"
        html << "<li>#{error_message}</li>"
      end
      html << "</ul>"
    end
  end

private

  def parse_error_messages(records, options={})
    errors = {}
    errors_method = options[:errors_method] || :errors
    records.each do |record|
      # record.errors.each do |attr, msg|
      record.send(errors_method).instance_variable_get("@errors").values.flatten.each do |e|
        msg = e.message
        attr = e.attribute
        next if !options[:include_associations] && record.class.respond_to?(:reflections) && record.class.reflections.keys.include?(attr)
        next if msg.blank?
        errors[msg] ||= []
        # human_attr = record.class.human_attribute_name(attr.to_s)
        human_attr = e.full_message.sub(" #{e.message}", "")
        key = "<strong>#{human_attr}</strong>"
        key = "" if attr.to_s == "base" || human_attr.blank?
        errors[msg] << key unless errors[msg].include?(key)
      end
    end
    errors
  end
end