module ApplicationHelper
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_block", f: builder)
    end
    link_to(name, '#', class: "add_field btn-primary btn-xs", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def jstree_sub_items(item)
    if item.has_children?
      render "jstree_sub", children: item.children
    end
  end
end
