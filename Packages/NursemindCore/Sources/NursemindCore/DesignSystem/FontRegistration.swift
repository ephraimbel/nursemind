import CoreText
import Foundation

public enum NursemindFonts {
    /// Registers the bundled custom fonts so `Font.custom("InstrumentSerif-Regular", ...)` works.
    /// Call this once at app launch (e.g. inside the App's `init`).
    @MainActor
    public static func register() {
        let bundle = Bundle.module
        let names = [
            "InstrumentSerif-Regular.ttf",
            "InstrumentSerif-Italic.ttf",
            "Inter-Variable.ttf"
        ]
        for name in names {
            let stem = (name as NSString).deletingPathExtension
            let ext = (name as NSString).pathExtension
            guard let url = bundle.url(forResource: stem, withExtension: ext, subdirectory: "Fonts") else {
                continue
            }
            var error: Unmanaged<CFError>?
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, &error)
        }
    }
}
