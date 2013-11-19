module SortHbPlugin
  class SortTag < Liquid::Tag

    Syntax = /(#{::Liquid::VariableSignature}+)\s*in\s*(#{::Liquid::QuotedFragment})\s*by\s*(#{::Liquid::VariableSignature}+)\s*(reverse)?/


      def initialize(tag_name, markup, tokens, context)
        if markup =~ Syntax
          @target  = $1
          @content_type = $2
          @field_variable = $3
        else
          raise ::Liquid::SyntaxError.new("Syntax Error in 'sort_by_field' - Valid syntax: sort_by_field <var> in <content_type> by <variable with field>")
        end
        super
      end

    def render(context)
      collection = context[@content_type].to_a
      field = context[@field_variable]
      puts "Testing value #{field} from #{@field_variable}"
      first =  collection.first.instance_variable_get(:@_source)
      if field and first.respond_to?(field.to_sym)
        puts "Sorting on field #{field}"
        collection.sort! do |a,b|
          aEntry = a.instance_variable_get(:@_source)
          bEntry = b.instance_variable_get(:@_source)
          aEntry.send(field.to_sym) <=> bEntry.send(field.to_sym)
        end
      end
      context[@target.to_s] = collection
      ""
    end
  end
end
