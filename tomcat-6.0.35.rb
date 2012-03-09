require 'formula'

class Tomcat <Formula
  url 'http://mirrorservice.nomedia.no/apache.org/tomcat/tomcat-6/v6.0.35/bin/apache-tomcat-6.0.35.tar.gz'
  homepage 'http://tomcat.apache.org/'
  md5 '171d255cd60894b29a41684ce0ff93a8'

  def skip_clean?(path); true; end

  def install
    rm_rf Dir['bin/*.{cmd,bat]}']
    libexec.install Dir['*']
    (libexec+'logs').mkpath
    bin.mkpath
    Dir["#{libexec}/bin/*.sh"].each { |f| ln_s f, bin }
  end

  def caveats
    <<-EOS.undent
      Note: Some of the support scripts used by Tomcat have very generic names.
      These are likely to conflict with support scripts used by other Java-based
      server software.

      You may want to `brew unlink tomcat` and add:
        #{bin}
      to your PATH instead.
    EOS
  end
end