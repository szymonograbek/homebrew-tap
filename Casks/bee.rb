cask "bee" do
  version "1.5.0"
  sha256 "4953591d78b04d2304cfac97a757d25a626fe16b000cfa98e35c3c4e686ad0c4"

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
