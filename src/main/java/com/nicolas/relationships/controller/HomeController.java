package com.nicolas.relationships.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nicolas.relationships.model.License;
import com.nicolas.relationships.model.Person;
import com.nicolas.relationships.services.LicenseService;
import com.nicolas.relationships.services.PersonService;

import jakarta.validation.Valid;

@Controller
public class HomeController {
    @Autowired PersonService personService;
	@Autowired LicenseService licenseService;
	

	@RequestMapping("/persons/new")
	public String newPerson(@ModelAttribute("personObject") Person person, Model model) {
		return "newperson";
	}
	
	@RequestMapping(value="/addperson", method=RequestMethod.POST)
	public String addperson(@Valid @ModelAttribute("personObject") Person person, BindingResult result) {
		if (result.hasErrors()) {
			return "newperson";
		}
		else {
			personService.addPerson(person);
			return "redirect:licenses/new";
		}
	}
	
	@RequestMapping("/persons/{id}")
	public String viewDetails(@PathVariable("id") Long id, Model model) {
		model.addAttribute("license", licenseService.getLicense(id).get());
		return "view";
	}

    @RequestMapping("/licenses/new")
	public String newLicense(@ModelAttribute("licenseObject") License license, Model model) {
		List<Person> personslist = personService.allPerson();
		model.addAttribute("personslist", personslist);
		ArrayList<String> states = new ArrayList<String>(Arrays.asList("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut",
				"Delaware", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas",
				"Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
				"Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey",
				"New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
				"Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas",
				"Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"));
		model.addAttribute("states", states);
		return "newlicense";
	}
	
	@RequestMapping(value="/addlicense", method=RequestMethod.POST)
	public String addlicense(@Valid @ModelAttribute("licenseObject") License license, BindingResult result) {
		if (result.hasErrors()) {
			return "newlicense";
		}
		else {
			String number = licenseService.generateLicenseNumber();
			license.setNumber(number);
			licenseService.addLicense(license);
			return "redirect:/persons/" +license.getId();
		}
	}
}
