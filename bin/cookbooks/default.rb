home = ENV['HOME']
install_dir = "#{home}/src/github.com/liquidz/dotfiles"

git install_dir do
  repository 'https://github.com/liquidz/dotfiles.git'
end

# 必要なディレクトリを作成
%w(
  .lein
).each do |dir|
  directory "#{home}/#{dir}"
end

## dotfiles のシンボリックリンクを貼る
%w(
  .vimrc .tmux.conf
  .zshenv .zshrc .zshrc.antigen
  .ctags .gemrc .rubocop.yml
  .gitconfig.common .w3m .cheatrc
  .lein/profiles.clj
).each do |file|
  link "#{home}/#{file}" do
    to "#{install_dir}/#{file}"
  end
end

