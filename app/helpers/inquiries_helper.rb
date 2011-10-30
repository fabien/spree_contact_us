module InquiriesHelper
  def translate_types
    INQUIRY_TYPES.collect { |i| t("inquiry_type_#{i}") }
  end
end
