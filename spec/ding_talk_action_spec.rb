describe Fastlane::Actions::DingTalkAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The ding_talk plugin is working!")

      Fastlane::Actions::DingTalkAction.run(nil)
    end
  end
end
