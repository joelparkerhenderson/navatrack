# Skill

<https://github.com/contactopensource/contactopensource/tree/master/api/skill>

Run:

```sh
mix ash.gen.resource Navatrack.Works.Skill \
  --conflicts replace \
  --default-actions create,read,update,destroy \
  --extend postgres \
  --uuid-primary-key id \
  --attribute title:string \
  --attribute status:string \
  --attribute tags:string:array \
  \
  --attribute summary_as_markdown:string \
  --attribute description_as_markdown:string \
  \
  --attribute avatar_400x400_url:string \
  --attribute avatar_400x400_alt:string \
  \
  --attribute main_image_1080x1080_url:string \
  --attribute main_image_1080x1080_alt:string \
  \
  --attribute main_image_1920x1080_url:string \
  --attribute main_image_1920x1080_alt:string \
  \
  --attribute main_image_1080x1920_url:string \
  --attribute main_image_1080x1920_alt:string \

mix ash.codegen create_skills
mix ash.migrate
```
