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
		private var _needGray:Boolean;
		public function RewardMarkCtrl(dis:DisplayObjectContainer,gray:Boolean=true)
		{
			this._dis=dis;
			this._needGray=gray;
		}
		public function set hasReward(bool:Boolean):void
		{
			if (!bool) 
			{
				if (_needGray) 
				{
					GrayFilter.gray(_dis);
				}
				
				if (_mark) 
				{
					_mark.visible=false;
				}
			}
			else
			{
				if (_needGray) 
				{
					GrayFilter.unGray(_dis);
				}
				if (!_mark) 
				{
					_mark=new UIAsset();
					_mark.styleName="ui/common/tubiao/tishi.png";
					_mark.x=_dis.width-_mark.width-2;
					_mark.y=2;
					_dis.addChild(_mark);
				}
				_mark.visible=true;
				MCUtil.BringToTop(_mark);
			}
		}
	}
}