/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import Foundation
import Shared

// Below is the convention we follow
// True = Current Onboarding Screen
// False = New Onboarding Screen
enum OnboardingScreenType: String {
    case versionV1
    case versionV2 
    
    static func from(boolValue: Bool) -> OnboardingScreenType {
        return boolValue ? .versionV1 : .versionV2
    }
}

class OnboardingUserResearch {
    // Constants
    private let onboardingScreenTypeKey = "onboardingScreenTypeKey"
    // Saving user defaults
    private let defaults = UserDefaults.standard
    // Publicly accessible onboarding screen type
    var onboardingScreenType: OnboardingScreenType? {
        set(value) {
            if value == nil {
                defaults.removeObject(forKey: onboardingScreenTypeKey)
            } else {
                defaults.set(value?.rawValue, forKey: onboardingScreenTypeKey)
            }
        }
        get {
            guard let value = defaults.value(forKey: onboardingScreenTypeKey) as? String else {
                return nil
            }
            return OnboardingScreenType(rawValue: value)
        }
    }
}
