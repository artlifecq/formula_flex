package  com.rpgGame.core.ui.tip
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
	public class RewardMarkTip
	{
		private var _dis:DisplayObjectContainer;
		private var _mark:UIAsset;
		private var _needGray:Boolean;
		private var _hasReward:Boolean;
		private var _disW:int;
		public function RewardMarkTip(dis:DisplayObjectContainer,dw:int,gray:Boolean=false)
		{
			this._disW=dw;
			this._dis=dis;
			this._needGray=gray;
		}
		public function set hasReward(bool:Boolean):void
		{
			_hasReward=bool;
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
					_mark.x=_disW-18-2;
					_mark.y=2;
					_dis.addChild(_mark);
				}
				_mark.visible=true;
				MCUtil.BringToTop(_mark);
			}
		}
		public function setTip2Top():void
		{
			if (_hasReward&&_mark&&_mark.visible&&_dis&&_dis.stage) 
			{
				MCUtil.BringToTop(_mark);
			}
		}
		public function get hasReward():Boolean
		{
			return _hasReward;
		}
		public function clear():void
		{
			if (_mark) 
			{
				MCUtil.removeSelf(_mark);
				_mark.dispose();
				_mark=null;
			}
			if (_dis) 
			{
				GrayFilter.unGray(_dis);
				_dis=null;
			}
			_hasReward=false;
		}
	}
}