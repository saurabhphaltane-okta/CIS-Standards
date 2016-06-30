#
# Cookbook Name:: audit-cis
# Recipe:: default
#
# Author:: Joshua Timberman <joshua@chef.io>
# Copyright (c) 2015, Chef Software, Inc. <legal@chef.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#udit-cis/recipes/centos6-110
include_recipe 'audit-cis::centos6-110'

#Chef::Log.warn("#{node.name} includes #{cookbook_name}::#{recipe_name} in its run list")
#Chef::Log.warn('This recipe does nothing on its own, instead include one of the recipes')
#Chef::Log.warn("that checks the appropriate CIS Benchmark. See #{cookbook_name}'s README.md.")
