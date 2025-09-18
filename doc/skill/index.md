# Skill

We create a typical skill resource.

This is uses many flat fields i.e. not relations, because for this project we
prefer the simplest maintainability and leanest lookups.

Run:

```sh
mix ash.gen.resource Navatrack.Works.Skill \
  --conflicts replace \
  --default-actions create,read,update,destroy \
  --extend postgres \
  --uuid-primary-key id \
  --timestamps \
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
  --attribute image_1080x1080_url:string \
  --attribute image_1080x1080_alt:string \
  \
  --attribute image_1920x1080_url:string \
  --attribute image_1920x1080_alt:string \
  \
  --attribute image_1080x1920_url:string \
  --attribute image_1080x1920_alt:string \
```

Run:

```sh
mix ash.codegen create_skills
mix ash.migrate
```
