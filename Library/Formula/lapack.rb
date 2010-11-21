require 'formula'

class Lapack <Formula
  url 'http://www.netlib.org/lapack/lapack.tgz'
  version '3.2.2'
  homepage ''
  md5 '10832891c9e8100f81108c1ec7da0da4'

  depends_on 'cmake'
  depends_on 'gfortran'

  def install
  #  system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
