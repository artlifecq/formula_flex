package com.rpgGame.appModule.xinfa.sub
{
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.clientConfig.Q_cheats;
	import com.rpgGame.coreData.info.cheats.CheatsVo;
	
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.beibao.Xinfa.XinFaSelect_Item;
	
	import starling.display.DisplayObject;
	
	public class XinFaBtnExt extends SkinUI
	{
		private var _skin:XinFaSelect_Item;
		
		public static var clickCall:Function;
		public var userData:*;
		public function XinFaBtnExt(config:Q_cheats)
		{
			_skin=new XinFaSelect_Item();
			super(_skin);
			_skin.icon.styleName="ui/app/beibao/xinfa/icon/"+config.q_id+".png";
			_skin.uiName.styleName="ui/app/beibao/xinfa/mingzi1/"+config.q_id+".png";
			_hitArea=null;
		}
		
		public function setData(level:int):void
		{
			
			if (level>0) 
			{
				_skin.uiJihuo.visible=false;
				_skin.mcNum.gotoAndStop(level+"");
				_skin.gLevel.visible=true;
			}
			else
			{
				_skin.uiJihuo.visible=true;
				_skin.gLevel.visible=false;
			}
		}
		public function setGary(bool:Boolean):void
		{
			if (bool) 
			{
				GrayFilter.gray(this);
			}
			else
			{
				GrayFilter.unGray(this);
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if (clickCall) 
			{
				clickCall(this);
			}
		}
		public function get isSelected():Boolean
		{
			return _skin.btns.isSelected;
		}
		public function set isSelected(value:Boolean):void
		{
			_skin.btns.isSelected=value;
		}
	}
}