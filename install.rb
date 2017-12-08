require 'open-uri'
require 'sqlite3'

# For installing and configure macOS systems
class MacosFirstInstall
  def dbconnect
    @db = SQLite3::Database.open 'software.db'
    @db.results_as_hash = true
    @core = @db.execute("select * from software WHERE method='core'")
    @cask = @db.execute("select * from software WHERE method='cask'")
    @mas = @db.execute("select * from software WHERE method='mas'")
  end

  def brewinstall
    # url = 'https://raw.githubusercontent.com/Homebrew/install/master/install'
    # brewscript = open(url).read
    # eval(brewscript)
    system('/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"')
  end

  def preinstall
    @precore = @core.each.map { |package| 'brew install ' + package['name'] }
    @precask = @cask.each.map { |package| 'brew cask install ' + package['name'] }
    @premas = @mas.each.map { |package| 'mas install ' + package['name'] }
  end

  def install
    @precore.each { |command| system command }
    @precask.each { |command| system command }
    @premas.each { |command| system command }
    system('curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh')
    system('git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions')
    system('curl -L https://iterm2.com/misc/install_shell_integration.sh | bash')
  end

  def cleanup
    system('brew cleanup')
  end

  def main
    brewinstall
    dbconnect
    preinstall
    install
    cleanup
  end
end

MacosFirstInstall.new.main
