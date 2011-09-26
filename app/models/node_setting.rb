class NodeSetting < ActiveRecord::Base
  belongs_to :node
  acts_as_nested_set

  validates_presence_of :key, :value_klass
  validates_presence_of :value, :unless => proc { |ns| ns.read_attribute(:value) == 'false' } # Regular validation fails for false
  validates_uniqueness_of :key, :scope => :node_id

  TypecastableClasses = %w(TrueClass FalseClass Symbol String DateTime Float Fixnum Bignum Date Time)
  PerPageOff = 10000

  def value=(_value)
    self.value_klass = _value.class.to_s
    if TypecastableClasses.include?(self.value_klass)
      write_attribute(:value, _value.to_s)
    else
      write_attribute(:value, Marshal.dump(_value))
    end
  end

  def value
    _value = read_attribute(:value)
    case self.value_klass
    when 'String'
      _value 
    when 'Symbol'
      _value.delete(':').to_sym
    when 'DateTime'
      Time.parse(_value)
    when 'Time'
      Time.parse(_value)
    when 'Date'
      Time.parse(_value)
    when 'Float'
      _value.to_f
    when 'Fixnum'
      _value.to_i
    when 'Bignum'
      _value.to_i
    when 'TrueClass'
      _value == 'true'
    when 'FalseClass'
      _value == 'true'
    else
      Marshal.load(_value)
    end
  end
end
