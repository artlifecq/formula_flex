package com.rpgGame.appModule.openActivity.plat37
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.platform.PlatformUtil;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.ui.main.openActivity.BaseCampSubPanel;
	import com.rpgGame.app.utils.TouchableUtil;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.openActivity.ActivityVo;
	
	import org.mokylin.skin.app.tequan.TQ_Youxilipai;
	
	import starling.display.DisplayObject;

	/**
	 *37游戏令牌 
	 * @author yfl
	 * 
	 */	
	public class P37TokenPanelExt extends BaseCampSubPanel
	{
		private var _skin:TQ_Youxilipai;
		private var _rewardG:RewardGroup;
		private var _datas:Vector.<ActivityVo>;
		public function P37TokenPanelExt()
		{
			_skin=new TQ_Youxilipai();
			super(_skin);
			_rewardG=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon3,1,9,4);
		}
		override public function setData(infos:Vector.<ActivityVo>):void
		{
			super.setData(infos);
			_datas=infos;
			if (_datas.length>0) 
			{
				var vo:ActivityVo=_datas[0];
				this._rewardG.setRewardByJsonStr(_datas[0].activityReward);
				setBtnState(_skin.btnOk,vo.status,false);
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target)
			{
				case _skin.labDown:
				{
					PlatformUtil.platform.downLinPai();
					break;
				}
				case _skin.btnOk:
				{
					if (_datas&&_datas.length&&_datas[0].IsCanGetReward()) 
					{
						Mgr.activityPanelMgr.reqActivitiesGetRewardMsg(_datas[0].activityId);
					}
					break;
				}
				default:
				{
					break;
				}
			}
		}
		override public function clearData():void
		{
			_rewardG.clear();
			_datas=null;
		}
	}
}