package com.rpgGame.core.utils
{
	import com.rpgGame.coreData.cfg.ClientConfig;
	
	import feathers.controls.UIAsset;
	
	import starling.display.DisplayObjectContainer;

	/**
	 * 添加提示
	 * @author luguozheng
	 * 
	 */	
	public class PromptUtil
	{
		/** 揭示 “！”符号 */		
		public static const TAB_PRIZE:String = "tishi";
		
		
		//-----------------------------------------------------------------
		private static const TAB_ICO_NAME:String = "tab_ico_name";
		/**
		 * 添加标签
		 * @param type
		 * @param uiDisobj
		 * @param posx
		 * @param posy
		 * 
		 */		
		public static function addTabIco( type:String, uiDisobj:DisplayObjectContainer, posx:int = 0,posy:int = 0):void
		{
			var bit:UIAsset = uiDisobj.getChildByName( TAB_ICO_NAME + type ) as UIAsset;
			
			if (bit != null) 
				return;
			
			bit = new UIAsset();
			bit.styleName = ClientConfig.getPromptTabUrl( type );
			bit.name = TAB_ICO_NAME + type; 
			bit.x = posx;
			bit.y = posy;
			uiDisobj.addChild(bit)
		}
		/**
		 * 移除标签
		 * @param type
		 * @param uiDisobj
		 * 
		 */		
		public static function removeTabIco( type:String, uiDisobj:DisplayObjectContainer ):void
		{
			var bit:UIAsset = uiDisobj.getChildByName( TAB_ICO_NAME + type ) as UIAsset;
			if (bit == null) 
				return;
			
			if( bit.parent != null )
				bit.parent.removeChild( bit );
			
			bit.dispose();
			bit = null;
		}
		
		
		//------------------------------------------------
//		private static const TAB_ICO_NUM:String = "tab_ico_name";
//		/**
//		 * 添加数字
//		 * @param type
//		 * @param uiDisobj
//		 * @param posx
//		 * @param posy
//		 * 
//		 */		
//		public static function addTabNum(num:int,uiDisobj:DisplayObjectContainer,posx:int = 0,posy:int = 0):void
//		{
//			removeTabNum(uiDisobj);
//			
//			var sprite:UIAsset = new UIAsset;
//			sprite.x = posx;
//			sprite.y = posy;
//			sprite.styleName = (UIResProxy.getAsynBitmap("ui/public/image/txtboard19/hongsemoxiaomoji.png",null))
//			sprite.name = TAB_ICO_NUM; 
//			
//			var bit:UIAsset = GlobalFunction.createRemainGridNum(num);
//			bit.x = 6;
//			bit.y = -4;
//			sprite.addChild(bit);
//			uiDisobj.addChild(sprite);
//		}
//		/**
//		 * 移除数字
//		 * @param type
//		 * @param uiDisobj
//		 * 
//		 */		
//		public static function removeTabNum(uiDisobj:DisplayObjectContainer):void
//		{
//			var bit:Sprite = uiDisobj.getChildByName(TAB_ICO_NUM) as Sprite;
//			if (bit == null) return;
//			MCUtil.removeSelf(bit);
//			bit = null;
//		}
		
		//------------------------------------------------
	}
}
