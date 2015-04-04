# dotfiles

## setup

 * full setup
```
curl -L http://bit.ly/uochan_dotfile | bash
```
 * minimal setup
```
curl -L http://bit.ly/uochan_dotfile | env MODE=min bash
```

## test

```
git clone https://github.com/sstephenson/bats.git
env TEST_ROOT="$(pwd)/test" bats/bin/bats --tap test/suites
```
