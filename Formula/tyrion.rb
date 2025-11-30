class Tyrion < Formula
  desc "Tiny Python-derived scripting language"
  homepage "https://github.com/dennisvink/tyrion"
  url "https://github.com/dennisvink/tyrion/archive/refs/tags/v0.3.7.tar.gz"
  sha256 "7b2cdb19d27f85c801f2448e2496c92370c4775db87f74dba9a2d6c5e65dce27"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"hello.ty").write <<~EOS
      print("hi")
    EOS
    assert_equal "hi\n", shell_output("#{bin}/tyrion hello.ty")
  end
end
