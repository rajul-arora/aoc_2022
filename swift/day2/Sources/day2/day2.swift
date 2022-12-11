import Foundation
import ArgumentParser

enum Day2Error: Error {
    case invalidFilePath
}

@main
struct day2: ParsableCommand {

    @Argument(help: "Path of the file to read")
    var file: String

    func calculateScore(opponent: String, you: String) -> Int {
        // A = Rock (1) , B = Paper (2), C = Scissors (3)
        // X = Rock (1), Y = Paper (2), Z = Scissors (3)
        // Win = 6, Loss = 0, Draw = 3
        if (opponent == "A") {
            // Opponent chose Rock
            if you == "X" {
                // Both Rock -> Tie
                return 1 + 3 // 1 for rock, 3 for the tie
            } else if you == "Y" {
                // Paper beats Rock -> Win
                return 2 + 6 // 2 for Paper, 6 for the win
            } else if you == "Z" {
                // Rock beats scissors -> Loss
                return 3 + 0 // 3 for Scissors, 0 for the loss
            }
        } else if (opponent == "B") {
            // Opponent chose Paper
            if you == "X" {
                // Paper beats rock -> Lose
                return 1 + 0 // 1 for rock, 0 for loss
            } else if you == "Y" {
                // Both Paper -> Tie
                return 2 + 3 // 2 for paper, 3 for the tie
            } else if you == "Z" {
                // Scissors Beats Paper -> Win
                return 3 + 6 // 3 for Scissors, 6 for the win
            }
        } else if (opponent == "C") {
            // Opponent chose Scissors
            if you == "X" {
                // Rock beats Scissors -> win
                return 1 + 6 // 1 for rock, 6 for the win
            } else if you == "Y" {
                // Scissors beats paper -> lose
                return 2 + 0 // 2 for paper, 0 for loss
            } else if you == "Z" {
                // Both scissors -> tie
                return 3 + 3 // 3 for scissors, 3 for the tie
            }
        }

        return 0
    }

    func calculatePart2Score(opponent: String, you: String) -> Int {
        // Opponent: A = Rock (1) , B = Paper (2), C = Scissors (3)
        // X -> I need to lose, Y -> I need to draw, Z -> I need to win
        if opponent == "A" {
            // Opponent chose rock
            if you == "X" {
                // I need to lose -> choose scissors
                return 3 + 0 // 3 for scissors, 0 for loss
            } else if you == "Y" {
                // I need to draw -> choose rock
                return 1 + 3 // 1 for rock, 3 for draw
            } else if you == "Z" {
                // I need to win -> choose paper
                return 2 + 6 // 2 for paper, 6 for win
            }
        } else if opponent == "B" {
            // Opponent chose paper
            if you == "X" {
                // I need to lose -> choose rock
                return 1 + 0 // 1 for rock, 0 for loss
            } else if you == "Y" {
                // I need to draw -> choose paper
                return 2 + 3 // 2 for paper, 3 for tie
            } else if you == "Z" {
                // I need to win -> choose scissors
                return 3 + 6 // 3 for scissors, 6 for win
            }
        } else if opponent == "C" {
            // Opponent chose scissors
            if you == "X" {
                // I need to lose -> choose paper
                return 2 + 0 // 2 for paper, 0 for loss
            } else if you == "Y" {
                // I need to tie -> choose scissors
                return 3 + 3 // 3 for scissors, 3 for tie
            } else if you == "Z" {
                // I need to win -> choose rock
                return 1 + 6 // 1 for rock, 6 for win
            }
        }

        return 0
    }

    func run() throws {
        guard FileManager.default.fileExists(atPath: file) else {
            throw Day2Error.invalidFilePath
        }

        let string = try String(contentsOfFile: file)
        let lines = string.components(separatedBy: .newlines)

        var score: Int = 0

        lines.forEach {
            let moves = $0.components(separatedBy: .whitespaces)

            if moves.count == 2,
               let opponent = moves.first,
               let you = moves.last
            {
                score += calculatePart2Score(opponent: opponent, you: you)
            }
        }

        print(score)
    }

    func main() {
        do {
            try run()
        } catch let error {
            print(error)
        }
    }
}
