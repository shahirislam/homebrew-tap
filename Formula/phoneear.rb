class Phoneear < Formula
  desc "Hear your Mac's audio on your iPhone over Wi-Fi"
  homepage "https://github.com/shahirislam/phoneear"
  url "https://github.com/shahirislam/phoneear/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b1e3002d591f2ebe7387c047edc74fb2584345f7f9e52524527905e44d908c86"
  license "MIT"

  depends_on macos: :sonoma

  def install
    system "swiftc", "-O", "-swift-version", "5", "Sources/main.swift", "-o", "phoneear",
           "-Xlinker", "-sectcreate", "-Xlinker", "__TEXT", "-Xlinker", "__info_plist", "-Xlinker", "Info.plist"
    bin.install "phoneear"
  end

  test do
    assert_match "Usage: phoneear", shell_output("#{bin}/phoneear --help")
  end
end
