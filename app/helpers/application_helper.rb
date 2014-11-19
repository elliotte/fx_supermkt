module ApplicationHelper

  # Thie method create the logout link.
  def sign_out_link
    if login_person
      link_to 'Sign Out', eval("destroy_#{login_person.class.to_s.downcase}_session_path"), method: :delete, class: 'pull-right'
    end
  end
end
