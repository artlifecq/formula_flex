package com.rpgGame.app.manager
{
	import com.rpgGame.core.events.ItemEvent;
	import com.rpgGame.coreData.cfg.HeChengData;
	import com.rpgGame.coreData.clientConfig.Q_hecheng;
	
	import org.client.mainCore.bean.BaseBean;
	import org.client.mainCore.manager.EventManager;
	
	public class HeChengManager extends BaseBean
	{
		public function HeChengManager()
		{
		}
		
		public static function setHeChengItem(q_hecheng:Q_hecheng):void
		{
			EventManager.dispatchEvent(ItemEvent.ITEM_HECHENG_SELECT,q_hecheng);
		}
	}
}