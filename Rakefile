require 'nanoc3/tasks'
require 'fileutils'
require 'nanoc3/helpers/blogging'

# require 'lib/helpers'

namespace :create do

  desc "Creates a new article"
  task :article do
    require 'active_support/core_ext'
    require 'active_support/multibyte'
    @ymd = Time.now.to_s.split(' ')[0]

    if ENV['leap']
      # set the post to be leap days in the future
      @ymd = @ymd + ENV['leap'] * 3600 * 24
      @created_at = (Time.now + ENV['leap'] * 3600 * 24).to_s
    else
       @created_at = Time.now.to_s
    end

    if !ENV['title']
      $stderr.puts "\t[error] Missing title argument.\n\tusage: rake create:article title='article title'"
      exit 1
    end

    title = ENV['title'].capitalize
    path, filename, full_path = calc_path(title)

    if File.exists?(full_path)
      $stderr.puts "\t[error] Exists #{full_path}"
      exit 1
    end

    template = <<TEMPLATE
---
created_at: #{@created_at}
excerpt: 
kind: article
publish: true
lang: [it]
tags: [misc]
title: "#{title.capitalize}"
place: Gessate
---

TODO: Add content to `#{full_path}.`
TEMPLATE

    FileUtils.mkdir_p(path) if !File.exists?(path)
    File.open(full_path, 'w') { |f| f.write(template) }
    $stdout.puts "\t[ok] Edit #{full_path}"
  end


  desc "Creates a new startup"
  task :startup do
    $KCODE = 'UTF8'
    require 'active_support/core_ext'
    require 'active_support/multibyte'
    @ymd = Time.now.to_s(:db).split(' ')[0]
    if !ENV['name']
      $stderr.puts "\t[error] Missing name argument.\n\tusage: rake create:startup name='startup name'"
      exit 1
    end

    name = ENV['name'].capitalize
    path, filename, full_path = calc_path(name, true)

    if File.exists?(full_path)
      $stderr.puts "\t[error] Exists #{full_path}"
      exit 1
    end

    template = <<TEMPLATE
---
excerpt: 
kind: startup
publish: true
lang: [it]
tags: [misc]
name: "#{name.capitalize}"
url: 
place: Gessate
---

TODO: Add content to `#{full_path}.`
TEMPLATE

    FileUtils.mkdir_p(path) if !File.exists?(path)
    File.open(full_path, 'w') { |f| f.write(template) }
    $stdout.puts "\t[ok] Edit #{full_path}"
  end



  def calc_path(title, startup=false)
    year, month_day = @ymd.split('-', 2)
    if ! startup
      path = "content/" + year + "/" 
      filename = month_day + "-" + title.parameterize('_') + ".haml"
    else 
      path= "content/startup/"
      filename = title.parameterize('_')+".haml"
    end
    [path, filename, path + filename]
  end
end


