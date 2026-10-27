cask "bee" do
  version "1.4.0"
  sha256 "72796bd4d9eb7998fbf23cf8cf97a5c0c74b84960a46e0c4d049c0d6128c04ed"

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
