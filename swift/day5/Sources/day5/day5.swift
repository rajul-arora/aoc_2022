import Foundation
import ArgumentParser

enum Day5Error: Error {
    case invalidFile
    case noSeparator
}

struct Stack {
    var crates: [String]
}

struct Command {
    enum CommandType: String {
        case move
    }

    let type: CommandType
    let quantity: Int
    let source: Int
    let destination: Int
}

@main
struct day5: ParsableCommand {

    @Argument(help: "The file to read")
    var file: String

    func run() throws {
        guard FileManager.default.fileExists(atPath: file) else {
            throw Day5Error.invalidFile
        }

        let string = try String(contentsOfFile: file)
        let lines = string.components(separatedBy: .newlines)

        // Find the index of the space that separates the
        // stack from the list of commands.
        guard let spaceIndex = lines.firstIndex(of: "") else {
            throw Day5Error.noSeparator
        }

        let stackIds = lines[spaceIndex - 1]
            .components(separatedBy: .whitespaces)
            .filter { !$0.isEmpty }
        let numbersLine = lines[spaceIndex - 1]

        var stacks = stackIds.map { _ in Stack(crates: []) }

        var index = spaceIndex - 2
        while index >= 0 {
            numbersLine.enumerated().forEach { rowIndex, value in
                let stringValue = String(value)
                if
                    !stringValue.isEmpty,
                    let crateIndex = Int(stringValue)
                {
                    let row = lines[index]
                    let stackValue = String(
                        row[row.index(row.startIndex, offsetBy: rowIndex)]
                    ).trimmingCharacters(in: .whitespaces)
                    if !stackValue.isEmpty {
                        stacks[crateIndex - 1].crates.append(stackValue)
                    }
                }
            }

            index -= 1
        }

        let commandsStartIndex = spaceIndex + 1
        let commandLines = lines[commandsStartIndex..<lines.count]
            .filter { !$0.isEmpty }

        let commands: [Command] = commandLines.compactMap { line in
            let items = line.components(separatedBy: .whitespaces)
            guard
                let type = Command.CommandType(rawValue: items[0]),
                let quantity = Int(items[1]),
                let source = Int(items[3]),
                let destination = Int(items[5])
            else {
                return nil
            }

            return Command(
                type: type,
                quantity: quantity,
                source: source,
                destination: destination
            )
        }

        commands.forEach { command in
            var sourceStack = stacks[command.source - 1]
            var destinationStack = stacks[command.destination - 1]

            var valuesToAdd: [String] = []
            for _ in 0..<command.quantity {
                let value = sourceStack.crates.removeLast()
                valuesToAdd.append(value)
            }

            destinationStack.crates += valuesToAdd.reversed()
            stacks[command.source - 1] = sourceStack
            stacks[command.destination - 1] = destinationStack
        }

        let output = stacks.compactMap { $0.crates.last }.reduce("", +)
        print(output)
    }

    func main() {
        do {
            try run()
        } catch let error {
            print(error)
        }
    }
}
