package com.rpgGame.appModule.vip
{
	import com.rpgGame.core.utils.MCUtil;
	
	import feathers.controls.UIAsset;
	import feathers.utils.filter.GrayFilter;
	
	import starling.display.DisplayObjectContainer;

	/**
	 *奖励按钮叹号 
	 * @author yfl
	 * 
	 */	
	public class RewardMarkCtrl
	{
		private var _dis:DisplayObjectContainer;
		private var _mark:UIAsset;
		public function RewardMarkCtrl(dis:DisplayObjectContainer)
		{
			this._dis=dis;
		}
		public function set hasReward(bool:Boolean):void
		{
			if (!bool) 
			{
				GrayFilter.gray(_dis);
				if (_mark) 
				{
					_mark.visible=false;
				}
			}
			else
			{
				GrayFilter.unGray(_dis);
				if (!_mark) 
				{
					_mark=new UIAsset();
					_mark.styleName="ui/common/tubiao/tishi.png";
					_mark.x=_dis.width-_mark.width-2;
					_mark.y=2;
					_dis.addChild(_mark);
				}
				MCUtil.BringToTop(_mark);
			}
		}
	}
}