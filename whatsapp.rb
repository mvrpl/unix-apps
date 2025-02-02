class Whatsapp < Formula
    desc "API for Whatsapp Web Multi Device Version, Support UI & Webhook"
    homepage "https://github.com/aldinokemal/go-whatsapp-web-multidevice"
    version "5.0.0"
    license "MIT"
  
    livecheck do
      url :homepage
      regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
      strategy :github_latest
    end
  
    if OS.linux?
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.0.0/linux-arm64"
        sha256 "a18d7b16282535b94664811ffb0e5445e1b562e3335695c0683af9169f916253"
      end
      if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.0.0/linux-amd64"
        sha256 "2e01657ae9bac498cf7564dbed7b8f6fcb55f897be66d86a972fc56e0173b117"
      end
    end
  
    if OS.mac? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/aldinokemal/go-whatsapp-web-multidevice/releases/download/v5.0.0/darwin-amd64"
        sha256 "edc77823b3779285a349be830bb7cd051ca79df40105c41eab868e62b13c4526"
    end
  
    def install
      if OS.linux?
        if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
          bin.install "linux-arm64" => "wapp"
        end
        if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
          bin.install "linux-amd64" => "wapp"
        end
      end
    
      if OS.mac? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        bin.install "darwin-amd64" => "wapp"
      end
    end
  end
  