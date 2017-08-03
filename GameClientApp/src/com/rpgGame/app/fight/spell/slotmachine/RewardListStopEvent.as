package  com.rpgGame.app.fight.spell.slotmachine
{
	import away3d.events.Event;
	
	public class RewardListStopEvent extends Event
	{
		public var rewardItem:RewardImage = null;
		public function RewardListStopEvent(type:String, reward:RewardImage = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			rewardItem = reward;
		}
	}
}