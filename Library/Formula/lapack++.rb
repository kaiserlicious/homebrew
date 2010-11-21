require 'formula'

class Lapackxx <Formula
  url 'http://sourceforge.net/projects/lapackpp/files/lapackpp-2.5.4.tar.gz/download'
  version '2.5.4'
  homepage ''
  md5 ''

  # depends_on 'cmake'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
