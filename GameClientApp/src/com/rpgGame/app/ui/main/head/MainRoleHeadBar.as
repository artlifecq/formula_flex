package com.rpgGame.app.ui.main.head {
	import com.game.engine3D.display.Inter3DContainer;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.PKMamager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.ui.tips.data.AmountTipData;
	import com.rpgGame.app.view.icon.BuffIcon;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.manager.tips.TargetTipsMaker;
	import com.rpgGame.core.manager.tips.TipTargetManager;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.utils.NumberUtil;
	import com.rpgGame.core.view.ui.tip.vo.DynamicTipData;
	import com.rpgGame.coreData.SpriteStat;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.cfg.StaticValue;
	import com.rpgGame.coreData.cfg.item.ItemConfig;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.PKModeType;
	import com.rpgGame.coreData.type.TipType;
	import com.rpgGame.coreData.utils.HtmlTextUtil;
	
	import flash.geom.Point;
	
	import app.message.EnumBuff;
	
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.utils.filter.GrayFilter;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.head.Head_Select;
	import org.mokylin.skin.mainui.head.head_main_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	import utils.TimerServer;
	
	public class MainRoleHeadBar extends SkinUI {
		private var _skin : head_main_Skin;
		
		private var _zhandouliEftContaner:Inter3DContainer;
		private var _pkBtns:Array;
		
		private var gridW:int;
		private var _buffList:Vector.<BuffIcon>;
		private var _buffContainer:Sprite;
		private var _timenum:int=5;
		private const MAX_SHOW_NUM:int=4;
		
		private var ybTips:DynamicTipData;
		private var ljTips:DynamicTipData;
		private var ybData:AmountTipData;
		private var ljData:AmountTipData;
		
		public function MainRoleHeadBar() {
			this._skin = new head_main_Skin();
			super(this._skin);
			this._skin.btn_banghui.visible = false;
			this._skin.btn_duiwu.visible = false;
			this._skin.btn_heping.visible = true;
			this._skin.btn_quanti.visible = false;
			_zhandouliEftContaner=new Inter3DContainer();
			_skin.container.addChildAt(_zhandouliEftContaner,1);
			_zhandouliEftContaner.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JIEMIAN_ZHANDOULI),190,107,0);
			
			_buffContainer=new Sprite();
			_skin.container.addChild(_buffContainer);
			_buffContainer.x=130;
			_buffContainer.y=110;
			gridW=IcoSizeEnum.ICON_19+9;
			_skin.container.addChild(_skin.grp_select);
			
			updateAll();
			initPK();
			initBuff();
			
			ybTips=new DynamicTipData();
			ljTips=new DynamicTipData();
			ybData=new AmountTipData();
			ljData=new AmountTipData();
			
			ybTips.data=ybData;
			ljTips.data=ljData;
		}
		
		override protected function onShow():void
		{
			super.onShow();		
			this.addEventListener(starling.events.TouchEvent.TOUCH,onTouch);
			EventManager.addEvent(BuffEvent.ADD_BUFF, addBuff);
			EventManager.addEvent(BuffEvent.REMOVE_BUFF, removeBuff);
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateFight);//基本属性改变
			EventManager.addEvent(MainPlayerEvent.PK_MODE_CHANGE,onPKModelChange);
			EventManager.addEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			
			
			ybData.name="元宝:";
			ybData.des=ItemConfig.getQItemByID(3).q_describe;
			ljData.name="礼金:";
			ljData.des=ItemConfig.getQItemByID(5).q_describe;
			
			TipTargetManager.show( _skin.uiYuanbao, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP, ybTips ));
			TipTargetManager.show( _skin.lbYuanbao, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,  ybTips));
			TipTargetManager.show( _skin.uiLijin, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP,ljTips ));
			TipTargetManager.show( _skin.lbLijin, TargetTipsMaker.makeTips( TipType.AMOUNT_TIP, ljTips));
			
			updateAmount();
		}
		
		override protected function onHide() : void
		{
			super.onHide();
			TimerServer.remove(updateTimeBtnShow);
			this.removeEventListener(starling.events.TouchEvent.TOUCH,onTouch);
			EventManager.removeEvent(BuffEvent.ADD_BUFF, addBuff);
			EventManager.removeEvent(BuffEvent.REMOVE_BUFF, removeBuff);
			EventManager.removeEvent(MainPlayerEvent.STAT_CHANGE,updateFight);//基本属性改变
			EventManager.removeEvent(MainPlayerEvent.PK_MODE_CHANGE,onPKModelChange);
			EventManager.removeEvent(MainPlayerEvent.STAT_RES_CHANGE,updateAmount);//金钱变化
			
			TipTargetManager.remove( _skin.uiYuanbao);
			TipTargetManager.remove( _skin.lbYuanbao);
			TipTargetManager.remove( _skin.uiLijin);
			TipTargetManager.remove( _skin.lbLijin);
		}
		
		private function updateAmount(type:int=3):void
		{
			if(type!=CharAttributeType.RES_GOLD&&	type!=CharAttributeType.RES_BIND_GOLD){
				return;
			}
			
			var stat:SpriteStat=MainRoleManager.actorInfo.totalStat;
			_skin.lbYuanbao.text =NumberUtil.getNumberTo(stat.getResData(CharAttributeType.RES_GOLD),true);
			_skin.lbLijin.text =NumberUtil.getNumberTo(stat.getResData(CharAttributeType.RES_BIND_GOLD),true);
			
			ybData.value=_skin.lbYuanbao.text;
			ljData.value=_skin.lbLijin.text;
		}
		
		private function onPKModelChange():void
		{
			// TODO Auto Generated method stub
			setPKMode(MainRoleManager.actor.data.pkMode);
		}
		private function initPK():void
		{
			_pkBtns=[_skin.btn_heping,_skin.btn_duiwu,_skin.btn_banghui,_skin.btn_quanti];//刚好和pk模式对应
			setPkCellData(_skin.heping,PKModeType.PEACE);
			setPkCellData(_skin.duiwu,PKModeType.TEAM);
			setPkCellData(_skin.banghui,PKModeType.GUILD);
			setPkCellData(_skin.quanti,PKModeType.ALL);
			onPKModelChange();
			_skin.heping.width=_skin.duiwu.width=_skin.banghui.width=_skin.quanti.width=295;
			this._skin.grp_select.width=305;
			this._skin.grp_select.visible=false;
		}
		private function setPkCellData(s:SkinnableContainer,pk:int):void
		{
			var str:String;
			var text:String="";
			//s.touchGroup=true;
			switch(pk)
			{
				case PKModeType.PEACE:
				{
					str="ui/art_txt/mainui/head/mode/he.png";
					text=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"【和平】")+HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"您的攻击不会对任何玩家造成伤害");
					break;
				}
				case PKModeType.TEAM:
				{
					str="ui/art_txt/mainui/head/mode/dui.png";
					text=HtmlTextUtil.getTextColor(StaticValue.BLUE_TEXT,"【组队】")+HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"您的攻击不会误伤同队伍玩家");
					break;		
				}
				case PKModeType.GUILD:
				{
					str="ui/art_txt/mainui/head/mode/bang.png";
					text=HtmlTextUtil.getTextColor(StaticValue.YELLOW_TEXT,"【帮会】")+HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"您的攻击不会误伤同帮会玩家");
					break;
				}
				case PKModeType.ALL:
				{
					str="ui/art_txt/mainui/head/mode/quan.png";
					text=HtmlTextUtil.getTextColor(StaticValue.RED_TEXT,"【全体】")+HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"您的攻击会对任何玩家造成伤害");
					break;
				}
				default:
				{				
					str="ui/art_txt/mainui/head/mode/he.png";
					text=HtmlTextUtil.getTextColor(StaticValue.GREEN_TEXT,"【和平模式】")+HtmlTextUtil.getTextColor(StaticValue.BEIGE_TEXT,"您的攻击不会对任何玩家造成伤害");
					break;
				}
			}
			(s.skin as Head_Select).Icon_heping.styleName=str;
			(s.skin as Head_Select).labelDisplay.isHtmlText=true;
			(s.skin as Head_Select).labelDisplay.text=text;
		}
		private function updateFight():void
		{
			var info:HeroData=MainRoleManager.actorInfo;
			this._skin.role_zhandouli.number = info.totalStat.getStatValue(CharAttributeType.FIGHTING);
			this._skin.lbLevel.text=info.totalStat.level.toString();
			var arr:Array= info.name.split(']');
			if(arr.length>1)	
				this._skin.role_name.text = arr[1];
			else this._skin.role_name.text = info.name;
		}
		
		private function updateAll():void
		{
			var info:HeroData=MainRoleManager.actorInfo;
			
			this._skin.UI_bingjia.visible = JobEnum.ROLE_1_TYPE==info.job;
			this._skin.UI_mojia.visible = JobEnum.ROLE_2_TYPE==info.job||JobEnum.ROLE_3_TYPE==info.job;
			this._skin.UI_yijia.visible = JobEnum.ROLE_4_TYPE==info.job;
			this._skin.icon.styleName=AssetUrl.getRoleHeadUrl(info.job,info.sex);		
			updateFight();
		}
		
		public function resize(w : int, h : int) : void {
			this.x = 0;
			this.y = 7;//28;
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			switch (target) {
				case this._skin.btn_banghui:
				case this._skin.btn_duiwu:
				case this._skin.btn_heping:
				case this._skin.btn_quanti:
					this.showPKMode(target);
					break;
				case this._skin.icon:
					// 医家
					if (JobEnum.ROLE_4_TYPE == MainRoleManager.actorInfo.job) {
						SceneRoleSelectManager.selectedRole = MainRoleManager.actor;
					}
					break;
				case this._skin.btnVip:
					Mgr.vipMgr.iWantBecomeVip();
					break;
				default:
				{
					switch(target.parent)
					{
						case this._skin.heping:
							reqChangePkMode(PKModeType.PEACE);
							break;
						case this._skin.duiwu:
							reqChangePkMode(PKModeType.TEAM);
							break;
						case this._skin.banghui:
							reqChangePkMode(PKModeType.GUILD);
							break;
						case this._skin.quanti:
							reqChangePkMode(PKModeType.ALL);
							break;
					}
				}
					//pk
					
			}
		}
		
		private function reqChangePkMode(pk:int):void
		{
			this._skin.grp_select.visible=false;
			PKMamager.HeroSetPKMode(pk);
			_timenum=PKMamager.PK_MODE_CHANG_LIMIT_TIME/1000;
			TimerServer.addLoop(updateTimeBtnShow,1000);
			updateTimeBtnShow();
		}
		
		private function updateTimeBtnShow():void
		{
			_timenum--;
			if(_timenum==0)
			{
				TimerServer.remove(updateTimeBtnShow);
				setPKModeState(true);
			}
			else
			{
				setPKModeState(false);
			}
		}
		
		public function setPKModeState(bool:Boolean):void
		{
			var len:int=_pkBtns.length;
			for (var i:int = 0; i < len; i++) 
			{
				if(bool)
				{
					(_pkBtns[i] as Button).filter=null;
				}
				else
					GrayFilter.gray(_pkBtns[i]);
			}
		}
		// private
		private function showPKMode(target : DisplayObject) : void 
		{
			this._skin.grp_select.visible=!this._skin.grp_select.visible;
		}
		public function setPKMode(pk:int):void
		{
			var len:int=_pkBtns.length;
			for (var i:int = 0; i < len; i++) 
			{
				_pkBtns[i].visible=pk==i;
			}
		}
		
		//buff相关 主要显示常态BUFF
		private function initBuff():void
		{
			_buffList=new Vector.<BuffIcon>();
			var buffList : Vector.<BuffData>=(MainRoleManager.actor.data as RoleData).buffList;
			var num:int=buffList.length;
			for(var i:int=0;i<num;i++){
				var data:BuffData=buffList[i];
				if(data._data.q_effect_time==-1||EnumBuff.isVip(data.cfgId))
					createIcon(data);
			}
		}
		
		private function createIcon(data:BuffData):void
		{
			if(data.buffData.q_icon_show==0||isCreate(data)){
				return;
			}
			var icon:BuffIcon=new BuffIcon(IcoSizeEnum.ICON_19);
			icon.buffData=data;
			icon.setUrlBg("ui/mainui/head/BAFF/buffBg_20.png");
			_buffList.push(icon);
			_buffContainer.addChild(icon);		
			updatePoint();
		}
		
		private function isCreate(data:BuffData):Boolean
		{
			var icon:BuffIcon;
			var num:int=_buffList.length;
			for(var i:int=0;i<num;i++){
				icon=_buffList[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					icon.buffData=data;
					return true;
				}
			}
			return false;
		}
		
		private function removeBuff(buffData:BuffData):void
		{
			if(buffData.roleId!=MainRoleManager.actor.id||buffData._data.q_effect_time!=-1){
				return;
			}
			removeForDatas(buffData);
		}
		
		private function removeForDatas(buffData:BuffData):void
		{
			var icon:BuffIcon;
			var num:int,i:int;
			num=_buffList.length;
			for  (i=0;i<num;i++) 
			{
				icon=_buffList[i];
				if(icon.buffData.buffData.q_buff_id==buffData.buffData.q_buff_id){
					_buffContainer.removeChild(icon);
					icon.dispose();
					_buffList.splice(i,1);
					updatePoint();
					break;
				}
			}
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var t:Touch=e.getTouch(_skin.heping);
			if(!t){
				(_skin.heping.skin as Head_Select).ui_conver.visible=false;
			}
			else
			{
				t=e.getTouch(_skin.heping,TouchPhase.HOVER);
				if(t){			
					(_skin.heping.skin as Head_Select).ui_conver.visible=true;
				}
			}
			
			t=e.getTouch(_skin.duiwu);
			if(!t){
				(_skin.duiwu.skin as Head_Select).ui_conver.visible=false;
			}
			else
			{
				t=e.getTouch(_skin.duiwu,TouchPhase.HOVER);
				if(t){			
					(_skin.duiwu.skin as Head_Select).ui_conver.visible=true;
				}
			}
			
			t=e.getTouch(_skin.banghui);
			if(!t){
				(_skin.banghui.skin as Head_Select).ui_conver.visible=false;
			}
			else
			{
				t=e.getTouch(_skin.banghui,TouchPhase.HOVER);
				if(t){			
					(_skin.banghui.skin as Head_Select).ui_conver.visible=true;
				}
			}
			
			t=e.getTouch(_skin.quanti);
			if(!t){
				(_skin.quanti.skin as Head_Select).ui_conver.visible=false;
			}
			else
			{
				t=e.getTouch(_skin.quanti,TouchPhase.HOVER);
				if(t){			
					(_skin.quanti.skin as Head_Select).ui_conver.visible=true;
				}
			}
		}
		
		private function addBuff(buffData:BuffData):void
		{
			if(buffData.roleId!=MainRoleManager.actor.id){
				return;
			}
			if (!EnumBuff.isVip(buffData.cfgId)&&buffData._data.q_effect_time!=-1) 
			{
				return;
			}
			createIcon(buffData);
		}
		
		private function updatePoint():void
		{
			if(_buffList==null||_buffList.length==0) return;
			var length:int,line:int,row:int;
			length=_buffList.length;
			for(var i:int=0;i<length;i++)
			{
				var icon:BuffIcon=_buffList[i];
				line=i%MAX_SHOW_NUM;
				row=int(i/MAX_SHOW_NUM);
				icon.x=line*gridW;
				icon.y=row*gridW;
			}
		}
		private var _goldGlobal:Point;
		public function getGoldPos():Point
		{
			if (!_goldGlobal) 
			{
				_goldGlobal=new Point();
				_goldGlobal=_skin.uiYuanbao.localToGlobal(new Point(12,12),_goldGlobal);
			}
			return _goldGlobal;
		}
		private var _bindGoldGlobal:Point;
		public function getBindGoldPos():Point
		{
			if (!_bindGoldGlobal) 
			{
				_bindGoldGlobal=new Point();
				_bindGoldGlobal=_skin.uiLijin.localToGlobal(new Point(12,12),_bindGoldGlobal);
			}
			return _bindGoldGlobal;
		}
		
	}
}
