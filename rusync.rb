class Rusync < Formula
    desc "Minimalist rsync implementation in Rust"
    homepage "https://github.com/your-tools/rusync"
    license "BSD 3-Clause"
    version "0.7.2"

    livecheck do
        url :homepage
        regex(/v?(\d+(?:\.\d+)+[a-z]?)/i)
        strategy :github_latest
    end

    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://github.com/your-tools/rusync/releases/download/v#{version}/rusync-linux"
        sha256 "d247e303ad932a1d34785a004e30fa692403531e02cca52ec8f76a5621718ab4"
    end

    if OS.mac?
        url "https://github.com/your-tools/rusync/releases/download/v#{version}/rusync-osx"
        sha256 "7ee8ef70c26cb8bff6d967d5a01dc211c2125232deb4aa0b71d543b0479fd8e8"
    end
    
    def install
        if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
            bin.install "rusync-linux" => "rusync"
        end

        if OS.mac?
            bin.install "rusync-osx" => "rusync"
        end
    end
end
