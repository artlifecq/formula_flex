package com.rpgGame.appModule.battle.jjzb
{
	import com.rpgGame.appModule.common.RewardGroup;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	
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
		}
		public function setData(data:Object):void
		{
			var obj:Object=data;
			if (obj) 
			{
				var rankArr:Array=obj.rank;
				var rewards:Array=obj.reward;
				var rankStr:String="";
				if (rankArr[0]==rankArr[1]) 
				{
					rankStr=rankArr[0]+"";
				}
				else
				{
					if (rankArr[1]==int.MAX_VALUE) 
					{
						rankStr=rankStr[0]+"+";
					}
					else
					{
						rankStr=rankArr[0]+"-"+rankArr[1];
					}
				}
				this._skin.numLevel.label=rankStr;
				this._skin.uiL2.x=_skin.numLevel.x+_skin.numLevel.width+2;
				var minRank:int=Math.min(4,rankArr[0]);this.
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