# open-wrapper

macOS' `open`, extended with shortcuts: a name which opens one or more things at once.

## Usage

A shortcut, named as the sole argument:

```shell
open-wrapper docs
```

Whatever the shortcut holds is opened.

Anything else, such as `open-wrapper -a 'System Settings'` or `open-wrapper .`, is passed to `open` unchanged, so as it can stand in for `open`. It is meant to be aliased to it:

```shell
alias open='open-wrapper'
```

## Configuration

Shortcuts are read from `~/.config/open-wrapper/config.rb`, a Ruby file whose last expression is a Hash of each shortcut's name to what it opens. That is either a String, or a Proc returning a String or an Array of them, each of which is opened in turn:

```ruby
{
  'docs' => 'https://docs.ruby-lang.org',
  'notes' => "-a TextEdit #{File.expand_path('~/notes.txt')}",
  'morning' => Proc.new{['https://news.ycombinator.com', 'https://lobste.rs']},
  'pr' => Proc.new{`gh pr view --json url --jq .url`.strip},
}
```

## Notes

A shortcut's string is appended to `open` and run through the shell, so as it may carry options and quoting of its own, such as `-a 'Google Chrome'`. Arguments which aren't a shortcut go to `open` directly, without a shell.

The config is Ruby and is evaluated as it stands, each time open-wrapper runs. Anything wanted only when its shortcut is used goes in a Proc.

## License

MIT
