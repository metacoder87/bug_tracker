module BugsHelper
    
    def new_comment
        @comment ||= Comment.new(bug: @bug)
    end
    
    def solve_bug_button(bug)
        link_to "#{bug.status? ? 'Revive' : 'Solve'} Bug", solve_bug_path(bug),
            method: :put,
            remote: true,
            class: solve_bug_class(bug),
            id: 'solve_button'
    end

    def solve_bug_badge(bug)
        str = bug.status? ? 'Solved' : 'Open'
        content_tag :span, str,
            class: "badge badge-#{bug.status? ? 'danger' : 'success'}",
            id: 'bug_solved_status'
    end

private
    def solve_bug_class(bug)
        if bug.status?
            'btn btn-danger' # red button
        else 
            'btn btn-success' # green button
        end
    end
end
