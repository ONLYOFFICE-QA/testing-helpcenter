# frozen_string_literal: true

shared_examples_for 'help_center_search' do |type|
  it "[#{type}]Non-existing word return `No results matching your query could be found` and zero found results" do
    result_page = current_page.search('JustAFakeWord')
    expect(result_page.no_result_found_element).to be_present
    expect(result_page.search_result_count).to eq(0)
  end

  it "[#{type}]Search for existing method result several results" do
    search_string = 'TEST'
    result_page = current_page.search(search_string)
    expect(result_page.search_result_count).to be_positive
    expect(result_page.search_results.first.snippet_text).to include(search_string)
  end
end
