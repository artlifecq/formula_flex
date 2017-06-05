package com.rpgGame.appModule.activety
{
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.coreData.cfg.ActivetyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_special_activities;
	import com.rpgGame.coreData.enum.ActivityEnum;
	
	import away3d.events.Event;
	
	import feathers.data.ListCollection;
	
	import org.mokylin.skin.app.activety.zonghe.ActivetyAll_Skin;
	
	/**
	 *活动信息视图 
	 * @author dik
	 * 
	 */
	public class ActivetyInfoView extends ViewUI
	{
		private var _skin:ActivetyAll_Skin;
		private var _activeData:ListCollection;
		public function ActivetyInfoView()
		{
			_skin=new ActivetyAll_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.ListItem.itemRendererType=ActivetyItemRender;
			_activeData=new ListCollection();
			var list:Vector.<Q_special_activities>=ActivetyCfgData.getActivetyListByType(ActivityEnum.ZONGHE_ACT);
			for(var i:int=0;i<list.length;i++){
				_activeData.addItem(list[i]);
			}
			_skin.ListItem.dataProvider=_activeData;
		}
		
		override public function show(data:Object=null):void
		{
			_skin.ListItem.addEventListener(Event.CHANGE,onChange);
		}
		
		private function onChange(e:Event):void
		{
			
		}
		
		override public function hide():void
		{
			_skin.ListItem.removeEventListener(Event.CHANGE,onChange);
		}
	}
}