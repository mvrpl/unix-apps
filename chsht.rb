class Chsht < Formula
    desc "Cheat Sheets on Terminal"
    homepage "https://github.com/mvrpl/Terminal-Cheat-Sheet"
    license "MIT"
    head "https://github.com/mvrpl/Terminal-Cheat-Sheet.git", branch: "main"
    
    depends_on "less"
    
    def install
        system "echo"
    end
    
    test do
        system "echo"
    end
end