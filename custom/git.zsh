function gcbm() {
  git checkout -b $@ origin/$(git_main_branch)
}
