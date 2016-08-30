
class Enumeration

  def self.init numeric_key
    @id             ||= 1
    @statuses       ||= {}
    @display_names  ||= {}
    @numeric_key    ||= numeric_key
  end

  def self.add(key, display_names = {}, numeric_key = false)
    self.init(numeric_key)
    key = sanatize_key(key)
    throw "Status #{key.to_s} already exists in this enumeration." if @statuses.has_key? key
    @statuses[key] = @id

    if display_names.empty?
      @display_names[key] = { :DEFAULT => key.to_s }
    else
      sanatized_hash = {}
      display_names.each{ |k,v| sanatized_hash[sanatize_key(k)] = v }
      sanatized_hash[:DEFAULT] = key.to_s unless sanatized_hash.has_key? :DEFAULT
      @display_names[key] = sanatized_hash
    end

    @id += 1
    true
  end

  def self.to_a(opts = {})
    options = { :use => :key }.merge(opts)
    a = []
    @statuses.each do |key, id|
      if options[:use] == :key
        a << self.display_name(key)
      elsif options[:use] == :val or options[:use] == :value
        a << self.find_key(key)
      elsif options[:use] == :both
        a << [self.find_key(key), self.description_for(key)]
      end
    end
    a
  end

  def self.get(key)
    self.const_get sanatize_key(key)
  end

  def self.find_key(value)
    key = sanatize_key value
    if @statuses.has_key? key
      key.to_s
    elsif value
      described_keys = @display_names.select {|k,v| v.values.include?(value) }
      if described_keys && !described_keys.empty? && !described_keys.first.empty?
        described_keys.first.first.to_s
      else
        partial_matches = @display_names.select {|k,v| v.values.any? {|part| part.downcase.include?(value.to_s.downcase)} }
        partial_matches.first.first.to_s if partial_matches && !partial_matches.empty? && !partial_matches.first.empty?
      end
    else
      nil
    end
  end

  def self.display_name(key, filter_key = nil)
    key = sanatize_key(key)
    if key.blank? || !@display_names[key]
      return key
    end

    if filter_key.nil? or filter_key == :DEFAULT
      val = @display_names[key][:DEFAULT].gsub('_', ' ').titleize
    else
      filter_key = sanatize_key filter_key
      val = @display_names[key][filter_key] || @display_names[key][:DEFAULT]
    end

    val
  end

  def self.description_for(key)
    self.display_name(key, :description)
  end

  def self.keys
    @statuses.keys.map{ |k| k.to_s }
  end

  def self.sanatize_key(key)
    return key if key.blank?
    key = @statuses.key(key.to_i) if !@numeric_key && key_is_id?(key)
    key.to_s.strip.gsub(/\s/, '_').upcase.to_sym
  end

  def self.key_is_id?(key)
    !(key.to_s =~ /^\d+/).nil?
  end

  private_class_method :key_is_id?
end
