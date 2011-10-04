class FormTemplate < ActiveRecord::Base

  def filled_forms(options={})
    FilledForm.all({:conditions => {:form_template_id => self.id}}.merge(options))
  end

  def self.get_user_filled_forms(user)
    # the map function in javascript
    map = <<-EOF
      function() {
        emit(this.form_template_id, {filled_forms: [{id: this._id, updated_at: this.updated_at}]})
      }
    EOF

    # the reduce function in javascript
    reduce = <<-EOF
      function(key, values) {
        var arr = new Array();
        values.forEach(function(doc) {
          arr = arr.concat(doc.filled_forms);
        });
        return {filled_forms: arr};
      };
    EOF

    opts = {}
    hash = opts.merge({
                          :out => {:inline => true},
                          :raw => true,
                          :query => {:user_id => user.id.to_i}
                      })

    collection = FilledForm.collection.mapreduce(map, reduce, hash)

    return collection['results'].inject([]) do |overall_res, elem|
      template = FormTemplate.select("name, id").where("id = ?", elem['_id'].to_i).first
      res = {
          :form_template => {:name => template.name, :id => template.id},
          :filled_forms => elem['value']['filled_forms']
      }
      overall_res << res
    end
  end

end
