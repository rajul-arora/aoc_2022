import Foundation
import ArgumentParser

enum Day6Error: Error {
    case invalidFile
}

@main
struct day6: ParsableCommand {

    @Argument(help: "Input File")
    var file: String

    func indicesForWindow(string: String, windowSize: Int, offset: Int) -> [String.Index] {
        var indices: [String.Index] = []
        let startIndex = string.startIndex

        for index in 0..<windowSize {
            indices.append(string.index(startIndex, offsetBy: offset - index))
        }

        return indices
    }

    func run() throws {
        guard FileManager.default.fileExists(atPath: file) else {
            throw Day6Error.invalidFile
        }

        let string = try String(contentsOfFile: file)
            .trimmingCharacters(in: .newlines)

        var offset = 13
        let startIndex = string.startIndex
        while offset < string.count {
            let idx1 = string.index(startIndex, offsetBy: offset - 13)
            let idx2 = string.index(startIndex, offsetBy: offset - 12)
            let idx3 = string.index(startIndex, offsetBy: offset - 11)
            let idx4 = string.index(startIndex, offsetBy: offset - 10)
            let idx5 = string.index(startIndex, offsetBy: offset - 9)
            let idx6 = string.index(startIndex, offsetBy: offset - 8)
            let idx7 = string.index(startIndex, offsetBy: offset - 7)
            let idx8 = string.index(startIndex, offsetBy: offset - 6)
            let idx9 = string.index(startIndex, offsetBy: offset - 5)
            let idx10 = string.index(startIndex, offsetBy: offset - 4)
            let idx11 = string.index(startIndex, offsetBy: offset - 3)
            let idx12 = string.index(startIndex, offsetBy: offset - 2)
            let idx13 = string.index(startIndex, offsetBy: offset - 1)
            let idx14 = string.index(startIndex, offsetBy: offset - 0)


            var characterSet: Set<Character> = Set<Character>()
            characterSet.insert(string[idx1])
            characterSet.insert(string[idx2])
            characterSet.insert(string[idx3])
            characterSet.insert(string[idx4])
            characterSet.insert(string[idx5])
            characterSet.insert(string[idx6])
            characterSet.insert(string[idx7])
            characterSet.insert(string[idx8])
            characterSet.insert(string[idx9])
            characterSet.insert(string[idx10])
            characterSet.insert(string[idx11])
            characterSet.insert(string[idx12])
            characterSet.insert(string[idx13])
            characterSet.insert(string[idx14])
            
            if characterSet.count == 14 {
                print(offset + 1)
                return
            }

            offset += 1
        }
    }

    func main() {
        do {
            try run()
        } catch let error {
            print(error)
        }
    }
}
