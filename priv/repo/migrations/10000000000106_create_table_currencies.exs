defmodule Navatrack.Repo.Migrations.CreateCurrencies do
  @moduledoc """
  Create table currencies.
  """

  use Ecto.Migration

  def up do
    execute """
    CREATE TABLE currencies (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      locale_code text not null,
      name text not null,
      code text not null CONSTRAINT currencies_code_check CHECK (code ~* '^[A-Z]+$' AND char_length(code) <= 4),
      number smallint not null CONSTRAINT currencies_number_check CHECK (number >=1 AND number <= 999),
      symbol text not null CONSTRAINT currencies_symbol_check CHECK (char_length(symbol) <= 4),
      position boolean not null
    )
    """

    execute """
    CREATE INDEX currencies_index_gto
      ON currencies
      USING GIN ((
        name
          || ' ' ||
        code
          || ' ' ||
        symbol
      ) gin_trgm_ops);
    """
    execute "CREATE INDEX currencies_locale_code_index ON currencies (locale_code);"
    execute "CREATE INDEX currencies_name_index ON currencies (name);"
    execute "CREATE INDEX currencies_name_index_tpo ON currencies (name text_pattern_ops);"
    execute "CREATE INDEX currencies_code_index ON currencies (code);"
    execute "CREATE INDEX currencies_number_index ON currencies (number);"
    execute "CREATE INDEX currencies_symbol_index ON currencies (symbol);"
  end

  def down do
    execute "DROP CONSTRAINT IF EXISTS currencies_code_check;"
    execute "DROP CONSTRAINT IF EXISTS currencies_symbol_check;"
    execute "DROP INDEX IF EXISTS currencies_index_gto"
    execute "DROP INDEX IF EXISTS currencies_locale_code_index;"
    execute "DROP INDEX IF EXISTS currencies_name_index;"
    execute "DROP INDEX IF EXISTS currencies_name_index_tpo"
    execute "DROP INDEX IF EXISTS currencies_code_index"
    execute "DROP INDEX IF EXISTS currencies_number_index"
    execute "DROP INDEX IF EXISTS currencies_symbol_index"
    execute "DROP TABLE IF EXISTS currencies;"
  end
end
