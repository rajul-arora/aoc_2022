import Foundation
import ArgumentParser

enum Day3Error: Error {
    case invalidFilePath
    case noMax
}

struct Rucksack {
    let id: String
    let original: String
    let first: String
    let second: String
    let priority: Priority
}

extension String {
    func splitInHalf() -> [String] {
        let halfLength = self.index(self.startIndex, offsetBy: self.count/2)
        let firstHalf = self[self.startIndex..<halfLength]
        let secondHalf = self[halfLength..<self.endIndex]
        return [String(firstHalf), String(secondHalf)]
    }

    static func commonCharacters(_ a: String, _ b: String) -> [String] {
        let aChars = Set(a)
        let bChars = Set(b)
        return Array(aChars.intersection(bChars)).map { String($0) }
    }

    static func commonCharacters(_ a: String, _ b: String, _ c: String) -> [String] {
        let aChars = Set(a)
        let bChars = Set(b)
        let cChars = Set(c)

        let firstIntersection = aChars.intersection(bChars)
        return Array(firstIntersection.intersection(cChars).map { String($0) })
    }
}

@main
struct day3: ParsableCommand {

    @Argument(help: "Path of the file to read")
    var file: String

    private func priority(first: String, second: String) throws -> Priority {
        let maxPriority = String
            .commonCharacters(first, second)
            .compactMap { Priority(stringValue: $0) }
            .map { $0.rawValue }
            .max()

        guard let maxPriority = maxPriority else {
            throw Day3Error.noMax
        }

        return Priority(rawValue: maxPriority)!
    }

    func run() throws {
        guard FileManager.default.fileExists(atPath: file) else {
            throw Day3Error.invalidFilePath
        }

        let string = try String(contentsOfFile: file)
        let lines = string.components(separatedBy: .newlines)
        let rucksacks: [Rucksack] = try lines.compactMap {
            let split = $0.splitInHalf()
            guard
                let first = split.first,
                let second = split.last,
                !first.isEmpty,
                !second.isEmpty
            else {
                return nil
            }

            return Rucksack(
                id: UUID().uuidString,
                original: $0,
                first: first,
                second: second,
                priority: try priority(first: first, second: second)
            )
        }

        var index = 0
        var total = 0
        
        while index + 2 < rucksacks.count {
            let first = rucksacks[index].original
            let second = rucksacks[index+1].original
            let third = rucksacks[index+2].original
            let commonCharacters = String.commonCharacters(first, second, third)

            if let value = commonCharacters.first, let badge = Priority(stringValue: value) {
                total += badge.rawValue
            }

            index += 3
        }

        print(total)
    }

    func main() {
        do {
            try run()
        } catch let error {
            print(error)
        }
    }
}
