api = 2
core = 7.x

; Core ========================================================================

includes[] = drupal-core.make


; Contributed Modules ========================================================

projects[acquia_connector][subdir] = "contrib"
projects[acquia_connector][version] = "2.8"

projects[adaptive_image][subdir] = "contrib"
projects[adaptive_image][version] = "1.4"

projects[admin_menu][subdir] = "contrib"
projects[admin_menu][version] = "3.0-rc3"

projects[admin_views][subdir] = "contrib"
projects[admin_views][version] = "1.1"

projects[backup_migrate][subdir] = "contrib"
projects[backup_migrate][version] = "2.4"

projects[bean][subdir] = "contrib"
projects[bean][version] = "1.0-rc6"

projects[blockcache_alter][subdir] = "contrib"
projects[blockcache_alter][version] = "1.x-dev"

projects[block_class][subdir] = "contrib"
projects[block_class][version] = "1.2"

projects[boxes][subdir] = "contrib"
projects[boxes][version] = "1.0"

projects[bundle_copy][subdir] = "contrib"
projects[bundle_copy][version] = "1.1"

projects[calendar][subdir] = "contrib"
projects[calendar][version] = "3.4"

projects[cachetags][subdir] = "contrib"
projects[cachetags][version] = "1.0"

projects[chosen][subdir] = "contrib"
projects[chosen][version] = "1.0"

projects[coder][subdir] = "contrib"
projects[coder][version] = "1.2"

projects[colorbox][subdir] = "contrib"
projects[colorbox][version] = "2.0"

projects[content_access][subdir] = "contrib"
projects[content_access][version] = "1.2-beta1"

projects[content_complete][subdir] = "contrib"
projects[content_complete][version] = "1.4-beta2"

projects[context][subdir] = "contrib"
projects[context][version] = "3.0-beta5"

projects[context_blockcache_alter][subdir] = "contrib"
projects[context_blockcache_alter][version] = "1.x-dev"

projects[crumbs][subdir] = "contrib"
projects[crumbs][version] = "1.8"

projects[ctools][subdir] = "contrib"
projects[ctools][version] = "1.2"

projects[date][subdir] = "contrib"
projects[date][version] = "2.6"

projects[deploy][subdir] = "contrib"
projects[deploy][version] = "2.x-dev"

projects[devel][subdir] = "contrib"
projects[devel][version] = "1.3"

projects[domain][subdir] = "contrib"
projects[domain][version] = "3.6"

projects[draggableviews][subdir] = "contrib"
projects[draggableviews][version] = "2.0"

projects[ds][subdir] = "contrib"
projects[ds][version] = "2.0"

projects[entity][subdir] = "contrib"
projects[entity][version] = "1.0-rc3"

projects[entity_dependency][subdir] = "contrib"
projects[entity_dependency][version] = "1.0-alpha1"

projects[entityreference][subdir] = "contrib"
projects[entityreference][version] = "1.0"

projects[eva][subdir] = "contrib"
projects[eva][version] = "1.2"

projects[expire][subdir] = "contrib"
projects[expire][version] = "1.0-alpha3"

projects[fast_404][subdir] = "contrib"
projects[fast_404][version] = "1.3"

projects[features][subdir] = "contrib"
projects[features][version] = "2.0-beta1"

projects[feeds][subdir] = "contrib"
projects[feeds][version] = "2.0-alpha7"

projects[file_entity][subdir] = "contrib"
projects[file_entity][version] = "2.0-unstable7"

projects[field_group][subdir] = "contrib"
projects[field_group][version] = "1.1"

projects[fontyourface][subdir] = "contrib"
projects[fontyourface][version] = "2.6"

projects[form_builder][subdir] = "contrib"
projects[form_builder][version] = "1.3"

projects[globalredirect][subdir] = "contrib"
projects[globalredirect][version] = "1.5"

projects[job_scheduler][subdir] = "contrib"
projects[job_scheduler][version] = "2.0-alpha3"

projects[jquery_update][subdir] = "contrib"
projects[jquery_update][version] = "2.2"

projects[libraries][subdir] = "contrib"
projects[libraries][version] = "2.0"

projects[link][subdir] = "contrib"
projects[link][version] = "1.0"

projects[location][subdir] = "contrib"
projects[location][version] = "3.0-alpha1"

projects[logintoboggan][subdir] = "contrib"
projects[logintoboggan][version] = "1.3"

projects[menu_attributes][subdir] = "contrib"
projects[menu_attributes][version] = "1.0-rc2"

projects[metatag][subdir] = "contrib"
projects[metatag][version] = "1.0-beta4"

projects[mobile_tools][subdir] = "contrib"
projects[mobile_tools][version] = "2.0-unstable1"

projects[module_filter][subdir] = "contrib"
projects[module_filter][version] = "1.7"

projects[multistep][subdir] = "contrib"
projects[multistep][version] = "1.x-dev"

projects[oauth][subdir] = "contrib"
projects[oauth][version] = "3.0"

projects[omega_tools][subdir] = "contrib"
projects[omega_tools][version] = "3.0-rc4"

projects[options_element][subdir] = "contrib"
projects[options_element][version] = "1.8"

projects[page_title][subdir] = "contrib"
projects[page_title][version] = "2.7"

projects[panels][subdir] = "contrib"
projects[panels][version] = "3.3"

projects[pathauto][subdir] = "contrib"
projects[pathauto][version] = "1.2"

projects[pcp][subdir] = "contrib"
projects[pcp][version] = "1.3"

projects[profile2][subdir] = "contrib"
projects[profile2][version] = "1.2"

projects[purge][subdir] = "contrib"
projects[purge][version] = "1.5-rc1"

projects[registry_rebuild][subdir] = "contrib"
projects[registry_rebuild][version] = "1.8"

projects[revisioning][subdir] = "contrib"
projects[revisioning][version] = "1.4"

projects[rpx][subdir] = "contrib"
projects[rpx][version] = "2.2"

projects[rules][subdir] = "contrib"
projects[rules][version] = "2.2"
;See http://drupal.org/node/1792524 or http://drupal.org/node/1842012
projects[rules][patch][] = "http://drupal.org/files/rules.state_.inc-ajax-error.patch"

projects[services][subdir] = "contrib"
projects[services][version] = "3.3"

projects[services_client][subdir] = "contrib"
projects[services_client][version] = "1.x-dev"

projects[settings_audit_log][subdir] = "contrib"
projects[settings_audit_log][version] = "1.2"

projects[strongarm][subdir] = "contrib"
projects[strongarm][version] = "2.0"

projects[token][subdir] = "contrib"
projects[token][version] = "1.4"

projects[token_filter][subdir] = "contrib"
projects[token_filter][version] = "1.1"

projects[transliteration][subdir] = "contrib"
projects[transliteration][version] = "3.1"

projects[uuid][subdir] = "contrib"
projects[uuid][version] = "1.0-alpha3"
; See http://drupal.org/node/1428952
projects[uuid][patch][] = "http://drupal.org/files/uuid.token_.inc-undefined-replacements.patch"

projects[ux_elements][subdir] = "contrib"
projects[ux_elements][version] = "1.0-beta1"
; See http://drupal.org/node/1224568
projects[ux_elements][patch][] = "http://drupal.org/files/issues/1224568-ux_elements_redeclare.patch"

projects[variable][subdir] = "contrib"
projects[variable][version] = "2.1"

projects[views][subdir] = "contrib"
projects[views][version] = "3.5"

projects[views_accordion][subdir] = "contrib"
projects[views_accordion][version] = "1.0-rc2"

projects[views_bulk_operations][subdir] = "contrib"
projects[views_bulk_operations][version] = "3.1"

projects[views_content_cache][subdir] = "contrib"
projects[views_content_cache][version] = "3.0-alpha1"

projects[views_data_export][subdir] = "contrib"
projects[views_data_export][version] = "3.0-beta6"

projects[views_rules][subdir] = "contrib"
projects[views_rules][version] = "1.0"

projects[views_slideshow][subdir] = "contrib"
projects[views_slideshow][version] = "3.0"

projects[webform][subdir] = "contrib"
projects[webform][version] = "3.18"

projects[webform_alt_ui][subdir] = "contrib"
projects[webform_alt_ui][version] = "1.0-alpha5"

projects[workflow][subdir] = "contrib"
projects[workflow][version] = "1.0"
; See http://drupal.org/node/1418268
projects[workflow][patch][] = "http://drupal.org/files/workflow-1418268-9.patch"

; Themes =====================================================================

projects[omega][version] = "3.1"
projects[rubik][version] = "4.0-beta8"
projects[tao][version] = "3.0-beta4"
projects[zen][version] = "5.1"

; Libraries ==================================================================

libraries[spyc][download][type] = "get"
libraries[spyc][download][url] = "https://raw.github.com/mustangostang/spyc/master/Spyc.php"
libraries[spyc][destination] = "libraries"
libraries[spyc][copy][] = "*"
libraries[spyc][overwrite] = TRUE

