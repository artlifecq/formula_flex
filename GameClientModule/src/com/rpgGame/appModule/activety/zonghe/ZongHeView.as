package com.rpgGame.appModule.activety.zonghe
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.sender.SpecialActivitySender;
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
	import feathers.utils.filter.GrayFilter;
	
	import org.mokylin.skin.app.activety.zonghe.ActivetyAll_Skin;
	
	/**
	 *综合标签
	 * @author dik
	 * 
	 */
	public class ZongHeView extends ViewUI
	{
		private var _skin:ActivetyAll_Skin;
		private var _activeData:ListCollection;
		private var rewardIcon:Vector.<IconCDFace>;
		private var selectedInfo:ActivetyInfo;
		
		public function ZongHeView()
		{
			_skin=new ActivetyAll_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.ListItem.itemRendererType=ZongHeItemRender;
			_skin.ListItem.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			_activeData=new ListCollection();
			var list:Vector.<ActivetyInfo>=ActivetyDataManager.getActiveList(ActivityEnum.ZONGHE_ACT);
			for(var i:int=0;i<list.length;i++){
				_activeData.addItem(list[i]);
			}
			_skin.ListItem.dataProvider=_activeData;
			rewardIcon=new Vector.<IconCDFace>();
		}
		
		override public function show(data:Object=null):void
		{
			_skin.ListItem.addEventListener(Event.CHANGE,onChange);
			_skin.joinBtn.addEventListener(Event.TRIGGERED,onJoin);
			var icon:IconCDFace;
			for(i=1;i<5;i++){
				icon=IconCDFace.create(IcoSizeEnum.ICON_48);
				rewardIcon.push(icon);
				icon.x=_skin["icon"+i].x;
				icon.y=_skin["icon"+i].y;
				_skin.container.addChild(icon);
			}
			
			if(!data){
				_skin.ListItem.selectedIndex=0;
				_skin.ListItem.dataProvider.updateItemAt(0);
				_skin.ListItem.scrollToDisplayIndex(0);
			}else{
				var dataInfo:ActivetyInfo=data as ActivetyInfo;
				for(var i:int=0;i<_activeData.length;i++){
					var info:ActivetyInfo=_activeData.data[i] as ActivetyInfo;
					if(info.actCfg.q_activity_id==dataInfo.actCfg.q_activity_id){
						_skin.ListItem.selectedIndex=i;
						_skin.ListItem.scrollToDisplayIndex(i);
						_skin.ListItem.dataProvider.updateItemAt(i);
						break;
					}
				}
			}
			onChange(null);
		}
		
		private function onJoin(e:Event):void
		{
			if(selectedInfo.info.joinState==2){
				SpecialActivitySender.reqJoinAct(selectedInfo.actCfg.q_activity_id);
			}else{//活动不在进行中
//				NoticeManager.showNotifyById();
			}
		}
		
		private function onChange(e:Event):void
		{
			var info:ActivetyInfo=_skin.ListItem.selectedItem as ActivetyInfo;
			if(!info){
				return;
			}
			selectedInfo=info;
			_skin.activeName.styleName="ui/app/activety/zonghe/active_name/"+info.actCfg.q_activity_id+".png";
			_skin.activeBg.styleName="ui/big_bg/activety/des/"+info.actCfg.q_activity_id+".jpg";
			_skin.lbMsg.htmlText=info.actCfg.q_text;
			
			var arr:Array;
			if(info.actCfg.q_rewards){
				arr=JSONUtil.decode(info.actCfg.q_rewards);
			}else{
				arr=[];
			}
			
			if(selectedInfo.info.joinState!=2){
				GrayFilter.gray(_skin.joinBtn);
			}else{
				GrayFilter.unGray(_skin.joinBtn);
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
			var icon:IconCDFace;
			while(rewardIcon.length>0){
				icon=rewardIcon.pop();
				icon.destroy();
			}
		}
	}
}