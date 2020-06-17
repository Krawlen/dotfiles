class DotfilesInstaller
  attr_reader :dotfiles_root, :backup_all, :skip_all, :overwrite_all

  def initialize(dotfiles_root)
    @dotfiles_root = dotfiles_root
  end

  def link_file(source, destination)
    directory, destination_file = File.split(destination)

    if File.exist?(directory) && !Dir.exist?(directory) # Check if directory is a file
      raise "Error: #{directory} is a file and it should be a directory"
    elsif !Dir.exist?(directory) # Directory does not exists, have to create it
      FileUtils.mkdir_p directory
    end

    # Check if file exists already
    if File.exist?(destination)
      duplicate_strategy = handle_duplicate(source, destination, destination_file)

      case duplicate_strategy
      when :overwrite
        FileUtils.remove_entry(destination)
        DotFileUtils.success "removed #{destination}"
      when :backup
        FileUtils.mv destination, "#{destination}.backup"
        DotFileUtils.success "moved #{destination} to #{destination}.backup"
      end
      if duplicate_strategy == :skip
        DotFileUtils.success "skipped #{source}"
        return
      end
    end
    FileUtils.ln_s(source, destination)
    DotFileUtils.success "linked #{source} to #{destination}"
  end

  def handle_duplicate(source, destination, destination_file)
    return :skip if File.readlink(destination) == source
    return :overwrite if overwrite_all
    return :skip if skip_all
    return :backup if backup_all
    DotFileUtils.info "File already exists: #{destination} #{destination_file},\n\
    what do you want to do?\n \
    [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
    input = STDIN.gets.strip
    case input
    when 'o'
      :overwrite
    when 'O'
      @overwrite_all = true
      :overwrite
    when 'b'
      :backup
    when 'B'
      @backup_all = true
      :backup
    when 's'
      'skip'
    when 'S'
      @skip_all = true
      :skip
    else
      request_input
    end
  end

  def perform
    DotFileUtils.info 'Installing Dotfiles'

    files = `find -H #{dotfiles_root} -maxdepth 7 -name '*.symlink'`.split("\n")
    files.each do |source|
      dst = "#{ENV['HOME']}#{source.gsub(dotfiles_root, '')}"
      dst = dst.gsub('.symlink', '')
      link_file(source, dst)
    end

    add_zshrc_common

  end

  def add_zshrc_common
    zshrc = "#{ENV["HOME"]}/.zshrc"
    FileUtils.touch(zshrc)
    if File.read(zshrc).include?('source $HOME/.zshrc-common')
      DotFileUtils.success 'skipped linking zshrc-common'
    else
      File.open("#{zshrc}.new", 'w') do |fo|
        fo.puts 'source $HOME/.zshrc-common'
        File.foreach(zshrc) do |li|
          fo.puts li
        end
      end
      File.rename(zshrc, "#{zshrc}.old")
      File.rename("#{zshrc}.new", zshrc)
      FileUtils.rm("#{zshrc}.old")
      DotFileUtils.success 'zshrc-common linked to zshrc'
    end
  end
end

class DotFileUtils
  def self.info(msg)
    print "  [ \033[00;34m..\033[0m ] #{msg}\n"
  end

  def self.success(msg)
    print "\r\033[2K  [ \033[00;32mOK\033[0m ] #{msg}\n"
  end

  def self.fail(msg)
    print "\r\033[2K  [\033[0;31mFAIL\033[0m] #{msg}\n"
  end
end

require 'fileutils'
begin
  DotfilesInstaller.new(ARGV[0]).perform
rescue StandardError => e
  puts "There was an error"
  puts e.message
  puts e.backtrace.inspect
end
