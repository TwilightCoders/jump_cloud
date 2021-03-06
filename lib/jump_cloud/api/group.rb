module JumpCloud
  class Group < V2::Model

    def add(item)
      path = "#{self.request_path}/members"
      self.class.post_raw(path, {
        op: "add",
        type: item.class.name.demodulize.downcase,
        id: item.id
      })
    end
  end
end
