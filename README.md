Install fisher (fish package management) using the following command:

Install the packages:

```shell
sudo (dnf|apt) install $(cat .packagse)
```

if on rocky linux or red hat:

```shell
dnf install epel-release
```

```shell
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```
