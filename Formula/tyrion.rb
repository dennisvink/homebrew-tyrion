class Tyrion < Formula
  desc "Tiny Python-derived scripting language"
  homepage "https://github.com/dennisvink/tyrion"
  url "https://github.com/dennisvink/tyrion/archive/refs/tags/v0.3.8.tar.gz"
  sha256 "96b62c8975ab2bbdb754ec4ca7c98a2fc7ee9d2c0dd75cb6eefb2e188caa0804"
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
