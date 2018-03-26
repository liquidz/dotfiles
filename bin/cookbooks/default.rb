# coding: utf-8
define :curl, path: nil, url: nil do # {{{
  execute "curl #{params[:name]}" do
    command <<-EOT
      curl -sfLo #{params[:path]} #{params[:url]}
    EOT
    not_if "test -e #{params[:path]}"
  end
end # }}}

define :dotfiles do
  home = params[:name]
  install_dir = "#{home}/src/github.com/liquidz/dotfiles"

  # git clone {{{

  git install_dir do
    repository 'https://github.com/liquidz/dotfiles.git'
  end

  # }}}
  # 必要なディレクトリを作成 {{{

  %w( .tags .lein .config/nvim ).each do |dir|
    directory "#{home}/#{dir}"
  end

  # }}}
  # dotfiles のシンボリックリンクを貼る {{{

  %w(
    .vimrc .tmux.conf
    .zshenv .zshrc .zshrc.antigen
    .ctags .gemrc .rubocop.yml
    .gitconfig.common .w3m .cheatrc
    .lein/profiles.clj .joker .xkb
  ).each do |file|
    link "#{home}/#{file}" do
      to "#{install_dir}/#{file}"
    end
  end

  # }}}
  # vim の設定 {{{

  link "#{home}/.vim" do
    to "#{install_dir}/.vim"
  end

  %w( .vim/backup .vim/memo .vim/autoload ).each do |dir|
    directory "#{home}/#{dir}"
  end

  curl 'vim-plug' do
    path "#{home}/.vim/autoload/plug.vim"
    url "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  end

  # }}}
  # neovim の設定 {{{

  link "#{home}/.config/nvim/init.vim" do
    to "#{install_dir}/.vimrc"
  end

  # }}}

  # spacemacs の設定
  link "#{home}/.spacemacs.d" do
    to "#{install_dir}/.spacemacs.d"
  end

  # zsh の設定 {{{

  link "#{home}/.zsh" do
    to "#{install_dir}/.zsh"
  end

  # git 補完
  {
    '_git'                => 'git-completion.zsh',
    'git-completion.bash' => 'git-completion.bash',
  }.each do |name, file|
    curl name do
      path "#{home}/.zsh/#{name}"
      url "https://raw.githubusercontent.com/git/git/master/contrib/completion/#{file}"
    end
  end

  # antigen
  git "#{home}/src/github.com/zsh-users/antigen" do
    repository 'https://github.com/zsh-users/antigen'
  end

  # }}}
  # git config {{{

  execute 'git config' do
    command <<-EOT
      git config --global include.path #{home}/.gitconfig.common
      git config --global user.name    liquidz
      git config --global user.email   liquidz.uo@gmail.com
    EOT
  end

  # }}}
end

dotfiles ENV['HOME']

# vim:foldlevel=0
