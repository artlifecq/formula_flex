package com.rpgGame.appModule.battle.wczb
{
	import com.rpgGame.app.display3D.InterAvatar3D;
	import com.rpgGame.app.manager.AvatarManager;
	import com.rpgGame.app.ui.tab.ViewUI;
	import com.rpgGame.app.view.icon.IconCDFace;
	import com.rpgGame.coreData.enum.item.IcoSizeEnum;
	import com.rpgGame.coreData.role.HeroData;
	import com.rpgGame.coreData.role.RoleData;
	
	import feathers.controls.StateSkin;
	
	import org.client.mainCore.ds.HashMap;
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengHead_Item;
	import org.mokylin.skin.app.zhanchang.wangchengzhengba.WangChengZhengBa;
	
	import starling.display.DisplayObject;
	
	/**
	 *战场之王城争霸 
	 * @author dik
	 * 
	 */
	public class WczbView extends ViewUI
	{
		private var _skin:WangChengZhengBa;
		private var _rewards:Vector.<IconCDFace>;
		private var roleDatas:HashMap;
		private var avatars:HashMap;
		
		public function WczbView()
		{
			_skin=new WangChengZhengBa();
			super(_skin);
			initView();
		}
		
		private function initView():void
		{
			_rewards=new Vector.<IconCDFace>();
			roleDatas=new HashMap();
			avatars=new HashMap();			
			
			setHeadSkin(_skin.head1.skin,"3");
			setHeadSkin(_skin.head2.skin,"2");
			setHeadSkin(_skin.head3.skin,"1");
			setHeadSkin(_skin.head4.skin,"2");
			setHeadSkin(_skin.head5.skin,"3");
		}
		
		private function setHeadSkin(head:StateSkin,skin:String):void
		{
			(head as WangChengHead_Item).uiHead.styleName="ui/app/zhanchang/weicheng/"+skin+".png";
		}
		
		override public function show(data:Object=null):void
		{
			for(var i:int=0;i<4;i++){
				_rewards.push(IconCDFace.create(IcoSizeEnum.ICON_48));
				_skin.container.addChild(_rewards[i]);
				_rewards[i].x=93+i*60;
				_rewards[i].y=513;
			}
		}
		
		override public function hide():void
		{
			
		}
		
		override protected function onTouchTarget(target:DisplayObject):void
		{
			super.onTouchTarget(target);
			switch(target){
				case _skin.btnLingQu:
					break;
				case _skin.lbJiangli:
					break;
			}
		}
		
		/**
		 *根据职位设置模型 
		 * @param job
		 * @param data
		 * 
		 */
		private function updateRoleModel(job:int,data:HeroData):void
		{
			var roleData:RoleData=roleDatas.getValue(job);
			roleData.avatarInfo.setBodyResID(data.avatarInfo.bodyResID, data.avatarInfo.bodyAnimatResID);
			roleData.avatarInfo.hairResID = data.avatarInfo.hairResID;
			roleData.avatarInfo.weaponResID = data.avatarInfo.weaponResID;
			roleData.avatarInfo.weaponEffectID = data.avatarInfo.weaponEffectID;
			roleData.avatarInfo.weaponEffectScale = data.avatarInfo.weaponEffectScale;
			roleData.avatarInfo.deputyWeaponResID = data.avatarInfo.deputyWeaponResID;
			roleData.avatarInfo.deputyWeaponEffectID=data.avatarInfo.deputyWeaponEffectID;
			roleData.avatarInfo.deputyWeaponEffectScale=data.avatarInfo.deputyWeaponEffectScale;
			
			var avatar:InterAvatar3D=avatars.getValue(job);
			avatar.setRoleData(roleData);
			avatar.curRole.setScale(1.7);	
		}
		
		private function setHeadData(target:WangChengHead_Item,res:String,name:String,lv:int):void
		{
			target.uiHead.styleName=res;
			target.lbName.htmlText=name+"["+lv+"]";
		}
	}
}