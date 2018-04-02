require 'open-uri'
require 'sqlite3'
require 'mkmf'

# For installing and configure macOS systems
class MacosFirstInstall
  def dbconnect
    @db = SQLite3::Database.open 'macos_install.db'
    @db.results_as_hash = true
    @tap = @db.execute("select * from software WHERE method='tap'")
    @core = @db.execute("select * from software WHERE method='core'")
    @cask = @db.execute("select * from software WHERE method='cask'")
    @mas = @db.execute("select * from software WHERE method='mas'")
    @gem = @db.execute("select * from software WHERE method='gem'")
  end

  def preinstall
    @pretap = @tap.each.map { |package| 'brew tap ' + package['name'] }
    @precore = @core.each.map { |package| 'brew install ' + package['name'] unless system('brew ls --versions ' + package['name']) }
    @precask = @cask.each.map { |package| 'brew cask install ' + package['name'] unless system('brew cask ls --versions ' + package['name']) }
    @premas = @mas.each.map { |package| 'mas install ' + package['name'] }
    @pregem = @gem.each.map { |package| 'gem install ' + package['name'] }
  end

  def install
    @precore.compact.each { |command| system command }
    @precask.compact.each { |command| system command }
    @premas.compact.each { |command| system command }
    @pregem.compact.each { |command| system command }
    system('curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh')
    system('git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions')
    system('curl -L https://iterm2.com/misc/install_shell_integration.sh | bash')
  end

  def cleanup
    system('brew cleanup')
  end

  def main
    dbconnect
    preinstall
    install
    cleanup
  end
end

class MacOSConfig
  def dbconnect
    @db = SQLite3::Database.open 'macos_install.db'
    @db.results_as_hash = true
    @defaults = @db.execute("select * from config WHERE method='defaults'")
    @systemsetup = @db.execute("select * from config WHERE method='systemsetup'")
  end

  def preconfig
    @predefaults = @defaults.each.map { |config| [config['method'], 'write', config['domain'], config['key'], '-' + config['keytyp'], config['keyvalue']].join(' ') }
    @presystemsetup = @systemsetup.each.map { |config| [config['method'], '-' + config['key'], config['keyvalue']].join(' ') }
  end

  def config
    @predefaults.each { |command| system command }
    @presystemsetup.each { |command| system command }
  end

  def main
    dbconnect 
    preconfig
    config
  end
end

MacosFirstInstall.new.main
MacOSConfig.main
