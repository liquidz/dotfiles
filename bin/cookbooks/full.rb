include_recipe 'default'

# vim の設定
link "#{home}/.vim" do
  to "#{install_dir}/.vim"
end

%W(
  .vim/backup
  .tags
).each do |dir|
  directory "#{home}/#{dir}"
end
