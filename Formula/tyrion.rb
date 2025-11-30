class Tyrion < Formula
  desc "Tiny Python-derived scripting language"
  homepage "https://github.com/dennisvink/tyrion"
  url "https://github.com/dennisvink/tyrion/archive/refs/tags/v0.3.4.tar.gz"
  sha256 "092de16e586c9bf610436eec81948421ac8ad22a2dbb3e48c97d518c12e3c1df"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"hello.ty").write <<~EOS
      print("hi")
    EOS
    system bin/"tyrion", "hello.ty"
    assert_equal "hi\n"
  end
end
