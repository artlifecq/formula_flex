package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.PKModeUtil;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	
	import org.mokylin.skin.app.tips.PKModeTipSkin;
	
	public class PKModeTip extends SkinUI implements ITip
	{
		private var _pkTip:PKModeTipSkin;
		private var _type:int;
		public function PKModeTip()
		{
			_pkTip = new PKModeTipSkin();
			super( _pkTip );
			initTip()
		}
		private function initTip():void
		{
			
		}
		private static var _instance:PKModeTip = null;
		public static function get instance() : PKModeTip
		{
			if (null == _instance)
			{
				_instance = new PKModeTip();
			}
			return _instance;
		}
		public function setTipData(data:*):void
		{
			_type = MainRoleManager.actorInfo.pkMode;
			_pkTip.modeName.text = PKModeUtil.getPKModeName(MainRoleManager.actorInfo.pkMode);
			_pkTip.modeName.color = PKModeUtil.getPKModeColor(MainRoleManager.actorInfo.pkMode);
//			_pkTip.desc.text = PKModeUtil.getPKModeDesc(MainRoleManager.actorInfo.pkMode);
//			_pkTip.imgBG.height = _pkTip.desc.y+_pkTip.desc.textHeight+15;
		}
		
		public function hideTips():void
		{
		}
	}
}