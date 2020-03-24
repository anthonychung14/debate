class MovePrimaryKeys < ActiveRecord::Migration[6.0]
  def change

    # tables = [
    #   "content_makers",
    #   "creators",
    #   "excerpts",
    #   "source_contents",
    #   "source_cards",
    # ]

    # tables.each do |table|
    #   remove_column table, :id
    #   rename_column table, :uuid, :id
    #   execute "ALTER TABLE #{table} ADD PRIMARY KEY (id);"
    # end

    # id_to_uuid("content_makers", "authors", "authors")
    # id_to_uuid("authors", "content_makers", "authors")
  end

  def id_to_uuid(table_name, relation_name, relation_class)
    # http://www.madebyloren.com/posts/migrating-to-uuids-as-primary-keys
    #   table_name = table_name.to_sym
    #   klass = table_name.to_s.classify.constantize
    #   relation_klass = relation_class.to_s.classify.constantize
    #   foreign_key = "#{relation_name}_id".to_sym
    #   new_foreign_key = "#{relation_name}_uuid".to_sym

    #   add_column table_name, new_foreign_key, :uuid

    #   klass.where.not(foreign_key => nil).each do |record|
    #     if associated_record = relation_klass.find_by(id: record.send(foreign_key))
    #       record.update_column(new_foreign_key, associated_record.uuid)
    #     end
    #   end

    #   remove_column table_name, foreign_key
    #   rename_column table_name, new_foreign_key, foreign_key
    # end

    def change_tables
      enable_extension "uuid-ossp"

      tables = [
        "content_makers",
        "creators",
        "excerpts",
        "source_contents",
        "source_cards",
      ]

      tables.each do |table|
        add_column table, :uuid, :uuid, default: "uuid_generate_v4()", null: false
      end
    end
  end
end
