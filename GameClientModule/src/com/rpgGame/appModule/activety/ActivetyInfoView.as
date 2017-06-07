package com.rpgGame.appModule.activety
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.sender.ActivitySender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.cfg.active.ActivetyDataManager;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.enum.ActivityEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.netData.backpack.bean.ItemInfo;
	
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
		private var rewardIcon:Vector.<IconCDFace>;
		private var selectedInfo:ActivetyInfo;
		
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
			var list:Vector.<ActivetyInfo>=ActivetyDataManager.getActiveList(ActivityEnum.ZONGHE_ACT);
			for(var i:int=0;i<list.length;i++){
				_activeData.addItem(list[i]);
			}
			_skin.ListItem.dataProvider=_activeData;
			rewardIcon=new Vector.<IconCDFace>();
			
			var icon:IconCDFace;
			for(i=1;i<5;i++){
				icon=new IconCDFace(IcoSizeEnum.ICON_48);
				rewardIcon.push(icon);
				icon.x=_skin["icon"+i].x;
				icon.y=_skin["icon"+i].y;
				_skin.container.addChild(icon);
			}
		}
		
		override public function show(data:Object=null):void
		{
			_skin.ListItem.addEventListener(Event.CHANGE,onChange);
			_skin.joinBtn.addEventListener(Event.TRIGGERED,onJoin);
			_skin.ListItem.selectedIndex=0;
			onChange(null);
		}
		
		private function onJoin(e:Event):void
		{
			ActivitySender.reqJoinAct(selectedInfo.cfg.q_activity_id);
		}
		
		private function onChange(e:Event):void
		{
			var info:ActivetyInfo=_skin.ListItem.selectedItem as ActivetyInfo;
			if(!info){
				return;
			}
			selectedInfo=info;
			_skin.activeName.styleName="ui/app/activety/zonghe/active_name/"+info.cfg.q_activity_id+".png";
			_skin.activeBg.styleName="ui/big_bg/activety/des/"+info.cfg.q_activity_id+".png";
			_skin.lbMsg.htmlText=info.cfg.q_text;
			
			var arr:Array;
			if(info.cfg.q_rewards){
				arr=JSONUtil.decode(info.cfg.q_rewards);
			}else{
				arr=[];
			}
			
			var num:int=arr.length;
			for(var i:int=0;i<4;i++){
				if(i<num){
					var itemInfo:ClientItemInfo=new ClientItemInfo(arr[0].mod);
					itemInfo.itemInfo=new ItemInfo();
					itemInfo.itemInfo.isbind=arr[0].bind;
					FaceUtil.SetItemGrid(rewardIcon[i],itemInfo);
				}else{
					rewardIcon[i].clear();
				}
			}
		}
		
		override public function hide():void
		{
			_skin.ListItem.removeEventListener(Event.CHANGE,onChange);
			_skin.joinBtn.removeEventListener(Event.TRIGGERED,onJoin);
		}
	}
}