package  com.rpgGame.appModule.battle.dfdj
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.DRankWeekReward;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.zhanchang.paihangbang.PaiHangItem;

	
	public class D1v1WeekRewardCellExt extends SkinUI
	{
		private var _skin:PaiHangItem
		private var _gReward:RewardGroup;
		public function D1v1WeekRewardCellExt()
		{
			_skin=new PaiHangItem();
			super(_skin);
			_gReward=new RewardGroup(_skin.ico1,0,10,4);
			this.addEventListener(Event.REMOVED_FROM_STAGE,onRemoved);
		}
		
		private function onRemoved(eve:Event):void
		{
			// TODO Auto Generated method stub
			this.clearData();
		}
		
		public function setData(data:*):void
		{
			var reward:DRankWeekReward=data as DRankWeekReward;
			var numStr:String=reward.getRankStr();
			_skin.num.label=numStr;
			_skin.gRank.x=_skin.num.x+numStr.length*12;
			var rewardArr:Array=reward.reward as Array;
			if (rewardArr) 
			{
				var len:int=rewardArr.length;
				var rewards:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
				for (var i:int = 0; i < len; i++) 
				{
					var obj:Object=rewardArr[i];
					var tmp:ClientItemInfo=new ClientItemInfo(obj.mod);
					tmp.count=obj.num;
					rewards.push(tmp);
				}
				_gReward.setReward(rewards);
			}
		}
		public function clearData():void
		{
			_gReward.clear();
		}
	}
}