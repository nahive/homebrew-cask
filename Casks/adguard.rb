cask "adguard" do
  version "2.10.1.1277"
  sha256 "0e60e644dccc9c02bb61685ce3522db49ab3ca8ecb40b9a0d722fac81c256797"

  url "https://static.adguard.com/mac/release/AdGuard-#{version}.dmg"
  name "AdGuard"
  desc "Stand alone ad blocker"
  homepage "https://adguard.com/"

  livecheck do
    url "https://static.adguard.com/mac/adguard-release-appcast.xml"
    strategy :sparkle do |item|
      item.short_version.delete_suffix(" release")
    end
  end

  auto_updates true
  conflicts_with cask: "homebrew/cask-versions/adguard-nightly"
  depends_on macos: ">= :high_sierra"

  pkg "AdGuard.pkg"

  uninstall quit:      "com.adguard.mac.adguard",
            pkgutil:   "com.adguard.mac.adguard-pkg",
            launchctl: [
              "com.adguard.mac.adguard.pac",
              "com.adguard.mac.adguard.tun-helper",
            ],
            delete:    [
              "/Library/com.adguard.mac.adguard.pac",
              "/Library/Application Support/AdGuard Software/com.adguard.mac.adguard",
              "/Library/Application Support/com.adguard.Adguard",
            ],
            rmdir:     "/Library/Application Support/AdGuard Software"

  zap trash: [
    "/Library/Logs/com.adguard.mac.adguard",
    "~/Library/Application Scripts/*.com.adguard.mac",
    "~/Library/Application Scripts/com.adguard.mac.adguard.loginhelper",
    "~/Library/Application Scripts/com.adguard.mac.adguard.safari-assistant",
    "~/Library/Application Support/Adguard",
    "~/Library/Application Support/com.adguard.Adguard",
    "~/Library/Application Support/com.adguard.mac.adguard.pac",
    "~/Library/Application Support/com.adguard.mac.adguard.tun-helper",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adguard.mac.adguard.loginhelper.sfl*",
    "~/Library/Caches/com.adguard.Adguard",
    "~/Library/Caches/com.adguard.mac.adguard",
    "~/Library/Containers/com.adguard.mac.adguard.loginhelper",
    "~/Library/Containers/com.adguard.mac.adguard.safari-assistant",
    "~/Library/Cookies/com.adguard.Adguard.binarycookies",
    "~/Library/Group Containers/*.com.adguard.mac",
    "~/Library/HTTPStorages/com.adguard.mac.adguard",
    "~/Library/HTTPStorages/com.adguard.mac.adguard.binarycookies",
    "~/Library/Logs/Adguard",
    "~/Library/Preferences/com.adguard.Adguard.plist",
    "~/Library/Preferences/com.adguard.mac.adguard.plist",
    "~/Library/Saved Application State/com.adguard.mac.adguard.savedState",
  ]
end
