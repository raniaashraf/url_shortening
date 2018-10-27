class UrlShortening::Url < ActiveRecord::Base
  CHARSET = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  BASE = 62

  validates_presence_of   :long
  validates_uniqueness_of :long
  validates_uniqueness_of :short


  def self.get_short_url(long_url)
    uri = URI.parse(long_url)
    if uri.host && uri.path.present?
      url = find_or_create_by(long: long_url)
      unless url.short
        hash = encode(url.id)
        url.update(short: hash)
      end
      "#{uri.scheme}://#{uri.host}/#{url.short}"
    else
      raise "This Url cannot be shortened!, might be not correct url or too short to be shortened."
    end
  end

  def self.get_long_url(short_url)
    hash = get_path(short_url)
    if hash
      id = decode(hash)
      url = find_by_id(id)
      url.long if url
    end
  end

  private

  def self.encode(id)
    return CHARSET[0] if id == 0
    hash = ''
    while id > 0
      hash << CHARSET[id.modulo(BASE)]
      id /= BASE
    end
    hash.reverse
  end

  def self.decode(hash)
    id = 0
    hash.each_char { |c| id = id * BASE + CHARSET.index(c) }
    id
  end

  def self.get_path(url)
    uri = URI.parse(url)
    uri.path.split('/')[1]
  end

end