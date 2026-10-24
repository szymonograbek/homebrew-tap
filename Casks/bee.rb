cask "bee" do
  version "1.1.0"
  sha256 "cd29431c40319534f42e9ef84a2b87c149d6bc5953172cec79d65280cba7b7e4"

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
