cask "bee" do
  version "1.4.2"
  sha256 "d745864601ae1030099fb136159083b29ee6e0ece8b7ea4ca4fc746cee124953"

  url "https://github.com/szymonograbek/bee/releases/download/v#{version}/Bee.zip"
  name "Bee"
  desc "Menu bar app that keeps your Mac awake"
  homepage "https://github.com/szymonograbek/bee"

  depends_on macos: :sequoia

  app "Bee.app"

  # Bee is ad-hoc signed, not notarized, so Gatekeeper would refuse to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Bee.app"]
  end

  uninstall quit:   "com.szymonograbek.Bee",
            delete: "/etc/sudoers.d/bee"

  zap trash: "~/Library/Preferences/com.szymonograbek.Bee.plist"
end
