module SendgridWorkflow
  module Git
    class Ref
      branch = nil
      commit = nil
      pr = nil
    end
    class Repo
      organization = ''
      name = ''
      url = ''
      ssh_ref = ''
      def merge_pr(Git::Ref)
      end
    end
  end
end
