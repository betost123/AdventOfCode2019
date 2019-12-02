import UIKit

func getInput(noun: Int, verb: Int) -> [Int] {
    return [1,noun,verb,3,1,1,2,3,1,3,4,3,1,5,0,3,2,9,1,19,1,5,19,23,2,9,23,27,1,27,5,31,2,31,13,35,1,35,9,39,1,39,10,43,2,43,9,47,1,47,5,51,2,13,51,55,1,9,55,59,1,5,59,63,2,6,63,67,1,5,67,71,1,6,71,75,2,9,75,79,1,79,13,83,1,83,13,87,1,87,5,91,1,6,91,95,2,95,13,99,2,13,99,103,1,5,103,107,1,107,10,111,1,111,13,115,1,10,115,119,1,9,119,123,2,6,123,127,1,5,127,131,2,6,131,135,1,135,2,139,1,139,9,0,99,2,14,0,0]
}

func getOutput(noun: Int, verb: Int) -> Int {
    var input = getInput(noun: noun, verb: verb)
    var inputCode = 0
    while input[inputCode] != 99 && inputCode < input.count {
        let readValue = input[inputCode]
        if(readValue == 99) {
            print("Reached code 99")
            return input[0]
        } else if (readValue == 1) {
            let pos1 = input[inputCode + 1]
            let pos2 = input[inputCode + 2]
            let pos3 = input[inputCode + 3]
            input[pos3] = input[pos1] + input[pos2]
            inputCode = inputCode + 4
        } else if (readValue == 2) {
            let pos1 = input[inputCode + 1]
            let pos2 = input[inputCode + 2]
            let pos3 = input[inputCode + 3]
            input[pos3] = input[pos1] * input[pos2]
            inputCode = inputCode + 4
        } else {
            print("something went wrong")
            return input[0]
        }
    }
    return input[0]
}

print("Result: \(getOutput(noun: 12, verb: 2))")

//Superbad solution lol
func findExpectedOutput() -> Int {
    let expectedOutput = 19690720
    let inputLength = getInput(noun: 0, verb: 0).count
    for noun in 0...(inputLength-1) {
        for verb in 0...(inputLength-1)  {
            if (getOutput(noun: noun, verb: verb) == expectedOutput) {
                return noun * 100 + verb
            }
        }
    }
    return -1
}

print("System code needed is \(findExpectedOutput())")
