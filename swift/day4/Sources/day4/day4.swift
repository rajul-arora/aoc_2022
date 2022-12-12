import Foundation
import ArgumentParser

enum Day4Error: Error {
    case invalidPath
}

struct Range {
    let start: Int
    let end: Int
}

@main
struct day4: ParsableCommand {

    @Argument(help: "Path of the file to read")
    var file: String

    private func parseFile(string: String) -> [[Range]] {
        let lines = string.components(separatedBy: .newlines)
        return lines.compactMap { line in
            guard !line.isEmpty else {
                return nil
            }

            let components = line.components(separatedBy: ",")
            return components.compactMap { component in
                let values = component.components(separatedBy: "-")
                guard
                    let start = values.first,
                    let startInt = Int(start),
                    let end = values.last,
                    let endInt = Int(end)
                else {
                    return nil
                }

                return Range(
                    start: startInt,
                    end: endInt
                )
            }
        }
    }

    private func fullyContains(_ a: Range, _ b: Range) -> Bool {
        if a.start <= b.start && a.end >= b.end {
            // a fully contains b
            return true
        } else if b.start <= a.start && b.end >= a.end {
            // b fully contains a
            return true
        }

        return false
    }

    // 5-7,7-9
    // a.end = b.start
    // 2-3, 4-5
    // b.start >= a.start

    private func doesOverlap(_ a: Range, _ b: Range) -> Bool {
//        print("\(a.start)-\(a.end), \(b.start)-\(b.end)")
        if fullyContains(a, b) {
//            print("True")
            return true
        } else if b.start >= a.start && b.start <= a.end || a.start >= b.start && a.start <= b.end {
//            print("True")
            return true
        }

//        print("False")
        return false
    }

    func run() throws {
        guard FileManager.default.fileExists(atPath: file) else {
            throw Day4Error.invalidPath
        }

        let string = try String(contentsOfFile: file)
        let pairs = parseFile(string: string)
        var count: Int = 0

        pairs.forEach { range in
            if doesOverlap(range[0], range[1]) {
                count += 1
            }
        }

        print(count)
    }

    func main() {
        do {
            try run()
        } catch let error {
            print(error)
        }
    }
}
