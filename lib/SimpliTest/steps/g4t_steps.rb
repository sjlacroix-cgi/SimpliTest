#Example: Given I am signed in as "SuperUser1"
Given /^(?:|I )am signed in as "([^"]*)"$/ do |username|

	#"Given I am on the "login" page"
	visit path_to("login")
  	maximize_window
  
	#When I fill in "UsernameField" with ""
	field = "UsernameField"
	value = username
	selector, selector_type = selector_for(field)
	if ['xpath', 'css'].include?(selector_type)
   	 patiently do
      element = find(selector_type.to_sym, selector)
      element.set value
    	end
  	else
    	patiently { fill_in(field, :with => value) }
 	end
  
	#And I fill in "PasswordField" with "password"
	field = "PasswordField"
	value = "password"
	selector, selector_type = selector_for(field)
	if ['xpath', 'css'].include?(selector_type)
   	 patiently do
      element = find(selector_type.to_sym, selector)
      element.set value
    	end
  	else
    	patiently { fill_in(field, :with => value) }
 	end
 		
	#And I click "LoginButton"
	locator = "LoginButton"
  patiently do
    element = get_element_from(locator)
    click_element(element)
  end
	
end