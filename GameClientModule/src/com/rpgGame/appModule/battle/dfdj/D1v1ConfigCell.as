package com.rpgGame.appModule.battle.dfdj
{
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.coreData.clientConfig.Q_battle_rank;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	
	import feathers.controls.SkinnableContainer;
	
	import org.mokylin.skin.app.zhanchang.dianfengduijue.DuanWeiList_Item;
	
	import starling.display.DisplayObject;

	public class D1v1ConfigCell
	{
		private var gReward:RewardGroup;
		private var _skin:DuanWeiList_Item;
		private var _view:DisplayObject;
		public function D1v1ConfigCell(skin:SkinnableContainer)
		{
			_view=skin;
			_skin=skin.skin as DuanWeiList_Item;
			gReward=new RewardGroup(IcoSizeEnum.ICON_36,_skin.icon1,0,20,-5,0);
			_view.visible=false;
		}
		public function setConfig(qRank:Q_battle_rank):void
		{
			if (qRank) 
			{
				gReward.setRewardByJsonStr(qRank.q_reward);
				_skin.numJifen.label=qRank.q_score+"";
				_skin.uiName.styleName="ui/app/zhanchang/icon/name/"+qRank.q_subrank_id+".png"
				_view.visible=true;
			}
		}
		public function clear():void
		{
			gReward.clear();
			_view.visible=false;
		}
	}
}