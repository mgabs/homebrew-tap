# frozen_string_literal: true

require "minitest/autorun"
require "open3"

class TapTest < Minitest::Test
  ROOT_DIR = File.expand_path("..", __dir__)
  FORMULA_DIR = File.join(ROOT_DIR, "Formula")
  CASKS_DIR = File.join(ROOT_DIR, "Casks")
  README_PATH = File.join(ROOT_DIR, "README.md")

  HEX64_REGEX = /\A[a-f0-9]{64}\z/i
  URL_REGEX = %r{\Ahttps://[^\s"]+\z}

  def test_ruby_syntax
    rb_files = Dir.glob(File.join(ROOT_DIR, "{Formula,Casks}/*.rb"))
    refute_empty rb_files, "No formula or cask files found"

    rb_files.each do |file|
      stdout, stderr, status = Open3.capture3("ruby", "-c", file)
      assert status.success?, "Syntax error in #{file}:\n#{stderr}\n#{stdout}"
    end
  end

  def test_formulae_structure
    Dir.glob(File.join(FORMULA_DIR, "*.rb")).each do |file|
      content = File.read(file)
      rel_path = file.sub("#{ROOT_DIR}/", "")

      assert_match(/class\s+\w+\s*<\s*Formula/, content, "#{rel_path} must define a class inheriting from Formula")
      assert_match(/^\s*desc\s+"[^"]+"/, content, "#{rel_path} must have a desc")
      assert_match(/^\s*homepage\s+"#{URL_REGEX.source[2..-3]}"/, content, "#{rel_path} must have a valid HTTPS homepage")
      assert_match(/^\s*version\s+"[^"]+"/, content, "#{rel_path} must specify version")
      assert_match(/^\s*license\s+"[^"]+"/, content, "#{rel_path} must specify license")
      assert_match(/def install/, content, "#{rel_path} must have an install block")
      assert_match(/test do/, content, "#{rel_path} must have a test block")

      # Validate sha256 checksums
      content.scan(/sha256\s+"([^"]+)"/).flatten.each do |sha|
        assert_match HEX64_REGEX, sha, "Invalid sha256 in #{rel_path}: #{sha}"
      end

      # Validate URLs
      content.scan(/url\s+"([^"]+)"/).flatten.each do |url|
        assert_match URL_REGEX, url, "Invalid URL in #{rel_path}: #{url}"
      end
    end
  end

  def test_casks_structure
    Dir.glob(File.join(CASKS_DIR, "*.rb")).each do |file|
      content = File.read(file)
      rel_path = file.sub("#{ROOT_DIR}/", "")
      cask_name = File.basename(file, ".rb")

      assert_match(/^cask\s+"#{cask_name}"\s+do/, content, "#{rel_path} cask name must match filename '#{cask_name}'")
      assert_match(/^\s*version\s+"[^"]+"/, content, "#{rel_path} must specify version")
      assert_match(/^\s*name\s+"[^"]+"/, content, "#{rel_path} must specify name")
      assert_match(/^\s*desc\s+"[^"]+"/, content, "#{rel_path} must specify desc")
      assert_match(/^\s*homepage\s+"#{URL_REGEX.source[2..-3]}"/, content, "#{rel_path} must have a valid HTTPS homepage")
      assert_match(/^\s*(app|binary)\s+/, content, "#{rel_path} must declare an app or binary artifact")

      # Prevent deprecated depends_on macos syntax
      refute_match(/depends_on\s+macos:\s*">=/, content, "#{rel_path} must not use deprecated string comparison '>= :symbol' in depends_on macos")
      refute_match(/depends_on\s+macos:\s*":/, content, "#{rel_path} must not use string symbol format in depends_on macos")

      if content =~ /depends_on\s+macos:\s*(\S+)/
        target = Regexp.last_match(1)
        assert_match(/^:[a-z_]+$/, target, "#{rel_path} depends_on macos must use standard symbol like :ventura, got #{target}")
      end

      # Validate sha256 checksums (handles single sha256 or arch-keyed arm/intel sha256)
      shas = []
      if content =~ /sha256\s+(arm:\s+"[^"]+",\s+intel:\s+"[^"]+"|"[^"]+")/m
        sha_block = Regexp.last_match(1)
        shas = sha_block.scan(/"([a-f0-9]{64})"/i).flatten
      end
      refute_empty shas, "#{rel_path} must have valid sha256 entries"
      shas.each do |sha|
        assert_match HEX64_REGEX, sha, "Invalid sha256 in #{rel_path}: #{sha}"
      end

      # Validate zap stanza
      assert_match(/^\s*zap\s+trash:\s*\[/m, content, "#{rel_path} should define zap trash list")
    end
  end

  def test_readme_covers_all_entries
    readme = File.read(README_PATH)

    Dir.glob(File.join(FORMULA_DIR, "*.rb")).each do |file|
      name = File.basename(file, ".rb")
      assert_match(/#{name}/i, readme, "README.md missing reference to formula #{name}")
    end

    Dir.glob(File.join(CASKS_DIR, "*.rb")).each do |file|
      name = File.basename(file, ".rb")
      assert_match(/#{name}/i, readme, "README.md missing reference to cask #{name}")
    end
  end
end
