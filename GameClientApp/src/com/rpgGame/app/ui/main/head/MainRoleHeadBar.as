package com.rpgGame.app.ui.main.head {
	import com.game.engine3D.display.Inter3DContainer;
	import com.game.engine3D.display.InterObject3D;
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.PKMamager;
	import com.rpgGame.app.manager.role.MainRoleManager;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.view.icon.BuffIcon;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.cfg.ClientConfig;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.coreData.type.CharAttributeType;
	import com.rpgGame.coreData.type.EffectUrl;
	import com.rpgGame.coreData.type.PKModeType;
	
	import feathers.controls.SkinnableContainer;
	import feathers.controls.UIAsset;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.head.Head_Select;
	import org.mokylin.skin.mainui.head.head_main_Skin;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	
	public class MainRoleHeadBar extends SkinUI {
		private var _skin : head_main_Skin;
		
		private var _zhandouliEftContaner:Inter3DContainer;
		private var _zhandouliEft:InterObject3D;
		private var _headImg:UIAsset;
		private var _pkBtns:Array;
		
		private var gridW:int;
		private var _buffList:Vector.<BuffIcon>;
		private var _buffContainer:Sprite;
		private const MAX_SHOW_NUM:int=4;
		
		public function MainRoleHeadBar() {
			this._skin = new head_main_Skin();
			super(this._skin);
			this._skin.btn_banghui.visible = false;
			this._skin.btn_duiwu.visible = false;
			this._skin.btn_heping.visible = true;
			this._skin.btn_quanti.visible = false;
			_headImg=new UIAsset();
			_headImg.x=18;
			_headImg.y=4;
			_skin.container.addChildAt(_headImg,1);
			_zhandouliEftContaner=new Inter3DContainer();
			_skin.container.addChildAt(_zhandouliEftContaner,1);
			_zhandouliEftContaner.playInter3DAt(ClientConfig.getEffect(EffectUrl.UI_JIEMIAN_ZHANDOULI),160,55,0);
			
			_buffContainer=new Sprite();
			_skin.container.addChild(_buffContainer);
			_buffContainer.x=104;
			_buffContainer.y=65;
			gridW=IcoSizeEnum.ICON_24+9;
			// event
		
			updateAll();
			initPK();
			initBuff();
		}
		
		override protected function onShow():void
		{
			super.onShow();
			EventManager.addEvent(BuffEvent.ADD_BUFF, addBuff);
			EventManager.addEvent(BuffEvent.REMOVE_BUFF, removeBuff);
			EventManager.addEvent(MainPlayerEvent.STAT_CHANGE,updateFight);//基本属性改变
			EventManager.addEvent(MainPlayerEvent.PK_MODE_CHANGE,onPKModelChange);
		}
		
		override protected function onHide() : void
		{
			super.onHide();
			EventManager.removeEvent(BuffEvent.ADD_BUFF, addBuff);
			EventManager.removeEvent(BuffEvent.REMOVE_BUFF, removeBuff);
			EventManager.removeEvent(MainPlayerEvent.STAT_CHANGE,updateFight);//基本属性改变
			EventManager.removeEvent(MainPlayerEvent.PK_MODE_CHANGE,onPKModelChange);
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
					str="ui/mainui/head/button/skin_heping/up.png";
					text="【和平模式】您的攻击不会对任何玩家造成伤害"
					break;
				}
				case PKModeType.TEAM:
				{
					str="ui/mainui/head/button/skin_duiwu/up.png";
					text="【组队模式】您的攻击不会误伤同队伍玩家"
					break;
					
				}
				case PKModeType.GUILD:
				{
					str="ui/mainui/head/button/skin_banghui/up.png";
					text="【帮会模式】您的攻击不会误伤同帮会玩家"
					break;
				}
				case PKModeType.ALL:
				{
					str="ui/mainui/head/button/skin_quanti/up.png";
					text="【全体模式】您的攻击会对任何玩家造成伤害"
					break;
				}
				default:
				{
					
					str="ui/mainui/head/button/skin_heping/up.png";
					text="【和平模式】您的攻击不会对任何玩家造成伤害"
					break;
				}
			}
			(s.skin as Head_Select).Icon_heping.styleName=str;
			(s.skin as Head_Select).labelDisplay.text=text;
		}
		private function updateFight():void
		{
			var info:HeroData=MainRoleManager.actorInfo;
			this._skin.role_zhandouli.number = info.totalStat.getStatValue(CharAttributeType.FIGHTING);
			this._skin.role_name.text = info.name + " (" + info.totalStat.level +"级)";
		}
		
		private function updateAll():void
		{
			var info:HeroData=MainRoleManager.actorInfo;
			
			this._skin.UI_bingjia.visible = JobEnum.ROLE_1_TYPE==info.job;
			this._skin.UI_mojia.visible = JobEnum.ROLE_2_TYPE==info.job||JobEnum.ROLE_3_TYPE==info.job;
			this._skin.UI_yijia.visible = JobEnum.ROLE_4_TYPE==info.job;
			//styleName = "ui/mainui/head/zhiye/bingjia.png";
			switch(info.job){
				case JobEnum.ROLE_1_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_1;
					break;
				case JobEnum.ROLE_2_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_2;
					break;
				case JobEnum.ROLE_3_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_3;
					break;
				case JobEnum.ROLE_4_TYPE:
					_headImg.styleName=AssetUrl.HEAD_ICON_4;
					break;
			}
			
			updateFight();
		}
		
		public function resize(w : int, h : int) : void {
			this.x = 0;
			this.y = 29;//28;
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void {
			switch (target) {
				case this._skin.btn_banghui:
				case this._skin.btn_duiwu:
				case this._skin.btn_heping:
				case this._skin.btn_quanti:
					this.showPKMode(target);
					break;
				case this._headImg:
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
				if(data._data.q_effect_time==-1)
					createIcon(data);
			}
		}
		
		private function createIcon(data:BuffData):void
		{
			if(data.buffData.q_icon_show==0||isCreate(data)){
				return;
			}
			var icon:BuffIcon=new BuffIcon(IcoSizeEnum.ICON_24);
			icon.buffData=data;
			icon.setUrlBg("ui/mainui/shortcut/buffkuang.png");
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
		
		private function addBuff(buffData:BuffData):void
		{
			if(buffData.roleId!=MainRoleManager.actor.id||buffData._data.q_effect_time!=-1){
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
	}
}
