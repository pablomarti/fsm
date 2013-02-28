module SystemCasesHelper

  def link_to_add_fields(name, f, association, partial_origin = "", locals = {})
  	partial_origin += partial_origin != "" ? "/" : ""
	new_object = f.object.send(association).klass.new
    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
  		locals.merge!({f: builder})
      	render :partial => partial_origin + association.to_s.singularize, locals: locals
    end

    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

end
