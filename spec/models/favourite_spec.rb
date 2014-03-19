require 'spec_helper'

describe Favourite do
  
  subject(:favourite) { build(:favourite) }

  specify { expect(favourite).to respond_to(:favourable_type) }
  specify { expect(favourite).to respond_to(:favourable_type=) }
  specify { expect(favourite).to respond_to(:favourable_id) }
  specify { expect(favourite).to respond_to(:favourable_id=) }
  specify { expect(favourite).to respond_to(:favourable) }
  specify { expect(favourite).to respond_to(:favourable=) }

end
