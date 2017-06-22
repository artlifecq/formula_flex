package com.rpgGame.appModule.activety.zonghe
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.sender.SpecialActivitySender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
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
		private var _richText:RichTextArea3D;
		
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
			var list:Vector.<ActivetyInfo>=ActivetyCfgData.getTypeList(ActivityEnum.ZONGHE_ACT);
			for(var i:int=0;i<list.length;i++){
				_activeData.addItem(list[i]);
			}
			_skin.ListItem.dataProvider=_activeData;
			rewardIcon=new Vector.<IconCDFace>();
			_richText= RichTextArea3D.getFromPool();
			_richText.setSize(300);
			_richText.breakLineManual = true;
			_richText.setConfig(RichTextCustomUtil.getChatUnitConfigVec());
			_richText.wordWrap = true;
			_richText.multiline = true;
			this.addChild(_richText);
			_richText.x=630;
			_richText.y=415;
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
				if(selectedInfo.actCfg.q_notice_trans){
					//跳到对应标签的对应活动
					AppManager.showAppNoHide(selectedInfo.actCfg.q_notice_trans,selectedInfo,selectedInfo.actCfg.q_trans_funcID);
				}else{
					SpecialActivitySender.reqJoinAct(selectedInfo.actCfg.q_activity_id);
				}
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
			_skin.lbMsg.visible=false;
			var desObj:Array=JSONUtil.decode(info.actCfg.q_text);
			
			_richText.text="";
			if(!desObj){
				desObj=[];
			}
			var num:int=desObj.length;
			var text:String="";
			for(var i:int=0;i<num;i++){
				var obj:Object=desObj[i];
				var des:String=obj.des;
				if(obj.trans){
					var list:Array=des.split("$");
					text+=list[0];
					var linkData:String=obj.trans.map+","+obj.trans.x+","+obj.trans.y;
					var linkName:String=RichTextCustomUtil.getTextLinkCode(obj.trans.target,StaticValue.UI_GREEN,
						RichTextCustomLinkType.WALK_TO_SCENE_POS_TYPE,linkData);
					text+=linkName;
					text+=list[1];
				}else{
					text+=obj.des;
				}
			}
			_richText.appendRichText(text);
			
			var arr:Array;
			if(info.actCfg.q_rewards){
				arr=JSONUtil.decode(info.actCfg.q_rewards);
			}else{
				arr=[];
			}
			
			if(!selectedInfo.info||selectedInfo.info.joinState!=2){
				GrayFilter.gray(_skin.joinBtn);
			}else{
				GrayFilter.unGray(_skin.joinBtn);
			}
			
			num=arr.length;
			for(i=0;i<4;i++){
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