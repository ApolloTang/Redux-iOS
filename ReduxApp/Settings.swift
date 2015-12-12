//
//  Settings.swift
//  ReduxApp
//
//  Created by Armin Kroll on 12/12/2015.
//  Copyright © 2015 jtribe. All rights reserved.
//

import Foundation

struct ToggleSettingsAction : ActionType {
	var type : String
	var data : Any { get {return ""} }
}

enum SettingKey : String {
	case Filter = "filter"
	case Facebook = "facebook"
}


// settings is a dictionary of
func settingsReducer(settings: Dictionary<String,Bool>?, action: ActionType) -> Dictionary<String,Bool>
{
	guard let settings = settings else {
		// defaults
		return [
			SettingKey.Filter.rawValue : false,
			SettingKey.Facebook.rawValue : false
		] }
	
	// find the item wih the key and toggle it
	var toggleKey = "undefined"
	switch action.type {
	case "TOGGLE_FILTER" :
		toggleKey = SettingKey.Filter.rawValue
		break
	case "TOGGLE_FACEBOOK" :
		toggleKey = SettingKey.Facebook.rawValue
		break
	default : break
	}
	
	var newSettings : Dictionary<String, Bool> = [:]
	for (key , value) in settings {
		if toggleKey == key { newSettings[key] = !value }
		else { newSettings[key] = value }
	}
	
	return newSettings
}
