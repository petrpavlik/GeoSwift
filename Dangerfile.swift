// Dangerfile.swift

import Danger
import DangerSwiftLint // package: https://github.com/ashfurrow/danger-swiftlint.git

var x = 5; // to generate a linter warning

SwiftLint.lint()

message("It works!")
