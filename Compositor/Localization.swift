import SwiftUI

/// Catalog look-ups for strings built at runtime — enum raw values, stored names — where the
/// English text itself is the key. Localized literals use `String(localized:)`; these helpers
/// are for strings that arrive already assembled (a menu title read back, an undo name, a
/// blend mode's `rawValue`).
extension String {
    /// The string's English contents as the catalog key: "Crop" reads as its translation, and
    /// anything not in the catalog (a layer name, a file name) passes through unchanged.
    init(localizedKey key: String) { self = String(localized: String.LocalizationValue(key)) }
}

extension RawRepresentable where RawValue == String {
    /// The raw value as menu text: looked up in the catalog ("Gaussian Blur" on the Filter
    /// menu, "Drop Shadow" in the effects list). Not for raw values used as storage keys.
    var localizedName: String { String(localizedKey: rawValue) }
}
