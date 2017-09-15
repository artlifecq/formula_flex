package com.rpgGame.app.ui.main.activityBar.item
{
	import com.rpgGame.app.manager.goods.SevendayManager;

	/**
	 * 
	 * @author YT
	 * 创建时间：2017-9-15 下午4:40:48
	 */
	public class ActivitySevendayButton extends ActivityPointNumButton
	{
		public function ActivitySevendayButton()
		{
			super();
		}
		override public function canOpen():Boolean
		{
			if(!_openState){
				return false;
			}
			if(SevendayManager.loginDay==0)
				return false;
			if(SevendayManager.getRewardNum(2)==SevendayManager.rewardSuccess.length)
				return false;
			return true;
		}
		
	}
}