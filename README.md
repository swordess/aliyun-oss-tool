# Aliyun OSS Tool

[Aliyun OSS](https://www.aliyun.com/product/oss) related daily tasks(e.g., DevOps) that will save your time!

The princinple of this project are 'make them work at first, then go better'. So you might feel unconvient for some cases, or simple stupid mistakes here. I think it's okay, just leave issues. The tools are already used in our daily life, though the usage rate is a little bit low.

## Why

Simply make OSS releated daily works easy, coding monkeys needs a nice day!

## Limitations

The shell scripts only works on mac as I personally work on it. :(

## Preparation

Add your OSS configuration settings before running tools in this project.

### Mac users

1. Add `ossutilmac64` (at this repo's root) to your path and make it executable. It will be used by the shell tools.
2. Run `ossutilmac64 config` and provide information according to [ossutil config](https://help.aliyun.com/document_detail/120072.html). The default conf will be put at `~/.ossutilconfig`, but I recommend using the `-c` option to customize that, e.g., `-c ~/.aliyun-oss-tool/your-project-name.config`. Your might work with multiple projects, so it would be more clear to separate the configration from the ossutil's default conf .

### Other OS users

TODO

## Shell Tools

### Upload static site to OSS

Targeting uploading an `npm` powered frontend project.

Before running, you need to provide a configuration file(shell in fact) by copying from [example.config](./example.config). When its done, run:

```bash
cd where_you_cloned_this_repo
./upload_site.sh your_project_name.config
```

The script does these steps:

1. `source` the configuration file and check required configuration items
2. update your git repo via `git pull`
3. build your repo via `npm install && npm run build:prod`
4. upload the whole `{repo}/dist` dir to `$OSS_BUCKET_PATH`

# License

MIT, as I like it.
