package com.rpgGame.appModule.activety.boss
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.display3D.UIAvatar3D;
	import com.rpgGame.app.manager.ActivetyDataManager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.time.SystemTimeManager;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.utils.FaceUtil;
	import com.rpgGame.app.utils.TimeUtil;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.core.events.AvatarEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.cfg.active.BossActInfo;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.enum.ActivityEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.item.ClientItemInfo;
	import com.rpgGame.coreData.info.item.ItemUtil;
	import com.rpgGame.coreData.type.RenderUnitID;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import away3d.events.Event;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.text.Fontter;
	import feathers.data.ListCollection;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.app.activety.shijieboss.ShiJieBoss_Skin;
	
	/**
	 *boss标签 
	 * @author dik
	 * 
	 */
	public class BossView extends ViewUI
	{
		private var _skin:ShiJieBoss_Skin;
		private var _activeData:ListCollection;
		private var rewardIcon:Vector.<IconCDFace>;
		
		private var _avatar : UIAvatar3D;
		private var selectedInfo:BossActInfo;

		private var actList:Vector.<ActivetyInfo>;
		private var _richText:RichTextArea3D;
		private var _defaultFormat:TextFormat;
		
		public function BossView()
		{
			_skin=new ShiJieBoss_Skin();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_skin.ListItem.itemRendererType=BossItemRender;
			_skin.ListItem.scrollBarDisplayMode = ScrollBarDisplayMode.ALWAYS_VISIBLE;
			
			_activeData=new ListCollection();
			actList=ActivetyCfgData.getTypeList(ActivityEnum.BOSS_ACT);
			actList.sort(sortList);
			_activeData.removeAll();
			for(var i:int=0;i<actList.length;i++){
				_activeData.addItem(actList[i]);
			}
			_skin.ListItem.dataProvider=_activeData;
			
			_avatar = new UIAvatar3D(_skin.avatarGrp);
			rewardIcon=new Vector.<IconCDFace>();
			
			_richText= RichTextArea3D.getFromPool();
			_richText.setSize(_skin.lastSkiller.width);
			_richText.breakLineManual = true;
			_richText.setConfig(RichTextCustomUtil.getChatUnitConfigVec());
			_richText.wordWrap = false;
			_richText.multiline = false;
			
			_defaultFormat = new TextFormat(Fontter.FONT_Hei);
			_defaultFormat.color = StaticValue.GREEN_TEXT;
			_defaultFormat.size = 14;
			_defaultFormat.align = TextFieldAutoSize.LEFT;
			_defaultFormat.letterSpacing = 1;
			_defaultFormat.leading = 4;
			_richText.defaultTextFormat = _defaultFormat;
			_richText.filters=Fontter.filterObj["textFilterBlackGreen"];
			this.addChild(_richText);
			_richText.x=_skin.lastSkiller.x;
			_richText.y=_skin.lastSkiller.y;
			_skin.lastSkiller.visible=false;
		}
		
		
		private function updateBoss(bossId:int):void
		{
			var bossCfg:Q_monster=MonsterDataManager.getData(bossId);
			_avatar.updateBodyWithRes(bossCfg ? bossCfg.q_body_res : "");
		}
		
		override public function show(data:Object=null):void
		{
			var icon:IconCDFace;
			for(var i:int=1;i<6;i++){
				icon=IconCDFace.create(IcoSizeEnum.ICON_48);
				rewardIcon.push(icon);
				icon.x=_skin["icon"+i].x;
				icon.y=_skin["icon"+i].y;
				_skin.container.addChild(icon);
			}
			initEvent();
			updateList();
			var len:int=_activeData.length;
			var info:ActivetyInfo;
			if(!data){
				for(i=0;i<len;i++){
					info=_activeData.data[i] as ActivetyInfo;
					if(info.info&&info.info.joinState==ActivityJoinStateEnum.JOINING){//跳到进行中
						_skin.ListItem.selectedIndex=i;
						_skin.ListItem.scrollToDisplayIndex(i);
						_skin.ListItem.dataProvider.updateItemAt(i);
						break;
					}
				}
				if(_skin.ListItem.selectedIndex==-1){
					_skin.ListItem.selectedIndex=0;
				}
			}else{
				var dataInfo:ActivetyInfo=data as ActivetyInfo;
				for(i=0;i<_activeData.length;i++){
					info=_activeData.data[i] as ActivetyInfo;
					if(info.actCfg.q_activity_id==dataInfo.actCfg.q_activity_id){
						_skin.ListItem.selectedIndex=i;
						_skin.ListItem.scrollToDisplayIndex(i);
						_skin.ListItem.dataProvider.updateItemAt(i);
						break;
					}
				}
				if(_skin.ListItem.selectedIndex==-1){
					_skin.ListItem.selectedIndex=0;
				}
			}
			onChange(null);
		}
		
		private function initEvent():void
		{
			_skin.ListItem.addEventListener(Event.CHANGE,onChange);
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateList);
			EventManager.addEvent(AvatarEvent.AVATAR_CHANGE_COMPLETE,onUpateAvatarScale);
		}
		
		private function onUpateAvatarScale(role:SceneRole,id:int):void
		{
			if(role&&_avatar.role&&_avatar.role==role&&id==RenderUnitID.BODY){
				this._avatar.scaleRole=Number(selectedInfo.worldBossCfg.q_monster_scale);	
			}
		}
		
		private function updateList():void
		{
			for(var i:int=0;i<actList.length;i++){
				if(actList[i].info&&actList[i].info.joinState!=ActivityJoinStateEnum.OVER){
					if(actList[i].actCfg.q_activity_limit_level>MainRoleManager.actorInfo.totalStat.level){
						actList[i].info.joinState=ActivityJoinStateEnum.UN_OPEN;//未开启
					}/*else{
						actList[i].info.joinState=ActivityJoinStateEnum.JOINING;//开启
					}*/
					_skin.ListItem.dataProvider.updateItemAt(i);
				}
			}
		}
		
		private function sortList(infoA:ActivetyInfo,infoB:ActivetyInfo):int
		{
			if(infoA.info==null||infoB.info==null){
				return 0;
			}
			
			if(infoA.info==null||infoB.info==null){
				return 0;
			}
			if(infoA.actCfg.q_order<infoB.actCfg.q_order){
				return -1;
			}else if(infoA.actCfg.q_order>infoB.actCfg.q_order){
				return 1;
			}
			return 0;
		}
		
		private function onChange(e:Event):void
		{
			var info:BossActInfo=_skin.ListItem.selectedItem as BossActInfo;
			if(!info){
				return;
			}
			selectedInfo=info;
			
			var arr:Array;
			if(info.actCfg.q_rewards){
				arr=JSONUtil.decode(info.actCfg.q_rewards);
			}else{
				arr=[];
			}
			var num:int=arr.length;
			for(var i:int=0;i<4;i++){
				if(i<num){
					var itemInfo:ClientItemInfo=ItemUtil.convertClientItemInfoById(arr[i].mod,arr[i].num,arr[i].bind);
					FaceUtil.SetItemGrid(rewardIcon[i],itemInfo);
				}else{
					rewardIcon[i].clear();
				}
			}
			
			updateBoss(selectedInfo.actCfg.q_npc);
			
			_skin.activeName.styleName="ui/app/activety/shijieboss/mingzi/"+selectedInfo.actCfg.q_res_id+".png";
			var timeList:Array=ActivetyDataManager.getTimeList(info.actCfg);
			timeList=timeList[4];//第四个才是刷新段
			_skin.lbTime.htmlText="";
			num=timeList.length;
			var refreshList:Array=[];
			for(i=0;i<num;i++){
				if(i%2==0){
					refreshList.push(timeList[i]);
				}
			}
			
			var text:String;
			num=refreshList.length;
			var time:Date=SystemTimeManager.sysDateTime;
			var nh:int=time.hours;
			var nm:int=time.minutes;
			var isFind:Boolean;
			for(i=1;i<num;i++){
				text=TimeUtil.changeIntHM2Str(refreshList[i]);
				var ls:Array=text.split(":");
				var ah:int=int(ls[0]);
				var am:int=int(ls[1]);
				var t:int=int(timeList[i]);
				if(nh<ah){
					text=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,text);
					isFind=true;
				}else if(nh==ah){
					if(nm<=am){
						text=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,text);
						isFind=true;
					}
				}
				_skin.lbTime.htmlText+=text+"     ";
			}
			
			text=TimeUtil.changeIntHM2Str(refreshList[0]);
			if(!isFind){
				text=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,text);
			}
			_skin.lbTime.htmlText=text+"     "+_skin.lbTime.htmlText;
			
			
			text=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,"最后一击:");
			_richText.text="";
			if(selectedInfo.killerName&&selectedInfo.killerName.length!=0){
				var linkData:String;
				if(selectedInfo.killerId){
					linkData=selectedInfo.killerId.lValue+","+selectedInfo.killerId.hValue+","+selectedInfo.killerId.hexValue;
				}
				var linkName:String=RichTextCustomUtil.getTextLinkCode(selectedInfo.killerName,StaticValue.GREEN_TEXT,
					RichTextCustomLinkType.SEE_OTHER_NAME,linkData);
				text+=linkName;
			}else{
				text+="拭目以待";
			}
			_richText.appendRichText(text);
			
			_richText.x=_skin.lastSkiller.x+(_skin.lastSkiller.width-_richText.textWidth)/2;
		}
		
		override public function hide():void
		{
			var icon:IconCDFace;
			while(rewardIcon.length>0){
				icon=rewardIcon.pop();
				icon.destroy();
			}
			
			_skin.ListItem.removeEventListener(Event.CHANGE,onChange);
			EventManager.removeEvent(MainPlayerEvent.STAT_CHANGE,updateList);
			EventManager.removeEvent(AvatarEvent.AVATAR_CHANGE_COMPLETE,onUpateAvatarScale);
		}
	}
}