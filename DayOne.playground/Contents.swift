import UIKit
import PlaygroundSupport

let input = [80228,76027,101696,66033,127249,104564,88957,
    82536,131331,62571,129935,138764,122011,82908,83358,56584,85483,
    110398,87103,145728,87305,116387,145243,118656,92624,86152,81056,
    98776,109949,126863,131046,134570,97818,123881,105902,60102,100226,101041,70950,
    110903,71779,80531,144679,100346,130079,55606,92984,136022,126633,77104,
    118037,148426,62327,56250,133496,69308,125495,122131,56864,127532,94194,64268,80166,83250,
    96506,87668,142137,142915,148287,109471,79349,148270,104627,109657,
    86225,111411,144666,91402,140834,138587,117809,114288,126467,100089,
    78745,92180,89969,128868,128085,129931,64047,71968,111512,143771,149658,
    146102,52655,130193,109013,120465
]

func calcualteFuelForEachMass(mass: Int) -> Int {
    return (mass/3)-2
}

func calculateFuelForFuelMass(fuelMass: Int) -> Int {
    var fuelForFuelMass = 0
    let fuelNeeded = calcualteFuelForEachMass(mass: fuelMass)
    if (fuelNeeded <= 0) {
        return fuelForFuelMass
    } else {
        fuelForFuelMass = fuelForFuelMass + fuelNeeded + calculateFuelForFuelMass(fuelMass: fuelNeeded)
    }
    return fuelForFuelMass
}

var fuelForEachMass = [Int]()
var fuelForFuelMass = [Int]()
for mass in input {
    fuelForEachMass.append(calcualteFuelForEachMass(mass: mass))
}

for massOfFuel in fuelForEachMass {
    fuelForFuelMass.append(calculateFuelForFuelMass(fuelMass: massOfFuel))
}
 
var fuelNeededForMass = fuelForEachMass.reduce(0, +)
var massForTheFuel = fuelForFuelMass.reduce(0, +)
print("Fuel needed for all mass: \(fuelNeededForMass)")
print("Fuel for the fuel mass: \(massForTheFuel)")
print("Total fuel: \(fuelNeededForMass + massForTheFuel)")

