## RubyGems

The gem is available here [VisualArrayGem](https://rubygems.org/gems/visual_array)

# VisualArray
## Description

**VisualArray** is a Ruby gem that displays arrays in a structured, visually appealing tabular format. It supports **1D, 2D, and multi-dimensional arrays** with options for customizing text **color**.

## Installation

Add this line to your application's Gemfile:

```bash
bundle add visual_array
```

Or install it manually:

```bash
gem install visual_array
```

## Usage

### Basic Example

```ruby
require 'visual_array'

VisualArray.display([1, 2, 3, 4])
```

**Output:**
```
+---+---+---+---+
| 1 | 2 | 3 | 4 |
+---+---+---+---+
```

### 2D Array Example

```ruby
VisualArray.display([
  [1, 2],
  [3, 4]
])
```

**Output:**
```
+-----+-----+
|  1  |  2  |
|  3  |  4  |
+-----+-----+
```

### Multi-Dimensional Array Example

```ruby
VisualArray.display([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])
```

**Output:**
```
Dimension 1, Index 0:
+-----+-----+
|  1  |  2  |
|  3  |  4  |
+-----+-----+

Dimension 1, Index 1:
+-----+-----+
|  5  |  6  |
|  7  |  8  |
+-----+-----+
```

### Customizing Color

You can pass optional `color` parameter:

```ruby
VisualArray.display(
  [[[1, 2], [3, 4]], [[5, 6], [7, 8]]],
  color: 'blue'
)
```

## Development

After checking out the repo, run:

```bash
bin/setup
```

to install dependencies. Use `bin/console` for an interactive session.

To install this gem locally:

```bash
bundle exec rake install
```

To release a new version:

1. Update the version in `version.rb`.
2. Run:

```bash
bundle exec rake release
```

This will create a git tag, push commits, and publish the gem to [RubyGems](https://rubygems.org/gems/visual_array).

## Contributing

Bug reports and pull requests are welcome at [GitHub](https://github.com/chandu89/visual_array).

## License

This project is available under the [MIT License](LICENSE.txt).
