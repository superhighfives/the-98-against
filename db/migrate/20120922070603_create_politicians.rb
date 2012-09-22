class CreatePoliticians < ActiveRecord::Migration
  def up
    create_table :politicians do |t|
      t.string :pid
      t.string :title
      t.string :party
      t.string :position
      t.string :electorate
      t.string :twitter
      t.string :facebook
      t.string :phone
      t.string :email
      t.string :aph
    end

    # Politician.create(
    #   :title => "Tony Abbott",
    #   :party => "Liberal Party of Australia",
    #   :position => "Leader of the Opposition",
    #   :electorate => "Warringah, NSW",
    #   :twitter => "http://twitter.com/TonyAbbottMHR",
    #   :facebook => "http://www.facebook.com/TonyAbbottMP",
    #   :phone => "(02) 9977 6411",
    #   :email => "Tony.Abbott.MP@aph.gov.au",
    #   :aph => "http://www.aph.gov.au/Senators_and_Members/Parliamentarian?MPID=EZ5"
    # )
  end

  def down
    drop_table :politicians
  end
end