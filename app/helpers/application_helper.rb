module ApplicationHelper

  # Thie method create the logout link.
  def sign_out_link
    if login_person
      link_to 'Sign Out', eval("destroy_#{login_person.class.to_s.downcase}_session_path"), method: :delete, class: 'pull-right', title: "SignOut #{login_person.class}"
    end
  end

  # display errors
  def error_messages(object)
    return unless object.respond_to?(:errors) && object.errors.any?

    messages = object.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved", count: object.errors.count, resource: object.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end

  # flash mesages
  def flash_message
    msg = ''
    flash.keys.each do |k|
      msg += content_tag :p, flash[k], class: k.to_s
    end
    msg
  end

end
