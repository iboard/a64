# @title Examples

EXAMPLES
========

Application Helper
------------------

### See also:

> [ApplicationHelper](ApplicationHelper.html), provides application-global functions to use in views.


### Methods

#### project_links
ApplicationHelper::project_links provides a list of labels, buttons, urls to project-related links.
Here an example how to use  the function for a button-navigation-list

    %ul
      - project_links.each do |label, button, link|
        %li.gap-bottom=button_to(classes: button) { link_to label, link }


Bootstrap Helper
----------------

### See also:

> [BootstrapHelper](BootstrapHelper.html), wrapper-/aliases to support bootstrap


### Methods

#### button_to
wraps your block with bootstrap-btn

    = button_to classes: "btn-primary" { link_to "Somewhare", "http://....." }
