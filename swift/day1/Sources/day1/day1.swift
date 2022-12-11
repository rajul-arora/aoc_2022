import Foundation
import ArgumentParser

enum Day1Error: Error {
    case invalidFilePath
}

@main
struct day1: ParsableCommand {

    @Argument(help: "Path of file to read")
    var file: String


    func run() throws {
        var calories: [UUID: Int] = [:]
        guard FileManager.default.fileExists(atPath: file) else {
            throw Day1Error.invalidFilePath
        }

        let string = try String(contentsOfFile: file)
        var currentId: UUID = UUID()
        string.components(separatedBy: .whitespacesAndNewlines).forEach { line in
            if line.isEmpty {
                currentId = UUID()
            } else {
                if let currentValue = calories[currentId], let valueToAdd = Int(line) {
                    calories[currentId] = currentValue + valueToAdd
                } else {
                    calories[currentId] = Int(line)
                }
            }
        }

        let sortedValues = calories.values.sorted { $0 > $1 }

        let first = sortedValues[0]
        let second = sortedValues[1]
        let third = sortedValues[2]

        print(first+second+third)
    }

    func main() {
        do {
            try run()
        } catch let error {
            print(error)
        }
    }
}
