class Rocnik < ActiveRecord::Base
  after_save :create_serie_kola

  def name
    "#{cislo}. ročník"
  end

  def create_serie_kola
    z = Serium.create(nazov: 'Zimná', rocnik: cislo)
    l = Serium.create(nazov: 'Letná', rocnik: cislo)
    (1..3).each do |c|
      Kolo.create(cislo: c, seria: 'Zimná', rocnik: cislo)
      Kolo.create(cislo: c, seria: 'Letná', rocnik: cislo)
    end
  end
end
