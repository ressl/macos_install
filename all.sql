CREATE TABLE IF NOT EXISTS software (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT VARCHAR(255) NOT NULL,
  category TEXT VARCHAR(255) NOT NULL,
  method TEXT VARCHAR(5) NOT NULL,
  info TEXT VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS config (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  method TEXT VARCHAR(20) NOT NULL,
  category TEXT VARCHAR(255) NOT NULL,
  domain TEXT VARCHAR(255) NOT NULL,
  key TEXT VARCHAR(255) NOT NULL,
  keytyp TEXT VARCHAR(10) NOT NULL,
  keyvalue TEXT VARCHAR(25) NOT NULL,
  info TEXT VARCHAR(255)
);
INSERT INTO config(method, category, domain, key, keytyp, keyvalue, info) VALUES ('defaults', 'window', 'NSGlobalDomain', 'NSAutomaticWindowAnimationsEnabled', 'bool', 'false', 'Disable animations when opening and closing windows.');
INSERT INTO config(method, category, domain, key, keytyp, keyvalue, info) VALUES ('defaults', 'window', 'NSGlobalDomain', 'QLPanelAnimationDuration', 'float', '0', 'Disable animations when opening a Quick Look window.');
INSERT INTO config(method, category, domain, key, keytyp, keyvalue, info) VALUES ('defaults', 'window', 'NSGlobalDomain', 'NSWindowResizeTime', 'float', '0.001', 'Accelerated playback when adjusting the window size (Cocoa applications).');
INSERT INTO config(method, category, domain, key, keytyp, keyvalue, info) VALUES ('defaults', 'finder', 'com.apple.finder', 'DisableAllAnimations', 'bool', 'true', 'Disable animation when opening the Info window in Finder (cmd + i).');
INSERT INTO config(method, category, domain, key, keytyp, keyvalue, info) VALUES ('defaults', 'dock', 'com.apple.dock', 'launchanim', 'bool', 'false', 'Disable animations when you open an application from the Dock.');
INSERT INTO config(method, category, domain, key, keytyp, keyvalue, info) VALUES ('defaults', 'dock', 'com.apple.dock', 'expose-animation-duration', 'float', '0.1', 'Make all animations faster that are used by Mission Control.');
INSERT INTO config(method, category, domain, key, keytyp, keyvalue, info) VALUES ('defaults', 'dock', 'com.apple.dock', 'autohide-delay', 'float', '0', 'Disable the delay when you hide the Dock');
INSERT INTO software(name, category, method) VALUES ('caskroom/cask', 'tap', 'tap');
INSERT INTO software(name, category, method) VALUES ('caskroom/drivers', 'tap', 'tap');
INSERT INTO software(name, category, method) VALUES ('caskroom/versions', 'tap', 'tap');
INSERT INTO software(name, category, method) VALUES ('caskroom/fonts', 'tap', 'tap');
INSERT INTO software(name, category, method) VALUES ('font-source-code-pro', 'font', 'cask');
INSERT INTO software(name, category, method) VALUES ('font-dejavu-sans', 'font', 'cask');
INSERT INTO software(name, category, method) VALUES ('font-monoid', 'font', 'cask');
INSERT INTO software(name, category, method) VALUES ('font-raleway', 'font', 'cask');
INSERT INTO software(name, category, method) VALUES ('adobe-creative-cloud', 'multimedia', 'cask');
INSERT INTO software(name, category, method) VALUES ('bartender', 'multimedia', 'cask');
INSERT INTO software(name, category, method) VALUES ('bash', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('zsh', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('cheatsheet', 'multimedia', 'cask');
INSERT INTO software(name, category, method) VALUES ('cleanmymac', 'core', 'cask');
INSERT INTO software(name, category, method) VALUES ('coreutils', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('dnscrypt', 'core', 'cask');
INSERT INTO software(name, category, method) VALUES ('firefox', 'browser', 'cask');
INSERT INTO software(name, category, method) VALUES ('go', 'programming', 'core');
INSERT INTO software(name, category, method) VALUES ('google-chrome', 'browser', 'cask');
INSERT INTO software(name, category, method) VALUES ('handbrake', 'multimedia', 'cask');
INSERT INTO software(name, category, method) VALUES ('istat-menus', 'core', 'cask');
INSERT INTO software(name, category, method) VALUES ('iterm2', 'core', 'cask');
INSERT INTO software(name, category, method) VALUES ('java', 'programming', 'cask');
INSERT INTO software(name, category, method) VALUES ('keepassx', 'core', 'cask');
INSERT INTO software(name, category, method) VALUES ('libreoffice', 'office', 'cask');
INSERT INTO software(name, category, method) VALUES ('libreoffice-language-pack', 'office', 'cask');
INSERT INTO software(name, category, method) VALUES ('mas', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('microsoft-office', 'office', 'cask');
INSERT INTO software(name, category, method) VALUES ('neovim', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('nextcloud', 'core', 'cask');
INSERT INTO software(name, category, method) VALUES ('nmap', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('node', 'programming', 'core');
INSERT INTO software(name, category, method) VALUES ('omnifocus', 'office', 'cask');
INSERT INTO software(name, category, method) VALUES ('omnigraffle', 'office', 'cask');
INSERT INTO software(name, category, method) VALUES ('opera', 'browser', 'cask');
INSERT INTO software(name, category, method) VALUES ('p7zip', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('pwgen', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('sizeup', 'core', 'cask');
INSERT INTO software(name, category, method) VALUES ('skype', 'communication', 'cask');
INSERT INTO software(name, category, method) VALUES ('skype-for-business', 'communication', 'cask');
INSERT INTO software(name, category, method) VALUES ('slack', 'communication', 'cask');
INSERT INTO software(name, category, method) VALUES ('snagit', 'support', 'cask');
INSERT INTO software(name, category, method) VALUES ('sonos', 'multimedia', 'cask');
INSERT INTO software(name, category, method) VALUES ('i1profiler', 'multimedia', 'cask');
INSERT INTO software(name, category, method) VALUES ('teamviewer', 'support', 'cask');
INSERT INTO software(name, category, method) VALUES ('tmux', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('torbrowser', 'browser', 'cask');
INSERT INTO software(name, category, method) VALUES ('unrar', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('vlc', 'multimedia', 'cask');
INSERT INTO software(name, category, method) VALUES ('wget', 'core', 'core');
INSERT INTO software(name, category, method) VALUES ('whatsapp', 'communication', 'cask');
INSERT INTO software(name, category, method) VALUES ('youtube-dl', 'multimedia', 'core');
INSERT INTO software(name, category, method, info) VALUES ('1090488118', 'core', 'mas', 'gemini 2');
INSERT INTO software(name, category, method, info) VALUES ('405399194', 'core', 'mas', 'kindle');
INSERT INTO software(name, category, method, info) VALUES ('409183694', 'office', 'mas', 'keynote');
INSERT INTO software(name, category, method, info) VALUES ('409201541', 'office', 'mas', 'pages');
INSERT INTO software(name, category, method, info) VALUES ('409203825', 'office', 'mas', 'numbers');
INSERT INTO software(name, category, method, info) VALUES ('424389933', 'multimedia', 'mas', 'final cut pro');
INSERT INTO software(name, category, method, info) VALUES ('424390742', 'multimedia', 'mas', 'compressor');
INSERT INTO software(name, category, method, info) VALUES ('425264550', 'core', 'mas', 'blackmagic disk speed test');
INSERT INTO software(name, category, method, info) VALUES ('425424353', 'core', 'mas', 'the unarchiver');
INSERT INTO software(name, category, method, info) VALUES ('430255202', 'core', 'mas', 'mactracker');
INSERT INTO software(name, category, method, info) VALUES ('434290957', 'multimedia', 'mas', 'motion');
INSERT INTO software(name, category, method, info) VALUES ('497799835', 'programming', 'mas', 'Xcode');
INSERT INTO software(name, category, method, info) VALUES ('572280828', 'core', 'mas', 'MacFamilyTree');
INSERT INTO software(name, category, method, info) VALUES ('634148309', 'multimedia', 'mas', 'logic pro x');
INSERT INTO software(name, category, method, info) VALUES ('634159523', 'multimedia', 'mas', 'main stage');
INSERT INTO software(name, category, method, info) VALUES ('715768417', 'core', 'mas', 'Microsoft Remote Desktop');
INSERT INTO software(name, category, method, info) VALUES ('801463932', 'games', 'mas', 'stockfish');
INSERT INTO software(name, category, method, info) VALUES ('824183456', 'multimedia', 'mas', 'affinity photo');
