package com.rpgGame.app.ui.main.head
{
	import com.rpgGame.app.manager.role.SceneRoleSelectManager;
	import com.rpgGame.app.scene.SceneRole;
	import com.rpgGame.app.sender.LookSender;
	import com.rpgGame.core.app.AppConstant;
	import com.rpgGame.core.app.AppManager;
	import com.rpgGame.core.events.LookEvent;
	import com.rpgGame.core.events.MainPlayerEvent;
	import com.rpgGame.core.ui.SkinUI;
	import com.rpgGame.coreData.enum.JobEnum;
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
		}
		
		override public function refresh():void
		{
			var selectedRole:SceneRole=SceneRoleSelectManager.selectedRole;
			_roleData=SceneRoleSelectManager.selectedRole.data as HeroData;
			updateNormal();
			updateAttInfo();
			
			this.x=330;
			this.y=42;
			this.alpha=0.5;
			tween=	TweenLite.to(this, 0.5, {x:283,y:42,alpha:1, ease:Bounce.easeOut,onComplete:onTween});
			intiEvent();
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
		
		private function intiEvent():void
		{
			EventManager.addEvent(MainPlayerEvent.NOWHP_CHANGE, changeAtt);			
			EventManager.addEvent(MainPlayerEvent.MAXHP_CHANGE, changeAtt);			
		}
		
		override protected function onTouchTarget(target : DisplayObject) : void 
		{
				switch (target) {
					case this._skin.btn_cha:
						EventManager.addEvent(LookEvent.ROLE_INFO,onRoleInfo);
						LookSender.lookOtherPlayer(_roleData.serverID);
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