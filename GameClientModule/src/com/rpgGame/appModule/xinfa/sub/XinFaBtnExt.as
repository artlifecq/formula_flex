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
		private var _vo:CheatsVo;
		public static var clickCall:Function;
		public var userData:*;
		public function XinFaBtnExt(config:Q_cheats)
		{
			_skin=new XinFaSelect_Item();
			super(_skin);
			_skin.icon.styleName="ui/app/beibao/xinfa/icon/"+config.q_id+".png";
			_skin.uiName.styleName="ui/app/beibao/xinfa/mingzi1/"+config+".png";
		}
		
		public function setData(vo:CheatsVo):void
		{
			this._vo=vo;
			if (_vo.isActive()) 
			{
				GrayFilter.unGray(this);
				_skin.mcNum.gotoAndStop(_vo.level+"");
				_skin.gLevel.visible=true;
			}
			else
			{
				GrayFilter.gray(this);
				_skin.gLevel.visible=false;
			}
		}
		override protected function onTouchTarget(target:DisplayObject):void
		{
			if (clickCall) 
			{
				clickCall(this);
			}
		}

		public function get vo():CheatsVo
		{
			return _vo;
		}

	}
}