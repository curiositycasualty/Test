include_recipe "java"

deploy_dir = "#{Chef::Config[:file_cache_path]}/testapp"

git deploy_dir do
  repository "https://github.com/curiositycasualty/Test.git"
  revision "f9a86fdf54d4ac49d3492fedffe397e45ec5bcdc"
  action :sync
end

execute 'kill and execute' do
  command 'kill $(pgrep -f "Test.jar"); java -jar #{deploy_dir}/Test.jar&'
end
