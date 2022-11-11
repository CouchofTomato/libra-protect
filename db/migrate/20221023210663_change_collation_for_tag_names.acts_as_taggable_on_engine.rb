# frozen_string_literal: true

# This migration comes from acts_as_taggable_on_engine (originally 5)
# This migration is added to circumvent issue #623 and have special characters
# work properly

#rubocop:disable Style/GuardClause
class ChangeCollationForTagNames < ActiveRecord::Migration[6.0]
  def up
    if ActsAsTaggableOn::Utils.using_mysql?
      execute("ALTER TABLE #{ActsAsTaggableOn.tags_table} MODIFY name varchar(255) CHARACTER SET utf8 COLLATE utf8_bin;")
    end
  end
end
#rubocop:enable Style/GuardClause
