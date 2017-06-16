package com.rpgGame.appModule.battle.jjzb
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
	import away3d.events.Event;
	
	import org.mokylin.skin.app.zhanchang.jingjichang.PaiMingItem;
	
	public class JJBattleRewardCellExt extends SkinUI
	{
		private var _skin:PaiMingItem;
		private var _gReward:RewardGroup;
		public function JJBattleRewardCellExt()
		{
			_skin=new PaiMingItem();
			super(_skin);
			_gReward=new RewardGroup(_skin.icon1,RewardGroup.ALIN_LEFT,10,10);
			this.addEventListener(Event.REMOVED_FROM_STAGE,onRemoved);
		}
		
		private function onRemoved(eve:Event):void
		{
			// TODO Auto Generated method stub
			clearData();
		}
		public function setData(data:Object):void
		{
			var obj:Object=data;
			var minW:int=0;
			if (obj) 
			{
				var rankArr:Array=obj[0].rank;
				var rewards:Array=obj[0].reward;
				var rankStr:String="";
				minW=22;
				if (rankArr[0]==rankArr[1]) 
				{
					rankStr=rankArr[0]+"";
				}
				else
				{
					if (rankArr[1]==int.MAX_VALUE) 
					{
						rankStr=rankArr[0]+"x";
						_skin.uiL2.styleName="ui/app/zhanchang/jingjichang/yiwai.png";
						_skin.uiL2.width=34;
						minW=34;
					}
					else
					{
						rankStr=rankArr[0]+"-"+rankArr[1];
						_skin.uiL2.styleName="ui/app/zhanchang/jingjichang/ming.png";
						
					}
				}
				this._skin.numLevel.label=rankStr;
				this._skin.uiL2.x=_skin.numLevel.x+rankStr.length*10;
				this._skin.gRank.x=_skin.imgHat.x+(_skin.imgHat.width-(rankStr.length*10+minW+22))/2;
				var minRank:int=Math.min(4,rankArr[0]);
				this._skin.imgHat.styleName="ui/app/zhanchang/jingjichang/pai"+minRank+".png";
				var items:Vector.<ClientItemInfo>=new Vector.<ClientItemInfo>();
				
				var len:int=rewards.length;
				var tmp:ClientItemInfo;
				var tobj:Object;
				for (var i:int = 0; i < len; i++) 
				{
					tobj=rewards[i];
					tmp=new ClientItemInfo(tobj.mod);
					tmp.count=tobj.num;
					items.push(tmp);
				}
				_gReward.setReward(items);
			}
		}
		public function clearData():void
		{
			_gReward.clear();
		}
	}
}