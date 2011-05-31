require 'formula'

class Armadillo < Formula
  url 'http://sourceforge.net/projects/arma/files/armadillo-1.2.0.tar.gz'
  homepage 'http://arma.sourceforge.net/'
  md5 '856268f9730a3e55db38cbc1b7f8f2bc'

  depends_on 'cmake'

  def install
    #system "./configure", "--disable-debug", "--disable-dependency-tracking",
    #                      "--prefix=#{prefix}"
    system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
