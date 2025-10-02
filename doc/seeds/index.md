# Seeds

We organize seeds into a directory `seeds` and multiple files.

For more about how to organize seeds:

<https://experimentingwithcode.com/organizing-phoenix-seeds/>

## Get some seeds from elsewhere

Clone:

```sh
git clone https://github.com/contactopensource/contactopensource-with-seeds
cd contactopensource-with-seeds
```

## Users

```sh
cat api/persons/index.tsv |
awk -F\t '{ print "Navatrack.Repo.insert!(%Navatrack.Accounts.User{id: \"" $1 "\", title: \"" $3 "\", email: \"" $4 "\", phone: \"" $9 "\", url: \"" $7 "\", linkedin_url: \"https://linkedin.com/in/" $2 "\", avatar_image_400x400_url: \"https://example.com/" $6 "\", note: \"" $11 "\" })" }' |
sed 's/{id: "\(........\)\(....\)\(....\)\(....\)\(............\)"/{id: "\1-\2-\3-\4-\5"/'
```

## Organizations

```sh
cat api/organizations/index.tsv |
awk -F\t '{ print "Navatrack.Repo.insert!(%Navatrack.Accounts.Organization{id: \"" $1 "\", title: \"" $3 "\", email: \"" $5 "\", phone: \"" $6 "\", postal: \"" $7 "\", url: \"https://example.com/" $2 "\", avatar_image_400x400_url: \"https://example.com/" $4 "\", linkedin_url: \"" $11 "\" })" }' |
sed 's/{id: "\(........\)\(....\)\(....\)\(....\)\(............\)"/{id: "\1-\2-\3-\4-\5"/' |
sed 's#linkedin_url: "https://www.linkedin.com/#linkedin_url: "https://linkedin.com/#'
```

## United Kingdom (UK) Government Digital And Data (GDAD) Profession Capability Framework (PCF)

Copy file `contactopensource/api/uk_gdad_pcf_skill/doc.md`

Search:

```regex-search
^## (.*)\n
```

Replace:

```regex-replace
"""
}
Navatrack.Repo.insert!(%Navatrack.Works.UkGdadPcfSkill{
  title: "$1",
  url: "https://ddat-capability-framework.service.gov.uk/skills#\L$1",
  description: """
```

Search:

```regex-search
url: "(.*) (.*)",
```

Replace:

```regex-replace
url: "(.*)-(.*)",
```

Repeat 6 times to change all spaces to dashes.

Search for skill level sections:

```regex-search
\n(\d)\. \w+\n\n
```

Replace:

```regex-replace
""",
level_$1: """
```

Search for roles that require this skill; each one is a markdown list item link:

```regex-search
^- \[(.*?)\]\((.*?)\)
```

Replace:

```regex-replace
<li><a href="$2">$1</a></li>
```
