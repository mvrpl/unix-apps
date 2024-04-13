class Chsht < Formula
    desc "Cheat Sheets on Terminal"
    homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
    license "MIT"

    if OS.linux? && Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
        url "https://artifacts-mvrpl.s3.sa-east-1.amazonaws.com/chsht/releases/0.2.0/chsht-linux-amd64"
        sha256 "3e6aedea6d0c3b5da33bf869e19c1d263d98c6ded032dd6f3316e4e66300492c"
    end
    
    depends_on "less"
    
    def install
        bin.install "chsht-linux-amd64" => "chsht"
    end
end