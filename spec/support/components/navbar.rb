class Navbar < AgileMDSite::Component
  select_by tag_name: 'div', class: /navigation*/

  div :hamburger, class: 'w-icon-nav-menu'
end
