class Tyrion < Formula
  desc "Tiny Python-derived scripting language"
  homepage "https://github.com/dennisvink/tyrion"
  url "https://github.com/dennisvink/tyrion/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "26754d98d3721fab7a53eb6f0bbbd81dd59d2240393d5ea75b9cb37e4be0183e"
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
