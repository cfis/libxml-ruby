# encoding: UTF-8
require 'xml'
require 'test/unit'

class EncodingTest < Test::Unit::TestCase

  def setup()
    @xml = <<-EOS
<?xml version='1.0' encoding='UTF-8'?>
<test>
  <ascii>Hello World!</ascii>
  <unicode>Franḉais</unicode>
</test>
EOS
    xp = XML::Parser.string(@xml, :encoding=>XML::Encoding::UTF_8)
    @doc = xp.parse
  end

  def teardown
    @doc = nil
  end

  def test_document_encoding_is_utf8
    assert_equal(@doc.encoding,XML::Encoding::UTF_8,"Document encoding should be UTF_8") 
  end

  def test_input_xml_is_utf8
    assert_equal(@xml.encoding.name,'UTF-8',"Input XML string encoding should be UTF-8")
    assert(@xml.valid_encoding?,"Input XML string encoding should be valid")
  end

  def test_parsed_unicode_element_is_utf8
    unicode_string = @doc.find('/test/unicode').find.first.content 
    assert_equal(unicode_string.encoding.name,'UTF-8',"Parsed 'unicode' element content should be UTF-8")
  end

end
