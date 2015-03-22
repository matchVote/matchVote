class DirectoryController < ApplicationController
  def index
    @reps = Representative.all
    @sort_list = [
      ["Sort by Name Recognition", "populatity"],
      ["Sort Alphabetically", "alphabetically"],
      ["Sort by Most Similar Views", "similarity"],
      ["Sort by Least Similar Views", "difference"],
      ["Sort by Seniority", "seniority"]

    ]

    @filter_count = Representative.count
  end
end
