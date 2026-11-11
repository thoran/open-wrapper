# ~/.config/open-wrapper/config.rb

# The last expression is a Hash of each shortcut's name to what it opens.
# A String is appended to open and run through the shell, so as it may carry options and quoting of its own.
# A Proc is called only when its shortcut is used, and returns a String or an Array of them, each of which is opened in turn.

{
  # A URL.
  'docs' => 'https://docs.ruby-lang.org',

  # A file, in a named application.
  'hosts' => '-a TextEdit /etc/hosts',

  # Several at once.
  'morning' => Proc.new{['https://news.ycombinator.com', 'https://lobste.rs']},

  # Worked out when used: the current branch's pull request, and the repository.
  'pr' => Proc.new{`gh pr view --json url --jq .url`.strip},
  'repo' => Proc.new{`gh repo view --json url --jq .url`.strip},
}
