
import SwiftUI

extension Color {
    init(hex: String) {
        let chars = Array(hex.dropFirst())
        self.init(red:   .init(strtoul(String(chars[0...1]),nil,16))/255,
                  green: .init(strtoul(String(chars[2...3]),nil,16))/255,
                  blue:  .init(strtoul(String(chars[4...5]),nil,16))/255
    )}
}

let iconX = 37.0
let iconY = 37.0
let viewRadius = 30.0
let iconRadius = 10.0
