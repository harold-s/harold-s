Fixes openid_fix plugin for Redmine 3 (Rails 4.2)
Issue opened on http://projects.andriylesyuk.com/issues/2362

This fix is based on 0.20 version of opendid_fix.


For those who just want a quick fix, download the patch somewhere : [patch_openid_fix_for_redmine3].
[patch_openid_fix_for_redmine3]:patch_openid_fix_for_redmine3
Go in your openid_fix dir (redmine/plugins/openid_fix ) and run :

```shell
patch -p1 < /path_to_patch/patch_openid_fix_for_redmine3
```

Files :
- openid_fix_original is a copy of the original 0.20 version of opendid_fix
- openid_fix_original_fixed is the corrected version
- patch_openid_fix_for_redmine3 is the generated patch from diff betwteen the two versions

Here are the fixes :
- Use of .order instead of all(:order)
- ActiveRecord::Relation instead of [] which is more standard
- validates_format_of doesn't accept a REGEX starting whith ^. Replace with \A (start of line)
- Scopes must be turned into lambdas
- In route.rb match needs to specify http (:get and :post)
