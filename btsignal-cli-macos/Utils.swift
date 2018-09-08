import Foundation
import Darwin


func printStdout(_ output: String) {
    print(output)
    fflush(stdout)
}


func printStderr(_ output: String) {
    fputs("-> \(output)\n", stderr)
}
