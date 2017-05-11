package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.app.manager.Mgr;
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.LookSender;
	import com.rpgGame.app.view.icon.BuffIcon;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.BuffEvent;
	import com.rpgGame.core.events.LookEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.core.view.uiComponent.face.cd.CDDataManager;
	import com.rpgGame.coreData.enum.JobEnum;
	import com.rpgGame.coreData.enum.face.FaceTypeEnum;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.info.buff.BuffData;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	import com.rpgGame.coreData.type.AssetUrl;
	import com.rpgGame.netData.player.bean.OthersInfo;
	
	import feathers.controls.UIAsset;
	
	import gs.TweenLite;
	import gs.easing.Bounce;
	
	import org.client.mainCore.manager.EventManager;
	import org.mokylin.skin.mainui.head.head_max_Skin;
	
	import starling.display.DisplayObject;
	import starling.events.Event;
	
	/**
	 *玩家头像 
	 * @author dik
	 * 
	 */
	public class RoleHeadBar extends SkinUI
	{
		private var _skin:head_max_Skin;
		private var _headImg:UIAsset;
		private var _roleData:HeroData;
		private var tween:TweenLite;
		private var goodBuffs:Vector.<BuffIcon>;
		private var badBuffs:Vector.<BuffIcon>;
		
		public function RoleHeadBar()
		{
			_skin=new head_max_Skin();
			super(_skin);
			
			initView();
		}
		
		private function initView():void
		{
			_headImg=new UIAsset();
			_headImg.x=18;
			_headImg.y=-9;
			_skin.container.addChildAt(_headImg,3);
			goodBuffs=new Vector.<BuffIcon>();
			badBuffs=new Vector.<BuffIcon>();

		}
		
	
		
		override public function refresh():void
		{
			var selectedRole:SceneRole=SceneRoleSelectManager.selectedRole;
			_roleData=SceneRoleSelectManager.selectedRole.data as HeroData;
			updateNormal();
			updateAttInfo();
			updateBuff();
			
			this.x=330;
			this.y=42;
			this.alpha=0.5;
			tween=	TweenLite.to(this, 0.5, {x:283,y:42,alpha:1, ease:Bounce.easeOut,onComplete:onTween});
			initEvent();
		}
		
		private function updateBuff():void
		{
			var buffList : Vector.<BuffData>=_roleData.buffList;
			var num:int=buffList.length;			
			for(var i:int=0;i<num;i++){
				var data:BuffData=buffList[i];
				createIcon(data);
			}
		}
		
		private function isCreate(data:BuffData):Boolean
		{
			var icon:BuffIcon;
			var num:int=goodBuffs.length;
			for(var i:int=0;i<num;i++){
				icon=goodBuffs[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					return true;
				}
			}
			num=badBuffs.length;
			for(i=0;i<num;i++){
				icon=badBuffs[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					return true;
				}
			}
			
			return false;
		}
		
		private function createIcon(data:BuffData):void
		{
			if(data.buffData.q_icon_show==0||isCreate(data)){
				return;
			}
			var icon:BuffIcon=new BuffIcon(IcoSizeEnum.ICON_24);
			icon.buffData=data;
			
			if(data.buffData.q_effect_type==2){//负面
				badBuffs.push(icon);
			}else{
				goodBuffs.push(icon);
			}
			var gridW:int=IcoSizeEnum.ICON_24+2;
			var startX:int=95;
			for(var i:int=0;i<goodBuffs.length;i++){//buff
				icon=goodBuffs[i];
				icon.x=startX;
				icon.y=52;
				this.addChild(icon);
				startX=icon.x+gridW;
			}
			for(i=0;i<badBuffs.length;i++){//debuff
				icon=badBuffs[i];
				icon.x=startX;
				icon.y=52;
				this.addChild(icon);
				startX=icon.x+gridW;
			}
		}
		
		private function addBuff(buffData:BuffData):void
		{
			if(buffData.roleId!=_roleData.id){
				return;
			}
			createIcon(buffData);
		}
		
		private function removeBuff(data:BuffData):void
		{
			if(data.roleId!=_roleData.id){
				return;
			}
			if(data.buffData.q_effect_type==2){//负面
				removeForDatas(data,badBuffs);
			}else{
				removeForDatas(data,goodBuffs);
			}
		}
		
		private function removeForDatas(data:BuffData,datas:Vector.<BuffIcon>):void
		{
			var icon:BuffIcon;
			var num:int=datas.length;
			for  (var i:int=0;i<num;i++) 
			{
				icon=datas[i];
				if(icon.buffData.buffData.q_buff_id==data.buffData.q_buff_id){
					datas.splice(i,1);
					icon.dispose();
					break;
				}
			}
			num=datas.length;
			var changW:int;
			var gridW:int=IcoSizeEnum.ICON_24+2;
			changW=-1*gridW;
			
			var startX:int=95;
			for(i=0;i<goodBuffs.length;i++){//buff
				icon=goodBuffs[i];
				icon.x=startX;
				icon.y=52;
				this.addChild(icon);
				startX=icon.x+gridW;
			}
			for(i=0;i<badBuffs.length;i++){//debuff
				icon=badBuffs[i];
				icon.x=startX;
				icon.y=52;
				this.addChild(icon);
				startX=icon.x+gridW;
			}
		}
		
		private  function getKey(id : int) : String
		{
			return FaceTypeEnum.BUFF+"_"+_roleData.id + "_" + id;
		}
		
		private function onTween():void
		{
			tween.kill();
			tween=null;
		}
		
		
		public function resize(w : int, h : int) : void {
			if(tween){
				return;
			}
			this.x = 283;
			this.y = 42;//28;
		}
		
		private function initEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.NOWHP_CHANGE, changeAtt);			
			EventManager.addEvent(MainPlayerEvent.MAXHP_CHANGE, changeAtt);			
			EventManager.addEvent(BuffEvent.ADD_BUFF, addBuff);
			EventManager.addEvent(BuffEvent.REMOVE_BUFF, removeBuff);
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
				switch (target) {
					case this._skin.btn_cha:
						EventManager.addEvent(LookEvent.ROLE_INFO,onRoleInfo);
						LookSender.lookOtherPlayer(_roleData.serverID);
						break;
					case this._skin.btn_zu:
						Mgr.teamMgr.reqCreateTeamWithPlayer(_roleData.serverID);
						break;
				}
		}
		
		private function onRoleInfo(info:OthersInfo):void
		{
			EventManager.removeEvent(LookEvent.ROLE_INFO,onRoleInfo);
			
			_roleData.totalStat.setData(info.attributeList);
			_roleData.totalStat.setResDatas(info.resourceData);
			_roleData.sex=info.sex;
			_roleData.job=info.job;
			_roleData.societyName=info.guildName;
			
			_roleData.maxExp=info.maxExp.fValue;
			_roleData.maxZhenqi=info.maxZhenQi.fValue;
			_roleData.curExp=info.exp.fValue;
			var data:Object={roleData:_roleData,info:info};
			AppManager.showApp(AppConstant.PLAYERINFO_PANEL,data);
		}
		
		override protected function onHide():void
		{
			super.onHide();
			EventManager.removeEvent(MainPlayerEvent.NOWHP_CHANGE, changeAtt);			
			EventManager.removeEvent(MainPlayerEvent.MAXHP_CHANGE, changeAtt);			
			EventManager.removeEvent(BuffEvent.ADD_BUFF, addBuff);
			EventManager.removeEvent(BuffEvent.REMOVE_BUFF, removeBuff);
			
			var icon:BuffIcon;
			while(goodBuffs.length>0){
				icon=goodBuffs.pop();
				icon.dispose();
			}
			while(badBuffs.length>0){
				icon=badBuffs.pop();
				icon.dispose();
			}
		}
		
		private function changeAtt(data:RoleData):void
		{
			if(data.id!=_roleData.id){
				return;
			}
			updateAttInfo();
		}
		
		private function updateAttInfo():void
		{
			var maxHp:int=_roleData.totalStat.life;
			var hp:int=_roleData.totalStat.hp;
			var scaleX:Number=hp/maxHp;
			scaleX=scaleX>1?1:scaleX;
			_skin.role_xuecao.scaleX=scaleX;
			this._skin.lbl_num.text=hp+"/"+maxHp;
		}
		
		/**
		 *更新普通信息 
		 * 
		 */
		private function updateNormal():void
		{
			this._skin.role_name.text = _roleData.name + " (" + _roleData.totalStat.level +"级)";
			this._skin.UI_bingjia.visible = JobEnum.ROLE_1_TYPE==_roleData.job;
			this._skin.UI_mojia.visible = JobEnum.ROLE_2_TYPE==_roleData.job||JobEnum.ROLE_3_TYPE==_roleData.job;
			this._skin.UI_yijia.visible = JobEnum.ROLE_4_TYPE==_roleData.job;
			
			switch(_roleData.job){
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
		}
	}
}