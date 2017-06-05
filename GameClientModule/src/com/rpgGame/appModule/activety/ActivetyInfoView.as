package com.rpgGame.appModule.activety
{
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.coreData.cfg.ActivetyCfgData;
	import com.rpgGame.coreData.clientConfig.Q_special_activities;
	import com.rpgGame.coreData.enum.ActivityEnum;
	
	import away3d.events.Event;
	
	import feathers.controls.ScrollBarDisplayMode;
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
			_skin.ListItem.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_activeData=new ListCollection();
			var list:Vector.<Q_special_activities>=ActivetyCfgData.getActivetyListByType(ActivityEnum.ZONGHE_ACT);
			for(var i:int=0;i<list.length;i++){
				var info:ActiveInfo=new ActiveInfo();
				info.cfg=list[i];
				_activeData.addItem(info);
			}
			_skin.ListItem.dataProvider=_activeData;
		}
		
		override public function show(data:Object=null):void
		{
			_skin.ListItem.addEventListener(Event.CHANGE,onChange);
		}
		
		private function onChange(e:Event):void
		{
			var info:ActiveInfo=_skin.ListItem.selectedItem as ActiveInfo;
			if(!info){
				return;
			}
			_skin.activeName.styleName="ui/app/activety/zonghe/active_name/"+info.cfg.q_activity_id+".png";
			_skin.activeBg.styleName="ui/big_bg/activety/des/"+info.cfg.q_activity_id+".png";
			_skin.lbMsg.htmlText=info.cfg.q_text;
		}
		
		override public function hide():void
		{
			_skin.ListItem.removeEventListener(Event.CHANGE,onChange);
		}
	}
}