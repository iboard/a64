module ApplicationHelper

  # Project Links
  # Array of Array(label,btn-classes,url)
  #
  # Example usage in a HAML-template:
  #     - project_links.each do |label, button, link|
  #       %li.gap-bottom=button_to(classes: button) { link_to label, link }
  # @return [Array] - Label, btn-class, used to build links to project-related web-pages.
  def project_links
    [
        ['Github', 'btn-primary', 'https://github.com/iboard/a64'],
        ['README', '', 'https://github.com/iboard/a64#readme'],
        ['Issues', 'btn-danger', 'https://github.com/iboard/a64/issues'],
        ['RDoc', '', '/doc/index.html'],
        ['Coverage', '', '/coverage/index.html']
    ]
  end

end
