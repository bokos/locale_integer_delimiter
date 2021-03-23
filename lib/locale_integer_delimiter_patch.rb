include ActionView::Helpers::NumberHelper

module LocaleIntegerDelimiterPatch
  def self.included(base)
    def format_object_with_locale_delimiter(object, html=true, &block)
      case object.class.name
      when 'Integer'
        number_with_delimiter(object)
      else
        format_object_without_locale_delimiter(object, html, &block)
      end
    end

    base.class_eval do
      alias_method :format_object_without_locale_delimiter, :format_object
      alias_method :format_object, :format_object_with_locale_delimiter
    end
  end
end
