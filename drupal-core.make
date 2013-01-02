; Core ========================================================================

api = 2
core = 7.x

projects[drupal][type] = core
projects[drupal][version] = 7.18
projects[drupal][patch][] = "https://raw.github.com/TimHolt/d7-make/master/local/modules/custom/blockcache_alter/blockcache_alter_block.patch"
