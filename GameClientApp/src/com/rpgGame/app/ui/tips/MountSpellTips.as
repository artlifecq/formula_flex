package com.rpgGame.app.ui.tips
{
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.ui.tip.implement.ITip;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.face.BaseFaceInfo;
	import com.rpgGame.coreData.info.mount.MountInfoData;
	
	/**
	 * 坐骑技能tips 
	 * @author 陈鹉光
	 * 
	 */	
	public class MountSpellTips extends SkinUI implements ITip
	{
		private var _skin:Object;//MountSpellTipSkin;
		/** 图标icon **/
		private var titleIconFace:IconCDFace;
		/** 坐骑数据 **/
		private var _mountData:MountInfoData;
		/** 初始化坐骑tips **/
		private var _baseFaceInfo:BaseFaceInfo;
		/** tips高度 **/
		private var tipsHeight:Number;
		 
		public function MountSpellTips()
		{
//			_skin = new MountSpellTipSkin();
			super( _skin );
			initTip();
		}
		
		private static var _instance:MountSpellTips = null;
		public static function get instance() : MountSpellTips
		{
			if (null == _instance)
			{
				_instance = new MountSpellTips();
			}
			return _instance;
		}
		
		/**
		 * 初始化坐骑tips
		 * 
		 */		 
		private function initTip():void
		{
			titleIconFace = FaceUtil.creatIconCDFaceByUIAsset( _skin.imgIcon, IcoSizeEnum.SIZE_46, 0 );
		}
		
		/**
		 * 设置坐骑技能tips数据 
		 * @param data
		 * 
		 */		
		public function setTipData(data:*):void
		{
			var cfgId:int = int(data); 
			var icon:String = ItemConfig.getItemIcon( cfgId );
			if(!icon)icon = "";
			
			titleIconFace.styleName = ClientConfig.getItemIcon( icon, IcoSizeEnum.SIZE_46 );
			_skin.labName.htmlText = ItemConfig.getItemName(cfgId);
			_skin.labDesc.htmlText = ItemConfig.getItemDesc(cfgId);
		}
		
		/**
		 * 获取坐骑技能tips背景高度 
		 * @return 
		 * 
		 */        
		public override function get height():Number
		{
			return _skin.imgBG.height;
		}
		
		public function hideTips():void
		{
			//TODO: implement function
		}
	}
}