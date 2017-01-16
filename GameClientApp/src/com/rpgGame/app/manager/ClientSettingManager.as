package com.rpgGame.app.manager
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.sender.HeroMiscSender;
	import com.rpgGame.coreData.enum.EnumCustomTagType;
	import com.rpgGame.coreData.info.shortcuts.ShortcutsData;
	import com.rpgGame.netData.client.bean.CustomTaginfo;
	
	import org.client.mainCore.ds.HashMap;

	/**
	 * 客户端一些设置保存到服务器上的 
	 * @author NEIL
	 * 
	 */	
	public class ClientSettingManager
	{
		public function ClientSettingManager()
		{
		}
		
		private static var _hash :HashMap = null;
		public static function setup(tags : Vector.<CustomTaginfo>) : void
		{
			var isFirst :Boolean = false;
			if ( _hash == null )
			{
				// 第一次收到
				_hash = new HashMap();
				isFirst = true;
			}
			else
			{
				// 改变
			}
			for each ( var info :CustomTaginfo in tags ) 
			{
				var value :String = info.value;
				var type:int = parseInt(info.key);
				if ( value == null )
					value = "";
				
				if ( type == EnumCustomTagType.BOSS_REFRESH_NOTICE )
				{
				}
				else if ( type == EnumCustomTagType.DEFAULT_USE_SKILL_MID )
				{
				}
				else if ( type == EnumCustomTagType.CHAT_CHANNEL_SHOW )
				{
				}
				else if ( type == EnumCustomTagType.SHORTCUT_CONFIG )
				{
					//快捷键设置
					initShortCutsConfig(value , isFirst);
				}
				else if ( type == EnumCustomTagType.SYSTEM_SET )
				{
				}
				else if(type == EnumCustomTagType.GET_JUE_MING_ATTRIBUTE_EFFECT)
				{
				}
				else if (type == EnumCustomTagType.SCENEEFFECT_INTERACT)
				{
				}
			}
		}
/////////////////////////////////////////////////设置快捷键这块代码逻辑/////////////////////////////////////////////////////////////		
		/**
		 * 设置指定数据		保存的是数字类
		 * @param index			参考：EnumClientIntSetting
		 * @param value
		 *
		 */
		public static function savaClientShortCutsToServer(map:HashMap):void
		{
			var data :Array = [];
			var values :Array = map.getValues();
			var vo :ShortcutsData;
			for each ( vo in values ) 
			{
				data.push( {t :vo.type , mid :vo.id , k :vo.shortcutPos} );
			}
			HeroMiscSender.reqSetClientCustomTag(EnumCustomTagType.SHORTCUT_CONFIG , JSONUtil.encode( data ));
		}
		
		private static var shortCutsData:Object;
		public static function getShortCutDataByKey(shortcutPos:int):Object
		{
			for each( var obj :Object in shortCutsData )
			{
				if(int(obj.k) == shortcutPos)
				{
					return obj;
				}
			}
			return null;
		}
		private static function initShortCutsConfig( dataStr :String , isFirst :Boolean ):void
		{
			shortCutsData  = JSONUtil.decode( dataStr );
			
			/*if ( isFirst )
			{
				shortCutsData  = JSONUtil.decode( dataStr );
			}*/
		}
	}
}