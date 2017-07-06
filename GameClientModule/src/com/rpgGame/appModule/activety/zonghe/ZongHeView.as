package com.rpgGame.appModule.activety.zonghe
{
	import com.gameClient.utils.JSONUtil;
	import com.rpgGame.app.reward.RewardGroup;
	import com.rpgGame.app.richText.RichTextCustomLinkType;
	import com.rpgGame.app.richText.RichTextCustomUtil;
	import com.rpgGame.app.richText.component.RichTextArea3D;
	import com.rpgGame.app.sender.SpecialActivitySender;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.active.ActivetyCfgData;
	import com.rpgGame.coreData.cfg.active.ActivetyInfo;
	import com.rpgGame.coreData.cfg.monster.MonsterDataManager;
	import com.rpgGame.coreData.clientConfig.Q_monster;
	import com.rpgGame.coreData.clientConfig.Q_scene_monster_area;
	import com.rpgGame.coreData.enum.ActivityEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.type.activity.ActivityJoinStateEnum;
	
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import away3d.events.Event;
	
	import feathers.controls.ScrollBarDisplayMode;
	import feathers.controls.text.Fontter;
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
		private var selectedInfo:ActivetyInfo;
		private var _richText:RichTextArea3D;
		private  var _defaultFormat:TextFormat;
		private var rewardGp:RewardGroup;
		
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
			rewardGp=new RewardGroup(IcoSizeEnum.ICON_48,_skin.icon1,0,4);
			_richText= RichTextArea3D.getFromPool();
			_richText.setSize(300);
			_richText.breakLineManual = true;
			_richText.setConfig(RichTextCustomUtil.getChatUnitConfigVec());
			_richText.wordWrap = true;
			_richText.multiline = true;
			
			_defaultFormat = new TextFormat(Fontter.FONT_Hei);
			_defaultFormat.color = 0xF9F0CC;
			_defaultFormat.size = 14;
			_defaultFormat.align = TextFieldAutoSize.LEFT;
			_defaultFormat.letterSpacing = 1;
			_defaultFormat.leading = 4;
			_richText.defaultTextFormat = _defaultFormat;
			this.addChild(_richText);
			_richText.x=630;
			_richText.y=415;
		}
		
		override public function show(data:Object=null):void
		{
			_skin.ListItem.addEventListener(Event.CHANGE,onChange);
			_skin.joinBtn.addEventListener(Event.TRIGGERED,onJoin);
			var i:int;
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
				for(i=0;i<len;i++){
					info=_activeData.data[i] as ActivetyInfo;
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
			_skin.activeName.styleName="ui/app/activety/zonghe/active_name/"+info.actCfg.q_res_id+".png";
			_skin.activeBg.styleName="ui/big_bg/activety/des/"+info.actCfg.q_des_bg+".jpg";
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
				if(obj.reId){
					var list:Array=des.split("$");
					text+=list[0];
					var reCfg:Q_scene_monster_area=MonsterDataManager.getAreaByAreaID(obj.reId);
					if(reCfg){
						var linkData:String=reCfg.q_mapid+","+reCfg.q_center_x+","+reCfg.q_center_y;
						var mCfg:Q_monster=MonsterDataManager.getData(reCfg.q_monster_model);
						if(mCfg){
							var linkName:String=RichTextCustomUtil.getTextLinkCode(mCfg.q_name,StaticValue.UI_GREEN,
								RichTextCustomLinkType.WALK_TO_SCENE_POS_TYPE,linkData);
							text+=linkName;
							text+=RichTextCustomUtil.getButtonLinkCode("org.mokylin.skin.component.button.ButtonSkin_send",RichTextCustomLinkType.FLY_TO_SCENE_POS_TYPE,linkData);
						}
					}
					text+=list[1]+"\n";
				}else{
					text+=obj.des+"\n";
				}
			}
			_richText.appendRichText(text);
			
			var arr:Array;
			if(info.actCfg.q_rewards){
				rewardGp.setRewardByJsonStr(info.actCfg.q_rewards);
			}else{
				rewardGp.clear();
			}
			
			if(!selectedInfo.info||selectedInfo.info.joinState!=2){
				GrayFilter.gray(_skin.joinBtn);
			}else{
				GrayFilter.unGray(_skin.joinBtn);
			}
		}
		
		override public function hide():void
		{
			_skin.ListItem.removeEventListener(Event.CHANGE,onChange);
			_skin.joinBtn.removeEventListener(Event.TRIGGERED,onJoin);
			rewardGp.clear();
		}
	}
}