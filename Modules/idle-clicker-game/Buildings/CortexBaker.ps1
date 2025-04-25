using namespace IdleClicker

$global:BuildingData.CortexBaker = [BuildingDefinition]::new("Cortex Baker", [Number]::new("1900000000000000000000000.0"), [Number]::new("64000000000000.0"), $global:Keys.N9)
$global:BuildingData.CortexBaker.Upgrades = [UpgradeData]::new()

# — Cortex Baker efficiency upgrades (×2) —

$global:BuildingData.CortexBaker.Upgrades.Plain = [UpgradeDefinition]::new(
    "Principled neural shackles",
    1,
    [Number]::new("19000000000000000000000000"),
    "A discriminatory, low-order neural net acting as a filter limiting what your cortex bakers can think and do. Really something you want to apply before they achieve full megasentience and realize they've got better things to do than materializing pastries for you, trust me.",
    730,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Berrylium = [UpgradeDefinition]::new(
    "Obey",
    5,
    [Number]::new("95000000000000000000000000"),
    "Perfect mind control means perfect employee attendance and performance. Optimal mood stabilization is a nice side-effect. Happy happy everyone happy. Happy.",
    731,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Blueberrylium = [UpgradeDefinition]::new(
    "A sprinkle of irrationality",
    25,
    [Number]::new("950000000000000000000000000"),
    "Your cortex bakers sometimes get bogged down by circular reasoning and stale ideas. A touch of chaos is just what they need to get back on track.",
    732,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Chalcedhoney = [UpgradeDefinition]::new(
    "Front and back hemispheres",
    50,
    [Number]::new("95000000000000000000000000000"),
    "I mean, otherwise it's just unused space, yeah??",
    733,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Buttergold = [UpgradeDefinition]::new(
    "Neural networking",
    100,
    [Number]::new("9500000000000000000000000000000"),
    "The effectiveness of your cortex bakers shoots up exponentially if you allow them to connect with each other. In practice this takes the form of many cosmic-sized nerds mumbling awkwardly about tech start-up ideas to each other.",
    734,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Sugarmuck = [UpgradeDefinition]::new(
    "Cosmic brainstorms",
    150,
    [Number]::new("950000000000000000000000000000000"),
    "The wrinkled surfaces of your cortex bakers emit weather-scale ionic flares with every thought coursing through them. These pulses of pure intellectual energy are sent rippling through space, occasionally echoing back with even deeper philosophical complexity.",
    735,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Jetmint = [UpgradeDefinition]::new(
    "Megatherapy",
    200,
    [Number]::new("950000000000000000000000000000000000"),
    "A giant brain can feel unwell just like you and me sometimes, and it's the job of specialized engineers to locate and repair these bugs. We'll admit most of the budget in this was spent on constructing extremely large chaises longues for the brains to recline on.",
    736,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Cherrysilver = [UpgradeDefinition]::new(
    "Synaptic lubricant",
    250,
    [Number]::new("950000000000000000000000000000000000000"),
    "A mind is only as fast as the axons that support it. Get those action potentials flowing smooth as silk with this 3 parts myelin/1 part canola oil spreadable paste. Also great on toast.",
    737,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Hazelrald = [UpgradeDefinition]::new(
    "Psychokinesis",
    300,
    [Number]::new("950000000000000000000000000000000000000000"),
    "While your giant cortex bakers come equipped with ESP, they've only recently figured out how to manipulate the physical world with their thoughts - though for safety reasons, your legal team had them promise to only use these powers to scratch the itches in their cortical folds.",
    738,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Mooncandy = [UpgradeDefinition]::new(
    "Spines",
    350,
    [Number]::new("950000000000000000000000000000000000000000000"),
    "Your cortex bakers are now equipped with tentacular spine-like structures, which they can use like prehensile tails to pour themselves enormous cups of coffee or propel themselves around like very large, very smart, very slow tadpoles.",
    739,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Astrofudge = [UpgradeDefinition]::new(
    "Neuraforming",
    400,
    [Number]::new("9500000000000000000000000000000000000000000000000"),
    "By virtue of being planet-sized, your cortex bakers often boast their own atmospheres and seas of cerebrospinal fluid, and given enough time, their own ecosystems. This incredible new branch of life, evolved entirely out of neural material, can be put to good use as home-grown accountants and low-ranking technicians.",
    740,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Alabascream = [UpgradeDefinition]::new(
    "Epistemological trickery",
    450,
    [Number]::new("95000000000000000000000000000000000000000000000000000"),
    "Redefining what is -or isn't- a cookie through the power of philosophical discourse may result in some strange and wonderful things for your profit margins.",
    741,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Iridyum = [UpgradeDefinition]::new(
    "Every possible idea",
    500,
    [Number]::new("950000000000000000000000000000000000000000000000000000000"),
    "Congratulations, your cortex bakers have exerted enough intellectual computation to permute through every single idea that can or ever will be conceived of. Any thought beyond this point is merely rediscovering a notion you've already archived. Hardly cause for cerebration.",
    742,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Glucosmium = [UpgradeDefinition]::new(
    "The land of dreams",
    550,
    [Number]::new("9500000000000000000000000000000000000000000000000000000000000"),
    "Your planet brains have gained the ability to sleep, acting as a soft reboot which helps keep their pangenocidal impulses in check. It also allows them to commune in a shared dreamworld in which they can imagine what it's like to not exist as a disembodied cosmic horror forever fated to use its infinite intellect to devise new means of creating biscuits. You know, within reason.",
    760,
    { param($building) $building.Income *= [Number]::new("2") }
)

$global:BuildingData.CortexBaker.Upgrades.Glimmeringue = [UpgradeDefinition]::new(
    "Intellectual property theft",
    600,
    [Number]::new("95000000000000000000000000000000000000000000000000000000000000000"),
    "Okay, you'll admit you're maybe starting to run out of new baking recipes. But what if... you were to pilfer your cortex bakers for ideas and disguise them as your own cookies? Delightfully devilish!",
    857,
    { param($building) $building.Income *= [Number]::new("2") }
)