# PHP Extension Reference

The purpose of this file is to keep a record of the relationship between installed APK packages and PHP Extensions that rely on them. Mainly, because I could forget later on, so I don't mess around looking for their individual requirements again and again.

### Relationship

| PHP Extension | Required System Package for Building  | Required System Package to Work   |
| ------------- | ------------------------------------- | --------------------------------- |
| `bcmath`      | N/A                                   | N/A                               |
| `curl`        | `curl-dev`                            | `libcurl`                         |
| `intl`        | `icu-dev`                             | `icu-libs`                        |
| `json`        | N/A                                   | N/A                               |
| `mbstring`    | N/A                                   | N/A                               |
| `pdo`         | N/A                                   | N/A                               |
| `pdo_mysql`   | N/A                                   | N/A                               |
| `pdo_pgsql`   | `postgresql-dev`                      | `postgresql-libs`                 |
| `pdo_sqlite`  | `sqlite-dev`                          | `sqlite-libs`?                    |
| `tokenizer`   | N/A                                   | N/A                               |
| `xml`         | `libxml2-dev`                         | N/A                               |
| `zip`         | `libzip-dev`                          | `libzip`                          |

> Packages marked with a `?` means that its currently unknown if they're truly required at execution time.