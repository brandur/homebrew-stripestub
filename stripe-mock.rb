# This file was generated by GoReleaser. DO NOT EDIT.
class StripeMock < Formula
  desc "stripe-mock is a mock HTTP server that responds like the real Stripe API. It can be used instead of Stripe's testmode to make test suites integrating with Stripe faster and less brittle."
  homepage "https://github.com/stripe/stripe-mock"
  version "0.73.3"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/stripe/stripe-mock/releases/download/v0.73.3/stripe-mock_0.73.3_darwin_amd64.tar.gz"
    sha256 "0ce6dadf0a54e1029b4c2b35cfa88038b5247aef5621c688aa0cda8af7562ef5"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/stripe/stripe-mock/releases/download/v0.73.3/stripe-mock_0.73.3_linux_amd64.tar.gz"
      sha256 "53e53516e272e018734a0758251bd39f9393adc14f5d11d759370d3a3c6220db"
    end
  end

  def install
    bin.install "stripe-mock"
  end

  plist_options :startup => false

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>KeepAlive</key>
    <dict>
      <key>SuccessfulExit</key>
      <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
      <string>#{opt_bin}/stripe-mock</string>
      <string>-http-port</string>
      <string>12111</string>
      <string>-https-port</string>
      <string>12112</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/stripe-mock.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/stripe-mock.log</string>
  </dict>
</plist>

  EOS
  end
end
