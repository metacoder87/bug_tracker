require 'test_helper'

class IssuesHelperTest < ActionView::TestCase

    test "button should have the correct markup" do
        bug = bugs(:one)
        assert_dom_equal %{<a class="btn btn-warning"
                                id="solve_button"
                                data-remote="true"
                                rel="nofollow"
                                data-method="put"
                                href="/bugs/#{bug.id}/solve">Solve Bug</a>},
                            solve_bug_button(bug)
    end

    test "button for open bug should say 'Solve'" do
        bug = bug(:one)
        assert_match /Solve Bug/, solve_bug_button(bug)
    end

    test "button for resolved issue should say 'Revive'" do
        bug = bugs(:two)
        bug.update_attribute(:status, true)
        assert_match /Revive Bug/, solve_bug_button(bug)
    end

end