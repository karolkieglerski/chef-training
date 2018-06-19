#
# Cookbook:: weberver
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'apache2' do
  action :remove
end

include_recipe '::php'
include_recipe '::nginx'
include_recipe '::content'
