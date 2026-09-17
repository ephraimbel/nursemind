import Foundation

private let community_food_cdc = CitationSource(
    id: "community_food_cdc",
    shortName: "Safer Food Choices for People With Weakened Immune Systems",
    detail: "Safer food choices and clean, separate, cook, chill; May 2, 2024. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/food-safety/foods/weakened-immune-systems.html",
    lastRetrieved: "2026-09-17"
)

private let community_ticks_cdc = CitationSource(
    id: "community_ticks_cdc",
    shortName: "What to Do After a Tick Bite",
    detail: "Removal, wound cleaning, follow-up and limits of tick testing; June 9, 2026. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/ticks/after-a-tick-bite/index.html",
    lastRetrieved: "2026-09-17"
)

private let community_mosquito_cdc = CitationSource(
    id: "community_mosquito_cdc",
    shortName: "Preventing Mosquito Bites",
    detail: "EPA-registered repellents, clothing, screens and standing water; August 28, 2024. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/mosquitoes/prevention/index.html",
    lastRetrieved: "2026-09-17"
)

private let community_heat_older_cdc = CitationSource(
    id: "community_heat_older_cdc",
    shortName: "Heat and Older Adults (Aged 65+)",
    detail: "Cooling, hydration precautions and social check-ins; June 25, 2024. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/heat-health/risk-factors/heat-and-older-adults-aged-65.html",
    lastRetrieved: "2026-09-17"
)

private let community_heat_cdc = CitationSource(
    id: "community_heat_cdc",
    shortName: "About Heat and Your Health",
    detail: "Heat action planning, medicines, storage and power outages; July 20, 2026. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/heat-health/about/index.html",
    lastRetrieved: "2026-09-17"
)

private let community_wildfire_cdc = CitationSource(
    id: "community_wildfire_cdc",
    shortName: "Safety Guidelines: Wildfires and Wildfire Smoke",
    detail: "Smoke exposure, indoor air and evacuation; reviewed August 24, 2026. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/wildfires/safety/how-to-safely-stay-safe-during-a-wildfire.html",
    lastRetrieved: "2026-09-17"
)

private let community_co_cdc = CitationSource(
    id: "community_co_cdc",
    shortName: "Carbon Monoxide Poisoning Basics",
    detail: "Household sources, alarms, appliance maintenance and generator placement; January 12, 2026. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/carbon-monoxide/about/index.html",
    lastRetrieved: "2026-09-17"
)

private let community_outage_cdc = CitationSource(
    id: "community_outage_cdc",
    shortName: "What to Do to Protect Yourself During a Power Outage",
    detail: "Carbon monoxide symptoms and need for urgent help; August 26, 2026. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/natural-disasters/response/what-to-do-protect-yourself-during-a-power-outage.html",
    lastRetrieved: "2026-09-17"
)

private let community_water_cdc = CitationSource(
    id: "community_water_cdc",
    shortName: "Drinking Water Advisories: An Overview",
    detail: "Boil-water, do-not-drink and do-not-use distinctions; boiling does not remove chemical contamination. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/water-emergency/about/drinking-water-advisories-an-overview.html",
    lastRetrieved: "2026-09-17"
)

private let community_cleaning_cdc = CitationSource(
    id: "community_cleaning_cdc",
    shortName: "When and How to Clean and Disinfect Your Home",
    detail: "Cleaning versus disinfection, contact time, ventilation and safe storage; January 31, 2025. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/hygiene/about/when-and-how-to-clean-and-disinfect-your-home.html",
    lastRetrieved: "2026-09-17"
)

private let community_devices_fda = CitationSource(
    id: "community_devices_fda",
    shortName: "FDA Offers Tips about Medical Devices and Natural Disasters",
    detail: "General safety, power outages, intact packaging and manufacturer instructions. Water-treatment recipes are excluded. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "U.S. Food and Drug Administration",
    license: .publicDomain,
    url: "https://www.fda.gov/medical-devices/emergency-situations-medical-devices/fda-offers-tips-about-medical-devices-and-natural-disasters",
    lastRetrieved: "2026-09-17"
)

private let community_disability_cdc = CitationSource(
    id: "community_disability_cdc",
    shortName: "Emergency Preparedness for People with Disabilities",
    detail: "Individual preparedness and limitations of voluntary registries; May 2, 2025. Original government text adapted and condensed by NurseMind; images and third-party material excluded.",
    publisher: "Centers for Disease Control and Prevention",
    license: .publicDomain,
    url: "https://www.cdc.gov/disability-emergency-preparedness/people-with-disabilities/index.html",
    lastRetrieved: "2026-09-17"
)

public enum FoodSafetyImmuneReferenceSample {
    public static let entry = ReferenceEntry(
        id: "food-safety-weakened-immunity",
        title: "Food safety with weakened immunity",
        subtitle: "Safer food choices for immunocompromised patients",
        eyebrow: "REFERENCE · COMMUNITY & HOME CARE",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .infection),
        sections: [
            .bullets(title: "Identify the added risk", [
                AttributedBullet("A weakened immune system increases the risk of foodborne illness. Cancer treatment, immune-suppressing medicines and some chronic illnesses can reduce the body’s ability to fight foodborne germs.", citationIDs: ["community_food_cdc"]),
                AttributedBullet("Review food choices and preparation with the person who shops or cooks. Safer choices matter both at home and when eating food prepared elsewhere.", citationIDs: ["community_food_cdc"])
            ]),
            .bullets(title: "Choose safer foods", [
                AttributedBullet("Avoid raw or undercooked meat, poultry, seafood and eggs. Fully cooked foods are safer; use a food thermometer and the appropriate cooking temperature instead of judging by appearance alone.", citationIDs: ["community_food_cdc"]),
                AttributedBullet("Choose pasteurized milk and juice, and wash produce. Avoid raw sprouts and unwashed fruits or vegetables; cooked produce is the safer choice when practical.", citationIDs: ["community_food_cdc"]),
                AttributedBullet("Heat deli meats and hot dogs until steaming hot. Avoid refrigerated pâté, premade deli salads and refrigerated smoked seafood unless it is cooked in a dish. Do not eat raw flour or uncooked dough.", citationIDs: ["community_food_cdc"])
            ]),
            .bullets(title: "Use safe preparation habits", [
                AttributedBullet("Keep hands, utensils and food-preparation surfaces clean. Separate raw meat and seafood from ready-to-eat foods, cook thoroughly and refrigerate promptly.", citationIDs: ["community_food_cdc"]),
                AttributedBullet("Use the linked CDC food-choice table for details about particular foods, including cheeses. Pasteurization alone does not make every cheese product a safer choice.", citationIDs: ["community_food_cdc"])
            ])
        ],
        citations: [community_food_cdc],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum TickBiteCareReferenceSample {
    public static let entry = ReferenceEntry(
        id: "tick-removal-and-follow-up",
        title: "Tick removal and follow-up",
        subtitle: "Prompt removal, skin care and symptoms to report",
        eyebrow: "REFERENCE · COMMUNITY & HOME CARE",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .infection),
        sections: [
            .bullets(title: "Remove an attached tick promptly", [
                AttributedBullet("Remove the tick as soon as it is found; do not delay removal while waiting for a health-care visit. Use clean, fine-tipped tweezers to grasp it as close to the skin as possible.", citationIDs: ["community_ticks_cdc"]),
                AttributedBullet("Pull upward with steady, even pressure. Avoid twisting, jerking or squeezing the tick’s body. If mouthparts remain and cannot be removed easily with tweezers, leave them rather than digging into the skin.", citationIDs: ["community_ticks_cdc"])
            ]),
            .bullets(title: "Clean up safely", [
                AttributedBullet("Clean the bite area and hands with soap and water or rubbing alcohol. Check the rest of the body for other attached ticks.", citationIDs: ["community_ticks_cdc"]),
                AttributedBullet("Do not crush a live tick with the fingers. It can be placed in a sealed container, wrapped in tape, put in alcohol or flushed away.", citationIDs: ["community_ticks_cdc"]),
                AttributedBullet("Do not use heat, nail polish or petroleum jelly to make the tick detach. These methods can increase the chance that infectious material enters the bite.", citationIDs: ["community_ticks_cdc"])
            ]),
            .bullets(title: "Know the limits of tick testing", [
                AttributedBullet("Commercial tick-test results should not determine treatment: a positive result does not establish that the person was infected, and a negative result can falsely reassure.", citationIDs: ["community_ticks_cdc"]),
                AttributedBullet("If a rash or fever develops in the following days or weeks, contact a health-care professional and report when and where the exposure occurred. Do not wait for a tick-test result when symptoms develop.", citationIDs: ["community_ticks_cdc"])
            ])
        ],
        citations: [community_ticks_cdc],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum MosquitoPreventionReferenceSample {
    public static let entry = ReferenceEntry(
        id: "mosquito-bite-prevention",
        title: "Mosquito-bite prevention",
        subtitle: "Repellents, clothing and the home environment",
        eyebrow: "REFERENCE · COMMUNITY & HOME CARE",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .infection),
        sections: [
            .bullets(title: "Choose an effective repellent", [
                AttributedBullet("Mosquitoes can bite during both day and night. EPA-registered repellents are evaluated for safety and effectiveness; examples of active ingredients include DEET, picaridin and IR3535.", citationIDs: ["community_mosquito_cdc"]),
                AttributedBullet("Follow the product label for age restrictions, application and reapplication. When used as directed, EPA-registered repellents are considered safe during pregnancy and breastfeeding.", citationIDs: ["community_mosquito_cdc"])
            ]),
            .bullets(title: "Apply and dress appropriately", [
                AttributedBullet("Apply sunscreen before insect repellent. Do not put repellent under clothing, and follow the label rather than assuming that more frequent application gives better protection.", citationIDs: ["community_mosquito_cdc"]),
                AttributedBullet("Wear loose-fitting long sleeves and long pants. Permethrin-treated clothing and gear can help protect against bites; permethrin products for fabric must not be applied directly to skin.", citationIDs: ["community_mosquito_cdc"])
            ]),
            .bullets(title: "Reduce mosquitoes around the home", [
                AttributedBullet("Use intact window and door screens and air conditioning when available. Repair openings that allow mosquitoes indoors.", citationIDs: ["community_mosquito_cdc"]),
                AttributedBullet("Empty and scrub, cover or discard items that hold standing water, such as buckets, planters, birdbaths and discarded tires. Check these areas weekly.", citationIDs: ["community_mosquito_cdc"]),
                AttributedBullet("Products promoted as natural but not registered with EPA have not been evaluated by EPA for effectiveness. Use the linked CDC guidance to compare registered options and label precautions.", citationIDs: ["community_mosquito_cdc"])
            ])
        ],
        citations: [community_mosquito_cdc],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HeatHealthPlanningReferenceSample {
    public static let entry = ReferenceEntry(
        id: "heat-health-planning",
        title: "Heat preparedness for older adults and chronic illness",
        subtitle: "Cooling access, individualized fluids and medicine planning",
        eyebrow: "REFERENCE · COMMUNITY & HOME CARE",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .safety),
        sections: [
            .bullets(title: "Plan before a hot day", [
                AttributedBullet("Older adults may adjust less well to sudden temperature changes. Chronic conditions and medicines can also affect temperature control or sweating.", citationIDs: ["community_heat_older_cdc"]),
                AttributedBullet("Make a heat action plan with the care team, including how local heat forecasts affect daily activities and which symptoms should prompt a call. Consider access to cooling and help at home.", citationIDs: ["community_heat_cdc"])
            ]),
            .bullets(title: "Arrange cooling and support", [
                AttributedBullet("Use air-conditioned spaces during hot weather. If home cooling is unavailable, identify an accessible community location; a fan should not be the main cooling strategy during very hot conditions.", citationIDs: ["community_heat_older_cdc"]),
                AttributedBullet("Arrange regular check-ins, choose light clothing and avoid strenuous outdoor activity during the hottest part of the day. A cool shower or bath can help with cooling.", citationIDs: ["community_heat_older_cdc"])
            ]),
            .bullets(title: "Individualize fluids and medicines", [
                AttributedBullet("Discuss drinking needs before hot weather. People with prescribed fluid limits or taking water pills need advice about the amount appropriate for them rather than a universal instruction to drink extra water.", citationIDs: ["community_heat_older_cdc"]),
                AttributedBullet("Review medicines and their storage requirements with the care team. Do not stop or change medicines independently because of heat. Plan for refrigerated medicines and electrically powered devices during an outage.", citationIDs: ["community_heat_cdc"]),
                AttributedBullet("Seek medical care for symptoms of heat-related illness such as headache, nausea, vomiting or cramps. The individual plan should identify how and when to get help.", citationIDs: ["community_heat_older_cdc"])
            ])
        ],
        citations: [community_heat_older_cdc, community_heat_cdc],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum WildfireSmokeReferenceSample {
    public static let entry = ReferenceEntry(
        id: "wildfire-smoke-protection",
        title: "Protection from wildfire smoke",
        subtitle: "Air-quality alerts, cleaner indoor air and evacuation planning",
        eyebrow: "REFERENCE · COMMUNITY & HOME CARE",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .gasExchange),
        sections: [
            .bullets(title: "Anticipate exposure", [
                AttributedBullet("Wildfire smoke can irritate the eyes and airways and cause cough, wheezing or breathing difficulty. People with heart or lung disease and other chronic illnesses may be more affected.", citationIDs: ["community_wildfire_cdc"]),
                AttributedBullet("Check local air-quality reports and emergency alerts. Plan how to leave if local authorities issue an evacuation order; staying indoors is not a substitute for evacuation when instructed.", citationIDs: ["community_wildfire_cdc"])
            ]),
            .bullets(title: "Reduce indoor smoke", [
                AttributedBullet("Choose a room that can be closed off from outdoor air and use a suitable portable air cleaner or high-efficiency filtration. Follow the equipment instructions.", citationIDs: ["community_wildfire_cdc"]),
                AttributedBullet("Close windows and doors when advised and use air conditioning on recirculation rather than drawing in smoky outdoor air. If the home becomes unsafe or too hot, seek a safer location.", citationIDs: ["community_wildfire_cdc"]),
                AttributedBullet("Avoid adding indoor particles through smoking, candles, incense, wood burning, frying or vacuuming during heavy smoke.", citationIDs: ["community_wildfire_cdc"])
            ]),
            .bullets(title: "Limit outdoor exposure", [
                AttributedBullet("Reduce time and exertion outdoors when the air is smoky. If outside exposure cannot be avoided, a well-fitting, NIOSH-approved respirator can reduce inhalation of smoke particles.", citationIDs: ["community_wildfire_cdc"]),
                AttributedBullet("Follow the care team’s advice for existing health conditions and seek medical help for worsening symptoms. Follow local officials’ instructions as conditions change.", citationIDs: ["community_wildfire_cdc"])
            ])
        ],
        citations: [community_wildfire_cdc],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HomeCarbonMonoxideReferenceSample {
    public static let entry = ReferenceEntry(
        id: "home-carbon-monoxide-prevention",
        title: "Carbon monoxide prevention at home",
        subtitle: "Alarms, fuel-burning equipment and portable generators",
        eyebrow: "REFERENCE · COMMUNITY & HOME CARE",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .safety),
        sections: [
            .bullets(title: "Understand the hazard", [
                AttributedBullet("Carbon monoxide is a colorless, odorless gas produced by burning fuel. Furnaces, generators, grills, engines and other fuel-burning equipment can allow it to accumulate indoors.", citationIDs: ["community_co_cdc"]),
                AttributedBullet("Install battery-operated or battery-backup carbon monoxide alarms near sleeping areas. Check batteries and replace alarms according to the manufacturer’s instructions.", citationIDs: ["community_co_cdc"])
            ]),
            .bullets(title: "Use equipment safely", [
                AttributedBullet("Have heating systems, water heaters and fuel-burning appliances serviced by a qualified technician each year. Keep them properly vented; do not heat the home with a gas oven.", citationIDs: ["community_co_cdc"]),
                AttributedBullet("Never use charcoal grills or portable camp stoves indoors. Do not run a vehicle in an attached garage, even with the garage door open.", citationIDs: ["community_co_cdc"]),
                AttributedBullet("Portable generators belong outdoors, more than 20 feet from windows, doors and vents. Never run one in a home or garage, even with doors or windows open.", citationIDs: ["community_co_cdc"])
            ]),
            .bullets(title: "Recognize possible exposure", [
                AttributedBullet("Headache, dizziness, weakness, nausea, vomiting, chest pain and confusion can occur with carbon monoxide poisoning. A sleeping person may not notice warning symptoms.", citationIDs: ["community_co_cdc"]),
                AttributedBullet("Possible carbon monoxide poisoning needs urgent help. Call 911 or Poison Control at 1-800-222-1222 when someone has signs of exposure; do not wait for symptoms to resolve.", citationIDs: ["community_outage_cdc"])
            ])
        ],
        citations: [community_co_cdc, community_outage_cdc],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum DrinkingWaterAdvisoryReferenceSample {
    public static let entry = ReferenceEntry(
        id: "drinking-water-advisories",
        title: "Understanding drinking-water advisories",
        subtitle: "Boil-water, do-not-drink and do-not-use notices",
        eyebrow: "REFERENCE · COMMUNITY & HOME CARE",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .infection),
        sections: [
            .bullets(title: "Read the actual local notice", [
                AttributedBullet("Water advisories have different purposes. Follow the water utility or public-health notice for the affected area, permitted uses and when the advisory ends.", citationIDs: ["community_water_cdc"]),
                AttributedBullet("A boil-water advisory usually addresses germs. Bottled water or correctly boiled and cooled water is needed for drinking, preparing food and brushing teeth; avoid ice made from untreated tap water.", citationIDs: ["community_water_cdc"])
            ]),
            .bullets(title: "Boil only when the notice calls for it", [
                AttributedBullet("For a boil-water advisory, CDC advises a rolling boil for 1 minute, or 3 minutes above 6,500 feet, followed by cooling. Tap water passed through a home filter still requires boiling.", citationIDs: ["community_water_cdc"]),
                AttributedBullet("Follow the notice for handwashing, bathing, dishwashing and other uses. Prevent accidental swallowing of affected water.", citationIDs: ["community_water_cdc"])
            ]),
            .bullets(title: "Distinguish chemical contamination", [
                AttributedBullet("A do-not-drink advisory can involve harmful chemicals or toxins. Use bottled water for drinking and food preparation as instructed; boiling does not remove these contaminants.", citationIDs: ["community_water_cdc"]),
                AttributedBullet("A do-not-use advisory means contact with the water may also be dangerous. Avoid affected tap water for all uses specified in the notice and use an approved alternative.", citationIDs: ["community_water_cdc"]),
                AttributedBullet("Do not apply boil-water instructions to a chemical-contamination notice. Confirm the advisory type before teaching household water precautions.", citationIDs: ["community_water_cdc"])
            ])
        ],
        citations: [community_water_cdc],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HomeCleaningReferenceSample {
    public static let entry = ReferenceEntry(
        id: "home-cleaning-and-disinfection",
        title: "Cleaning and disinfection at home",
        subtitle: "When disinfection helps and how to use products safely",
        eyebrow: "REFERENCE · COMMUNITY & HOME CARE",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .infection),
        sections: [
            .bullets(title: "Choose the right level of cleaning", [
                AttributedBullet("Routine cleaning with soap or detergent removes dirt and most germs. Disinfection kills remaining germs and is particularly useful when someone is ill or has a weakened immune system.", citationIDs: ["community_cleaning_cdc"]),
                AttributedBullet("Clean frequently touched surfaces regularly and when visibly dirty. Use products compatible with the surface, and follow electronics and laundry manufacturers’ instructions.", citationIDs: ["community_cleaning_cdc"])
            ]),
            .bullets(title: "Make disinfection effective", [
                AttributedBullet("Clean the surface first, then use an appropriate disinfectant according to its label. Dirt can make disinfection less effective.", citationIDs: ["community_cleaning_cdc"]),
                AttributedBullet("Keep the surface visibly wet for the full contact time on the label. Follow the product’s dilution instructions; there is no single contact time or dilution that fits all products.", citationIDs: ["community_cleaning_cdc"])
            ]),
            .bullets(title: "Prevent chemical injury", [
                AttributedBullet("Use the recommended gloves or eye protection and provide ventilation. Never mix cleaning products or disinfectants with each other.", citationIDs: ["community_cleaning_cdc"]),
                AttributedBullet("Do not apply surface disinfectants to skin or pets, or swallow or inhale them. Store chemicals away from children and animals and wash hands after use.", citationIDs: ["community_cleaning_cdc"]),
                AttributedBullet("Some products can trigger asthma. Choose a safe cleaning approach with the care team when respiratory symptoms or sensitivity complicate household cleaning.", citationIDs: ["community_cleaning_cdc"])
            ])
        ],
        citations: [community_cleaning_cdc],
        lastSourceFidelityReview: "2026-09-17"
    )
}

public enum HomeMedicalDevicePreparednessReferenceSample {
    public static let entry = ReferenceEntry(
        id: "home-medical-device-preparedness",
        title: "Emergency planning with home medical devices",
        subtitle: "Power, supplies and an individualized backup plan",
        eyebrow: "REFERENCE · COMMUNITY & HOME CARE",
        nclexTags: NCLEXTags(category: .healthPromotion, subcategory: .healthPromotion, priorityConcept: .safety),
        sections: [
            .bullets(title: "Prepare with the device team", [
                AttributedBullet("Ask the supplier or manufacturer whether the device can run on batteries or another approved power source. Learn the backup procedure before an outage and keep supplier contact information accessible.", citationIDs: ["community_devices_fda"]),
                AttributedBullet("Notify the electric company and fire department about a device that requires power. Plan early evacuation or emergency assistance when interruption of a life-sustaining device would be dangerous.", citationIDs: ["community_devices_fda"]),
                AttributedBullet("Voluntary emergency registries do not guarantee rescue or immediate assistance. An individualized plan is still needed because responders may be delayed.", citationIDs: ["community_disability_cdc"])
            ]),
            .bullets(title: "Protect equipment and supplies", [
                AttributedBullet("Keep devices and supplies clean and dry. Do not plug in wet equipment or use sterile products whose packaging is wet or damaged; contact the supplier about damaged devices or replacements.", citationIDs: ["community_devices_fda"]),
                AttributedBullet("Follow the manufacturer’s cleaning and reuse instructions. Do not reuse products intended for single use, and do not boil a device unless its instructions explicitly allow it.", citationIDs: ["community_devices_fda"])
            ]),
            .bullets(title: "Check the power-restoration plan", [
                AttributedBullet("After power returns, check whether the device reset or its settings changed. Follow the device-specific instructions and contact the device team if there is a problem.", citationIDs: ["community_devices_fda"]),
                AttributedBullet("If a portable generator is part of the plan, it must remain outdoors more than 20 feet from windows, doors and vents. Opening a garage door does not make indoor generator use safe.", citationIDs: ["community_co_cdc"]),
                AttributedBullet("Use battery-powered lighting instead of flames when oxygen is in use. If essential device support fails, seek emergency assistance immediately.", citationIDs: ["community_devices_fda"])
            ])
        ],
        citations: [community_devices_fda, community_disability_cdc, community_co_cdc],
        lastSourceFidelityReview: "2026-09-17"
    )
}
