module FormProcessing
  module NokogiriIO
    class << self
      def parse thing
        # ParseOptions must be -1, otherwise it would wrap it with Doctype tags
        Nokogiri::HTML.parse(thing) #, nil, nil, -1)
      end

      # remove every tag wrapping <body> including the <body> itself
      # normally it would strip <Doctype><html><body> tags leaving body children only
      def extract_body_internals doc
        doc.xpath('//body/*')
      end
    end
  end

  def prefill_ror_form html, fields
    doc = NokogiriIO.parse html

    doc.xpath('//input').each_with_index do |node, i|
      if node['type'] == "text"
        node['value'] = fields[node['name'].match(/\Afilled_form\[([a-z]+\d+)\]\Z/)[1]]
      elsif node['type'] == "radio"
        val = fields[node['name'].match(/\Afilled_form\[([a-z]+\d+)\]\Z/)[1]]
        if val
          node['checked'] = ''
        else
          # not selected
          node.remove_attribute('checked')
        end
      elsif node['type'] == "checkbox"
        val = fields[node['name'].match(/\Afilled_form\[([a-z]+\d+)\]\Z/)[1]]
        if val
          node['checked'] = ''
        else
          # not checked
          node.remove_attribute('checked')
        end
      end
    end
    doc.xpath('//textarea').each_with_index do |node, i|
      node.content = fields[node['name'].match(/\Afilled_form\[([a-z]+\d+)\]\Z/)[1]]
    end
    doc.xpath('//select/option[@selected="selected"]').each_with_index do |node, i|
      val = fields[node['name'].match(/\Afilled_form\[([a-z]+\d+)\]\Z/)[1]]
      if val
        node['value'] = val
      else
        # do nothing - not checked
      end
    end

    NokogiriIO.extract_body_internals(doc).to_s
  end

  def raw_form_to_ror_form html
    doc = NokogiriIO.parse html

    doc.xpath('//input').each_with_index do |node, i|
      node['id'] = "filled_form_input#{i}"
      node['name'] = "filled_form[input#{i}]"
    end
    doc.xpath('//textarea').each_with_index do |node, i|
      node['id'] = "filled_form_textarea#{i}"
      node['name'] = "filled_form[textarea#{i}]"
    end
    doc.xpath('//select/option[@selected="selected"]').each_with_index do |node, i|
      node['id'] = "filled_form_select#{i}"
      node['name'] = "filled_form[select#{i}]"
    end

    notes_textarea = <<-EOF
    <div class="field">
        <label for="filled_form_notes09287645">Notes (here you can put any additional information) :</label><br />
        <textarea cols="50" id="filled_form_notes09287645" name="filled_form[notes09287645]" rows="10"></textarea>
    </div>
    EOF

    NokogiriIO.extract_body_internals(doc).to_s + notes_textarea
  end

end