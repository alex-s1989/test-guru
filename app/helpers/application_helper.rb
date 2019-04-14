module ApplicationHelper
  def current_year
    Date.today.year
  end

  def link_to_github
    link_to "TestGuru", "https://github.com/alex-s1989/test-guru"
  end
end
