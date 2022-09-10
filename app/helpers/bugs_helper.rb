module BugsHelper
    def solve_bug_button(bug)
        link_to "#{bug.status? ? 'Reopen' : 'Resolve'} Bug", solve_bug_path,
            method: :put,
            remote: true,
            class: solve_bug_button_class(bug),
            id: 'solve_button'
    end

private
    def solve_bug_button_class(bug)
        if bug.status?
            'btn btn-danger' # red button
        else 
            'btn btn-warning' # orange button
        end
    end
end
