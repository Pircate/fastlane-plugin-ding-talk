# ding_talk plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-ding_talk)

## Getting Started

This project is a [_fastlane_](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-ding_talk`, add it to your project by running:

```bash
fastlane add_plugin ding_talk
```

## About ding_talk

Send the packaging information to the ding talk.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

```ruby
  ding_talk(
        api_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", # 蒲公英用户api_key
        app_key: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", # 蒲公英应用app_key
        access_token: "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", # 钉钉机器人access_token
        markdown_desc: "### App安装二维码") # 二维码描述(markdown格式)
```

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://docs.fastlane.tools/plugins/plugins-troubleshooting/) guide.

## Using _fastlane_ Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://docs.fastlane.tools/plugins/create-plugin/).

## About _fastlane_

_fastlane_ is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).
