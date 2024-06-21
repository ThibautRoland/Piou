# spec/traduction_spec.rb

require 'rspec'
require_relative '../../level_1/traduction' # Adjust the path as necessary

RSpec.describe Translation do
  describe '.encode' do
    it 'should translate single letter' do
      expect(Translation.encode('A')).to eq('piou')
    end

    it 'should translate single word' do
      expect(Translation.encode('ABC')).to eq('piou ioup poup')
    end

    it 'should translate single word with unknown character' do
      expect(Translation.encode('A@C')).to eq('piou # poup')
    end

    it 'should translate single sentence' do
      expect(Translation.encode('goku is great!')).to eq('ouip uiui oupi piop  ppou piuu  ouip iupi ioui piou piup iipu')
    end

    it 'should translate test technique sentence' do
      expect(Translation.encode('coucou, je voudrais devenir astraunaute! comment faire ?'))
      .to eq('poup uiui piop poup uiui piop iupo  ipip ioui  ipou uiui piop iiou iupi piou ppou piuu  iiou ioui ipou ioui piui ppou iupi  piou piuu piup iupi piou piop piui piou piop piup ioui iipu  poup uiui piiu piiu ioui piui piup  pipp piou ppou iupi ioui  ppip')
    end
  end

  describe '.decode' do
    it 'should reverse translate single piou' do
      expect(Translation.decode('piou')).to eq('a')
    end

    it 'should return #' do
      expect(Translation.decode('gok')).to eq('#')
    end

    it 'should return #' do
      expect(Translation.decode('gokuz')).to eq('#')
    end

    it 'should reverse translate test technique piou sentence' do
      expect(Translation.decode('poup uiui piop poup uiui piop iupo  ipip ioui  ipou uiui piop iiou iupi piou ppou piuu  iiou ioui ipou ioui piui ppou iupi  piou piuu piup iupi piou piop piui piou piop piup ioui iipu  poup uiui piiu piiu ioui piui piup  pipp piou ppou iupi ioui  ppip'))
      .to eq('coucou, je voudrais devenir astraunaute! comment faire ?')
    end
  end
end
